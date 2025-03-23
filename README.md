Tinkering with vMangos party bots.

<br>

### 3/23/2025 ###
- Enhanced the clone command
    - The `.partybot clone` command now supports:
        - Cloning the currently targeted player (original behavior)
        - Cloning a character by name (new feature)
        - Example: `.partybot clone PlayerName`

- Modified requirements for adding/cloning/loading party bots:
    - Must be resting or inside a dungeon
    - Cannot be in combat
    - Cannot be dead
    - Target character must be:
        - Not already online
        - Same faction as the player
        - Not in combat
        - Not dead

<br>

### 3/22/2025 ###
- Added stay/unstay commands
    - When staying, the bot will:
        - Not follow the party leader
        - Not chase targets in combat
        - Not run away from enemies
        - Still attack and cast spells at targets within range

    - To use the command:
        - Select a party bot
        - Type `.partybot stay` to make them stay in place
        - Type `.partybot unstay` to make them resume normal movement

    - The bot will continue to participate in combat while staying, but will not move from their position. This is useful for setting up specific positions for fights or when you want the bot to hold a particular location.

