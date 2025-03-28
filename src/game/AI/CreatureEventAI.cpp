/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Common.h"
#include "Creature.h"
#include "CreatureEventAI.h"
#include "CreatureEventAIMgr.h"
#include "Player.h"
#include "SpellAuras.h"
#include "Chat.h"
#include "Language.h"
#include "GuardMgr.h"
#include "Conditions.h"
#include "Map.h"

bool CreatureEventAIHolder::UpdateRepeatTimer(Creature* creature, uint32 repeatMin, uint32 repeatMax)
{
    if (repeatMin == repeatMax)
        Time = repeatMin;
    else if (repeatMax > repeatMin)
        Time = urand(repeatMin, repeatMax);
    else
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CreatureEventAI: Creature %u using Event %u (Type = %u) has RandomMax < RandomMin. Event repeating disabled.", creature->GetEntry(), Event.event_id, Event.event_type);
        Enabled = false;
        return false;
    }

    return true;
}

int CreatureEventAI::Permissible(Creature const* creature)
{
    if (creature->GetAIName() == "EventAI")
        return PERMIT_BASE_SPECIAL;
    return PERMIT_BASE_NO;
}

void CreatureEventAI::GetAIInformation(ChatHandler& reader)
{
    reader.PSendSysMessage(LANG_NPC_EVENTAI_PHASE, (uint32)m_Phase);
}

CreatureEventAI::CreatureEventAI(Creature* c) : BasicAI(c)
{
    // Need make copy for filter unneeded steps and safe in case table reload
    CreatureEventAI_Event_Map::const_iterator creatureEventsItr = sEventAIMgr.GetCreatureEventAIMap().find(c->GetEntry());
    if (creatureEventsItr != sEventAIMgr.GetCreatureEventAIMap().end())
    {
        CreatureEventAI_Event_Vec const& creatureEvent = creatureEventsItr->second;
        m_CreatureEventAIList.reserve(creatureEvent.size());
        for (const auto& i : creatureEvent)
        {

            //Debug check
#ifndef _DEBUG
            if (i.event_flags & EFLAG_DEBUG_ONLY)
                continue;
#endif

            if (i.event_type == EVENT_T_OOC_LOS)
                c->EnableMoveInLosEvent();

            m_CreatureEventAIList.push_back(CreatureEventAIHolder(i));
        }
    }
    else
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "CreatureEventAI: EventMap for Creature %u is empty but creature is using CreatureEventAI.", m_creature->GetEntry());

    m_bEmptyList = m_CreatureEventAIList.empty();
    m_Phase = 0;

    //Handle Spawned Events
    c->SetAI(this);
    if (!m_bEmptyList)
    {
        for (auto& i : m_CreatureEventAIList)
            if (i.Event.event_type == EVENT_T_SPAWNED)
                ProcessEvent(i);
    }
    Reset();
}

bool CreatureEventAI::ProcessEvent(CreatureEventAIHolder& pHolder, SpellCaster* pActionInvoker)
{
    if (!pHolder.Enabled || pHolder.Time)
        return false;

    //Check the inverse phase mask (event doesn't trigger if current phase bit is set in mask)
    if (pHolder.Event.event_inverse_phase_mask & (1 << m_Phase))
        return false;

    if ((pHolder.Event.event_flags & EFLAG_NOT_CASTING) && m_creature->IsNonMeleeSpellCasted(false, false, true))
        return false;

    if (pHolder.Event.condition_id && !IsConditionSatisfied(pHolder.Event.condition_id, pActionInvoker ? pActionInvoker : m_creature->GetVictim(), m_creature->GetMap(), m_creature, CONDITION_FROM_EVENTAI))
        return false;

    CreatureEventAI_Event const& event = pHolder.Event;

    //Check event conditions based on the event type, also reset events
    switch (event.event_type)
    {
        case EVENT_T_TIMER_IN_COMBAT:
        {
            if (!m_creature->IsInCombat())
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.timer.repeatMin, event.timer.repeatMax);
            break;
        }
        case EVENT_T_TIMER_OOC:
        {
            if (m_creature->IsInCombat() || m_creature->IsInEvadeMode())
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.timer.repeatMin, event.timer.repeatMax);
            break;
        }
        case EVENT_T_HP:
        {
            if (!m_creature->IsInCombat() || !m_creature->GetMaxHealth())
                return false;

            uint32 perc = (m_creature->GetHealth() * 100) / m_creature->GetMaxHealth();

            if (perc > event.percent_range.percentMax || perc < event.percent_range.percentMin)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.percent_range.repeatMin, event.percent_range.repeatMax);
            break;
        }
        case EVENT_T_MANA:
        {
            if (!m_creature->IsInCombat() || !m_creature->GetMaxPower(POWER_MANA))
                return false;

            uint32 perc = (m_creature->GetPower(POWER_MANA) * 100) / m_creature->GetMaxPower(POWER_MANA);

            if (perc > event.percent_range.percentMax || perc < event.percent_range.percentMin)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.percent_range.repeatMin, event.percent_range.repeatMax);
            break;
        }
        case EVENT_T_AGGRO:
        {
            break;
        }
        case EVENT_T_KILL:
        {
            if (event.kill.playerOnly && !pActionInvoker->IsPlayer())
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.kill.repeatMin, event.kill.repeatMax);
            break;
        }
        case EVENT_T_DEATH:
        case EVENT_T_EVADE:
        case EVENT_T_LEAVE_COMBAT:
        {
            break;
        }
        case EVENT_T_HIT_BY_SPELL:
        case EVENT_T_SPELL_HIT_TARGET:
        {
            //Spell hit is special case, param1 and param2 handled within CreatureEventAI::SpellHit

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.hit_by_spell.repeatMin, event.hit_by_spell.repeatMax);
            break;
        }
        case EVENT_T_RANGE:
        {
            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.range.repeatMin, event.range.repeatMax);
            break;
        }
        case EVENT_T_OOC_LOS:
        {
            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.ooc_los.repeatMin, event.ooc_los.repeatMax);
            break;
        }
        case EVENT_T_SPAWNED:
        {
            break;
        }
        case EVENT_T_TARGET_HP:
        {
            if (!m_creature->IsInCombat() || !m_creature->GetVictim() || !m_creature->GetVictim()->GetMaxHealth())
                return false;

            uint32 perc = (m_creature->GetVictim()->GetHealth() * 100) / m_creature->GetVictim()->GetMaxHealth();

            if (perc > event.percent_range.percentMax || perc < event.percent_range.percentMin)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.percent_range.repeatMin, event.percent_range.repeatMax);
            break;
        }
        case EVENT_T_TARGET_CASTING:
            if (!m_creature->IsInCombat() || !m_creature->GetVictim() || !m_creature->GetVictim()->IsNonMeleeSpellCasted(false, false, true))
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.target_casting.repeatMin, event.target_casting.repeatMax);
            break;
        case EVENT_T_FRIENDLY_HP:
        {
            if (!m_creature->IsInCombat())
                return false;

            Unit* pUnit = m_creature->FindLowestHpFriendlyUnit((float)event.friendly_hp.radius, event.friendly_hp.hpDeficit);

            if (!pUnit)
                return false;

            pActionInvoker = pUnit;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.friendly_hp.repeatMin, event.friendly_hp.repeatMax);
            break;
        }
        case EVENT_T_FRIENDLY_IS_CC:
        {
            if (!m_creature->IsInCombat())
                return false;

            Unit* pUnit = m_creature->FindFriendlyUnitCC((float)event.friendly_is_cc.radius);

            if (!pUnit)
                return false;

            pActionInvoker = pUnit;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.friendly_is_cc.repeatMin, event.friendly_is_cc.repeatMax);
            break;
        }
        case EVENT_T_FRIENDLY_MISSING_BUFF:
        {
            Unit* pUnit = m_creature->FindFriendlyUnitMissingBuff((float)event.friendly_buff.radius, event.friendly_buff.spellId);

            if (!pUnit)
                return false;

            pActionInvoker = pUnit;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.friendly_buff.repeatMin, event.friendly_buff.repeatMax);
            break;
        }
        case EVENT_T_SUMMONED_UNIT:
        case EVENT_T_SUMMONED_JUST_DIED:
        case EVENT_T_SUMMONED_JUST_DESPAWN:
        {
            //Prevent event from occuring on no unit or non creatures
            if (!pActionInvoker || pActionInvoker->GetTypeId() != TYPEID_UNIT)
                return false;

            //Creature id doesn't match up
            if (((Creature*)pActionInvoker)->GetEntry() != event.summoned.creatureId)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.summoned.repeatMin, event.summoned.repeatMax);
            break;
        }
        case EVENT_T_TARGET_MANA:
        {
            if (!m_creature->IsInCombat() || !m_creature->GetVictim() || !m_creature->GetVictim()->GetMaxPower(POWER_MANA))
                return false;

            uint32 perc = (m_creature->GetVictim()->GetPower(POWER_MANA) * 100) / m_creature->GetVictim()->GetMaxPower(POWER_MANA);

            if (perc > event.percent_range.percentMax || perc < event.percent_range.percentMin)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.percent_range.repeatMin, event.percent_range.repeatMax);
            break;
        }
        case EVENT_T_REACHED_HOME:
        case EVENT_T_RECEIVE_EMOTE:
        {
            break;
        }
        case EVENT_T_AURA:
        {
            SpellAuraHolder* holder = m_creature->GetSpellAuraHolder(event.buffed.spellId);
            if (!holder || holder->GetStackAmount() < event.buffed.amount)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.buffed.repeatMin, event.buffed.repeatMax);
            break;
        }
        case EVENT_T_TARGET_AURA:
        {
            if (!m_creature->IsInCombat() || !m_creature->GetVictim())
                return false;

            SpellAuraHolder* holder = m_creature->GetVictim()->GetSpellAuraHolder(event.buffed.spellId);
            if (!holder || holder->GetStackAmount() < event.buffed.amount)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.buffed.repeatMin, event.buffed.repeatMax);
            break;
        }
        case EVENT_T_MISSING_AURA:
        {
            SpellAuraHolder* holder = m_creature->GetSpellAuraHolder(event.buffed.spellId);
            if (holder && holder->GetStackAmount() >= event.buffed.amount)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.buffed.repeatMin, event.buffed.repeatMax);
            break;
        }
        case EVENT_T_TARGET_MISSING_AURA:
        {
            if (!m_creature->IsInCombat() || !m_creature->GetVictim())
                return false;

            SpellAuraHolder* holder = m_creature->GetVictim()->GetSpellAuraHolder(event.buffed.spellId);
            if (holder && holder->GetStackAmount() >= event.buffed.amount)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.buffed.repeatMin, event.buffed.repeatMax);
            break;
        }
        case EVENT_T_MOVEMENT_INFORM:
        {
            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.move_inform.repeatMin, event.move_inform.repeatMax);
            break;
        }
        case EVENT_T_SCRIPT:
        case EVENT_T_GROUP_MEMBER_DIED:
        {
            break;
        }
        case EVENT_T_VICTIM_ROOTED:
        {
            if (!m_creature->GetVictim() || !m_creature->GetVictim()->HasUnitState(UNIT_STAT_ROOT))
                return false;

            pHolder.UpdateRepeatTimer(m_creature, event.victim_rooted.repeatMin, event.victim_rooted.repeatMax);
            break;
        }
        case EVENT_T_HIT_BY_AURA:
        {
            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.hit_by_aura.repeatMin, event.hit_by_aura.repeatMax);
            break;
        }
        case EVENT_T_STEALTH_ALERT:
        {
            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.stealth_alert.repeatMin, event.stealth_alert.repeatMax);
            break;
        }
        default:
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CreatureEventAI: Creature %u using Event %u has invalid Event Type(%u), missing from ProcessEvent() Switch.", m_creature->GetEntry(), pHolder.Event.event_id, pHolder.Event.event_type);
            break;
        }
    }

    //Disable non-repeatable events
    if (!(pHolder.Event.event_flags & EFLAG_REPEATABLE))
        pHolder.Enabled = false;

    //Store random here so that all random actions match up
    uint32 rnd = rand();

    //Return if chance for event is not met
    if (pHolder.Event.event_chance <= rnd % 100)
        return false;

    bool scriptFailed = false;

    //Process actions, normal case
    if (!(pHolder.Event.event_flags & EFLAG_RANDOM_ACTION))
    {
        for (const auto& action : pHolder.Event.action)
            if (ProcessAction(action, pHolder.Event.event_id, pActionInvoker))
                scriptFailed = true;
    }
    //Process actions, random case
    else
    {
        // amount of real actions
        uint32 count = 0;
        for (const auto& action : pHolder.Event.action)
            if (action)
                ++count;

        if (count)
        {
            // select action number from found amount
            uint32 idx = urand(0, count - 1);

            // find selected action, skipping not used
            uint32 j = 0;
            for (; ; ++j)
            {
                if (pHolder.Event.action[j])
                {
                    if (!idx)
                        break;
                    --idx;
                }
            }

            scriptFailed = ProcessAction(pHolder.Event.action[j], pHolder.Event.event_id, pActionInvoker);
        }
    }

    if (scriptFailed && (pHolder.Event.event_flags & EFLAG_CHECK_RESULT))
    {
        pHolder.Enabled = true;
        pHolder.UpdateRepeatTimer(m_creature, 0, 0);
        return false;
    }

    return true;
}

bool CreatureEventAI::ProcessAction(ScriptMap* action, uint32 EventId, SpellCaster* pActionInvoker)
{
    if (!action)
        return false;

    WorldObject* target = pActionInvoker ? pActionInvoker : m_creature->GetVictim();
    Map* map = m_creature->GetMap();

    for (auto const& x : *action)
    {
        if (map->ScriptCommandStartDirect(x.second, m_creature, target))
            return true;
    }

    return false;
}

void CreatureEventAI::JustRespawned()
{
    Reset();

    BasicAI::JustRespawned();

    if (m_bEmptyList)
        return;

    //Handle Spawned Events
    for (auto& i : m_CreatureEventAIList)
        if (i.Event.event_type == EVENT_T_SPAWNED)
            ProcessEvent(i);
}

void CreatureEventAI::Reset()
{
    m_EventUpdateTime = EVENT_UPDATE_TIME;
    m_EventDiff = 0;

    if (m_bEmptyList)
        return;

    //Reset all events to enabled
    for (auto& i : m_CreatureEventAIList)
    {
        CreatureEventAI_Event const& event = i.Event;
        switch (event.event_type)
        {
            //Reset all out of combat timers
            case EVENT_T_TIMER_OOC:
            {
                if (i.UpdateRepeatTimer(m_creature, event.timer.initialMin, event.timer.initialMax))
                    i.Enabled = true;
                break;
            }
        }
    }
}

void CreatureEventAI::JustReachedHome()
{
    if (!m_bEmptyList)
    {
        for (auto& i : m_CreatureEventAIList)
        {
            if (i.Event.event_type == EVENT_T_REACHED_HOME)
                ProcessEvent(i);
        }
    }

    Reset();
}

void CreatureEventAI::EnterEvadeMode()
{
    BasicAI::EnterEvadeMode();

    if (m_bEmptyList)
        return;

    //Handle Evade events
    for (auto& i : m_CreatureEventAIList)
    {
        if (i.Event.event_type == EVENT_T_EVADE)
            ProcessEvent(i);
    }
}

void CreatureEventAI::OnCombatStop()
{
    BasicAI::OnCombatStop();

    if (m_bEmptyList)
        return;

    //Handle Combat Stop events
    for (auto& i : m_CreatureEventAIList)
    {
        if (i.Event.event_type == EVENT_T_LEAVE_COMBAT)
            ProcessEvent(i);
    }
}

void CreatureEventAI::JustDied(Unit* killer)
{
    Reset();

    if (m_bEmptyList)
        return;

    //Handle Evade events
    for (auto& i : m_CreatureEventAIList)
    {
        if (i.Event.event_type == EVENT_T_DEATH)
            ProcessEvent(i, killer);
    }

    // reset phase after any death state events
    m_Phase = 0;
}

void CreatureEventAI::KilledUnit(Unit* victim)
{
    if (m_bEmptyList || victim->GetTypeId() != TYPEID_PLAYER)
        return;

    for (auto& i : m_CreatureEventAIList)
    {
        if (i.Event.event_type == EVENT_T_KILL)
            ProcessEvent(i, victim);
    }
}

void CreatureEventAI::JustSummoned(Creature* pUnit)
{
    if (m_bEmptyList || !pUnit)
        return;

    for (auto& i : m_CreatureEventAIList)
    {
        if (i.Event.event_type == EVENT_T_SUMMONED_UNIT)
            ProcessEvent(i, pUnit);
    }
}

void CreatureEventAI::SummonedCreatureJustDied(Creature* pUnit)
{
    if (m_bEmptyList || !pUnit)
        return;

    for (auto& i : m_CreatureEventAIList)
    {
        if (i.Event.event_type == EVENT_T_SUMMONED_JUST_DIED)
            ProcessEvent(i, pUnit);
    }
}

void CreatureEventAI::SummonedCreatureDespawn(Creature* pUnit)
{
    BasicAI::SummonedCreatureDespawn(pUnit);

    if (m_bEmptyList)
        return;

    for (auto& i : m_CreatureEventAIList)
    {
        if (i.Event.event_type == EVENT_T_SUMMONED_JUST_DESPAWN)
            ProcessEvent(i, pUnit);
    }
}

void CreatureEventAI::EnterCombat(Unit* enemy)
{
    //Check for on combat start events
    if (!m_bEmptyList)
    {
        for (auto& i : m_CreatureEventAIList)
        {
            CreatureEventAI_Event const& event = i.Event;
            switch (event.event_type)
            {
                case EVENT_T_AGGRO:
                    i.Enabled = true;
                    ProcessEvent(i, enemy);
                    break;
                //Reset all in combat timers
                case EVENT_T_TIMER_IN_COMBAT:
                    if (i.UpdateRepeatTimer(m_creature, event.timer.initialMin, event.timer.initialMax))
                        i.Enabled = true;
                    break;
                //All normal events need to be re-enabled and their time set to 0
                default:
                    i.Enabled = true;
                    i.Time = 0;
                    break;
            }
        }
    }

    m_EventUpdateTime = EVENT_UPDATE_TIME;
    m_EventDiff = 0;
}

void CreatureEventAI::MoveInLineOfSight(Unit* pWho)
{
    // Check for OOC LOS Event
    if (!m_creature->GetVictim() && !m_bEmptyList)
        UpdateEventsOn_MoveInLineOfSight(pWho);

    BasicAI::MoveInLineOfSight(pWho);
}

void CreatureEventAI::UpdateEventsOn_MoveInLineOfSight(Unit* pWho)
{
    for (auto& itr : m_CreatureEventAIList)
    {
        if (itr.Event.event_type == EVENT_T_OOC_LOS)
        {
            //can trigger if closer than fMaxAllowedRange
            float fMaxAllowedRange = (float)itr.Event.ooc_los.maxRange;

            //if range is ok and we are actually in LOS
            if (m_creature->IsWithinDistInMap(pWho, fMaxAllowedRange))
            {
                if ((itr.Event.ooc_los.reaction == ULR_ANY) ||
                    (itr.Event.ooc_los.reaction == ULR_NON_HOSTILE && !m_creature->IsHostileTo(pWho)) ||
                    (itr.Event.ooc_los.reaction == ULR_HOSTILE && m_creature->IsHostileTo(pWho)))
                    if (m_creature->IsWithinLOSInMap(pWho))
                        ProcessEvent(itr, pWho);
            }
        }
    }
}

void CreatureEventAI::SpellHit(SpellCaster* pCaster, SpellEntry const* pSpellEntry)
{
    if (m_bEmptyList)
        return;

    for (auto& i : m_CreatureEventAIList)
    {
        switch (i.Event.event_type)
        {
            case EVENT_T_HIT_BY_SPELL:
            {
                //If spell id matches (or no spell id) & if spell school matches (or no spell school)
                if (!i.Event.hit_by_spell.spellId || pSpellEntry->Id == i.Event.hit_by_spell.spellId)
                    if (GetSchoolMask(pSpellEntry->School) & i.Event.hit_by_spell.schoolMask)
                        ProcessEvent(i, pCaster);
                break;
            }
            case EVENT_T_HIT_BY_AURA:
            {
                if (!i.Event.hit_by_aura.auraType || pSpellEntry->HasAura(AuraType(i.Event.hit_by_aura.auraType)))
                    ProcessEvent(i, pCaster);
                break;
            }
        }
    }
}

void CreatureEventAI::SpellHitTarget(Unit* pTarget, SpellEntry const* pSpellEntry)
{
    if (m_bEmptyList)
        return;

    for (auto& i : m_CreatureEventAIList)
    {
        if (i.Event.event_type == EVENT_T_SPELL_HIT_TARGET)
        {
            //If spell id matches (or no spell id) & if spell school matches (or no spell school)
            if (!i.Event.hit_by_spell.spellId || pSpellEntry->Id == i.Event.hit_by_spell.spellId)
                if (GetSchoolMask(pSpellEntry->School) & i.Event.hit_by_spell.schoolMask)
                    ProcessEvent(i, pTarget);
        }
    }
}

void CreatureEventAI::MovementInform(uint32 type, uint32 id)
{
    if (m_bEmptyList)
        return;

    for (auto& i : m_CreatureEventAIList)
        if (i.Event.event_type == EVENT_T_MOVEMENT_INFORM)
            if (i.Event.move_inform.motionType == type && i.Event.move_inform.pointId == id)
                ProcessEvent(i);
}

void CreatureEventAI::UpdateAI(uint32 const diff)
{
    //Check if we are in combat (also updates calls threat update code)
    m_creature->SelectHostileTarget();
    bool Combat =  m_creature->GetVictim();

    //Must return if creature isn't alive. Normally select hostil target and get victim prevent this
    if (!m_creature->IsAlive())
        return;

    if (!m_bEmptyList)
        UpdateEventsOn_UpdateAI(diff, Combat);

    if (Combat)
    {
        if (!m_CreatureSpells.empty())
            UpdateSpellsList(diff);

        DoMeleeAttackIfReady();
    }
}

void CreatureEventAI::UpdateEventsOn_UpdateAI(uint32 const diff, bool Combat)
{
    //Events are only updated once every EVENT_UPDATE_TIME ms to prevent lag with large amount of events
    if (m_EventUpdateTime < diff)
    {
        m_EventDiff += diff;

        //Check for time based events
        for (auto& i : m_CreatureEventAIList)
        {
            //Decrement Timers
            if (i.Time)
            {
                if (i.Time > m_EventDiff)
                {
                    //Do not decrement timers if event cannot trigger in this phase
                    if (!(i.Event.event_inverse_phase_mask & (1 << m_Phase)))
                        i.Time -= m_EventDiff;

                    //Skip processing of events that have time remaining
                    continue;
                }
                else i.Time = 0;
            }

            //Events that are updated every EVENT_UPDATE_TIME
            switch (i.Event.event_type)
            {
                case EVENT_T_TIMER_OOC:
                case EVENT_T_FRIENDLY_MISSING_BUFF:
                    ProcessEvent(i);
                    break;
                case EVENT_T_TIMER_IN_COMBAT:
                case EVENT_T_MANA:
                case EVENT_T_HP:
                case EVENT_T_TARGET_HP:
                case EVENT_T_TARGET_CASTING:
                case EVENT_T_FRIENDLY_HP:
                case EVENT_T_FRIENDLY_IS_CC:
                case EVENT_T_AURA:
                case EVENT_T_TARGET_AURA:
                case EVENT_T_MISSING_AURA:
                case EVENT_T_TARGET_MISSING_AURA:
                case EVENT_T_VICTIM_ROOTED:
                    if (Combat)
                        ProcessEvent(i);
                    break;
                case EVENT_T_RANGE:
                    if (Combat)
                    {
                        if (m_creature->GetVictim() && m_creature->IsInMap(m_creature->GetVictim()))
                            if (m_creature->IsInRange(m_creature->GetVictim(), (float)i.Event.range.minDist, (float)i.Event.range.maxDist))
                                ProcessEvent(i);
                    }
                    break;
            }
        }

        m_EventDiff = 0;
        m_EventUpdateTime = EVENT_UPDATE_TIME;
    }
    else
    {
        m_EventDiff += diff;
        m_EventUpdateTime -= diff;
    }
}

//*********************************
//*** Functions used globally ***

void CreatureEventAI::ReceiveEmote(Player* pPlayer, uint32 text_emote)
{
    if (m_bEmptyList)
        return;

    for (auto& itr : m_CreatureEventAIList)
    {
        if (itr.Event.event_type == EVENT_T_RECEIVE_EMOTE)
        {
            if (itr.Event.receive_emote.emoteId != text_emote)
                continue;

            ProcessEvent(itr, pPlayer);
        }
    }
}

void CreatureEventAI::OnScriptEventHappened(uint32 uiEvent, uint32 uiData, WorldObject* pInvoker)
{
    if (m_bEmptyList)
        return;

    for (auto& i : m_CreatureEventAIList)
    {
        if (i.Event.event_type == EVENT_T_SCRIPT)
            if ((i.Event.script_event.eventId == uiEvent) && (i.Event.script_event.data == uiData))
                ProcessEvent(i, ToUnit(pInvoker));
    }
}

void CreatureEventAI::GroupMemberJustDied(Creature* pUnit, bool isLeader)
{
    if (m_bEmptyList)
        return;

    for (auto& i : m_CreatureEventAIList)
    {
        if (i.Event.event_type == EVENT_T_GROUP_MEMBER_DIED)
        {
            if (i.Event.group_member_died.creatureId && (i.Event.group_member_died.creatureId != pUnit->GetEntry()))
                continue;

            if (((bool)i.Event.group_member_died.isLeader) == isLeader)
                ProcessEvent(i, pUnit);
        } 
    }
}

void CreatureEventAI::OnMoveInStealth(Unit* who)
{
    if (!CanTriggerAlert(who))
        return;

    TriggerAlertDirect(who);

    if (!m_bEmptyList)
    {
        for (auto& i : m_CreatureEventAIList)
            if (i.Event.event_type == EVENT_T_STEALTH_ALERT)
                ProcessEvent(i, who);
    }
}
