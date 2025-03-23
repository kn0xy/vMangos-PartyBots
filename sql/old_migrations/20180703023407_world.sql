DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180703023407');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180703023407');
-- Add your query below.


-- Worn Junkbox should contain a few copper.
UPDATE `item_template` SET `minMoneyLoot`=5, `maxMoneyLoot`=15 WHERE `entry`=16883;

-- Recipes dropped from Worn Junkbox.
DELETE FROM `reference_loot_template` WHERE `entry`=1007;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1007, 3830, 0, 1, 1, 1, 0, 0, 10),
(1007, 3831, 0, 1, 1, 1, 0, 0, 10),
(1007, 3832, 0, 1, 1, 1, 0, 0, 10),
(1007, 3866, 0, 1, 1, 1, 0, 0, 10),
(1007, 3867, 0, 1, 1, 1, 0, 0, 10),
(1007, 3868, 0, 1, 1, 1, 0, 0, 10),
(1007, 3869, 0, 1, 1, 1, 0, 0, 10),
(1007, 3870, 0, 1, 1, 1, 0, 0, 10),
(1007, 3872, 0, 1, 1, 1, 0, 0, 10),
(1007, 3873, 0, 1, 1, 1, 0, 0, 10),
(1007, 3874, 0, 1, 1, 1, 0, 0, 10),
(1007, 4299, 0, 1, 1, 1, 0, 0, 10),
(1007, 4300, 0, 1, 1, 1, 0, 0, 10),
(1007, 4352, 0, 1, 1, 1, 0, 0, 10),
(1007, 4353, 0, 1, 1, 1, 0, 0, 10),
(1007, 4414, 0, 1, 1, 1, 0, 0, 10),
(1007, 4416, 0, 1, 1, 1, 0, 0, 10),
(1007, 4417, 0, 1, 1, 1, 0, 0, 10),
(1007, 5774, 0, 1, 1, 1, 0, 0, 10),
(1007, 5974, 0, 1, 1, 1, 0, 0, 10),
(1007, 6045, 0, 1, 1, 1, 0, 0, 10),
(1007, 7084, 0, 1, 1, 1, 0, 0, 10),
(1007, 7085, 0, 1, 1, 1, 0, 0, 10),
(1007, 7086, 0, 1, 1, 1, 0, 0, 10),
(1007, 7090, 0, 1, 1, 1, 0, 0, 10),
(1007, 7092, 0, 1, 1, 1, 0, 0, 10),
(1007, 7449, 0, 1, 1, 1, 0, 0, 10),
(1007, 7450, 0, 1, 1, 1, 0, 0, 10),
(1007, 7453, 0, 1, 1, 1, 0, 0, 10),
(1007, 10601, 0, 1, 1, 1, 0, 0, 10),
(1007, 11164, 0, 1, 1, 1, 0, 0, 10),
(1007, 11167, 0, 1, 1, 1, 0, 0, 10);

-- Rings dropped from Worn Junkbox.
DELETE FROM `reference_loot_template` WHERE `entry`=1008;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1008, 5003, 0, 1, 1, 1, 0, 0, 10),
(1008, 5007, 0, 1, 1, 1, 0, 0, 10),
(1008, 5009, 0, 1, 1, 1, 0, 0, 10),
(1008, 5011, 0, 1, 1, 1, 0, 0, 10),
(1008, 11970, 0, 1, 1, 1, 0, 0, 10),
(1008, 11971, 0, 1, 1, 1, 0, 0, 10),
(1008, 11972, 0, 1, 1, 1, 0, 0, 10),
(1008, 11985, 0, 1, 1, 1, 0, 0, 10),
(1008, 11986, 0, 1, 1, 1, 0, 0, 10),
(1008, 11996, 0, 1, 1, 1, 0, 0, 10),
(1008, 11997, 0, 1, 1, 1, 0, 0, 10),
(1008, 12009, 0, 1, 1, 1, 0, 0, 10),
(1008, 12010, 0, 1, 1, 1, 0, 0, 10),
(1008, 12019, 0, 1, 1, 1, 0, 0, 10),
(1008, 12020, 0, 1, 1, 1, 0, 0, 10),
(1008, 12028, 0, 1, 1, 1, 0, 0, 10),
(1008, 12029, 0, 1, 1, 1, 0, 0, 10),
(1008, 12030, 0, 1, 1, 1, 0, 0, 10),
(1008, 12039, 0, 1, 1, 1, 0, 0, 10),
(1008, 12040, 0, 1, 1, 1, 0, 0, 10);

-- Green gear dropped from Worn Junkbox.
DELETE FROM `reference_loot_template` WHERE `entry`=1009;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1009, 1639, 0, 1, 1, 1, 0, 0, 10),
(1009, 2072, 0, 1, 1, 1, 0, 0, 10),
(1009, 3037, 0, 1, 1, 1, 0, 0, 10),
(1009, 6416, 0, 1, 1, 1, 0, 0, 10),
(1009, 6596, 0, 1, 1, 1, 0, 0, 10),
(1009, 7409, 0, 1, 1, 1, 0, 0, 10),
(1009, 7609, 0, 1, 1, 1, 0, 0, 10),
(1009, 9853, 0, 1, 1, 1, 0, 0, 10),
(1009, 9862, 0, 1, 1, 1, 0, 0, 10),
(1009, 9886, 0, 1, 1, 1, 0, 0, 10),
(1009, 9962, 0, 1, 1, 1, 0, 0, 10),
(1009, 10067, 0, 1, 1, 1, 0, 0, 10),
(1009, 15243, 0, 1, 1, 1, 0, 0, 10);

-- Other loot from Worn Junkbox.
-- https://web.archive.org/web/20060221031013/http://www.thottbot.com:80/?i=7285
DELETE FROM `item_loot_template` WHERE `entry`=16883;
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(16883, 1002, 0.1, 0, -1002, 1, 0, 0, 10),
(16883, 1007, 1.6, 0, -1007, 1, 0, 0, 10),
(16883, 1008, 1, 0, -1008, 1, 0, 0, 10),
(16883, 1009, 0.65, 0, -1009, 1, 0, 0, 10),
(16883, 1529, 1.3, 0, 1, 1, 0, 0, 10),
(16883, 1645, 0.3, 0, 1, 1, 0, 0, 10),
(16883, 1708, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 1710, 13, 0, 1, 1, 0, 0, 10),
(16883, 1712, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 2928, 19.7, 0, 2, 5, 0, 0, 10),
(16883, 2930, 18.7, 0, 2, 5, 0, 0, 10),
(16883, 3771, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 3864, 1.2, 0, 1, 1, 0, 0, 10),
(16883, 3914, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 3928, 0.1, 0, 1, 1, 0, 0, 10),
(16883, 4234, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 4425, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 4539, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 4544, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 4601, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 4602, 0.3, 0, 1, 1, 0, 0, 10),
(16883, 4607, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 5140, 5.7, 0, 1, 5, 0, 0, 10),
(16883, 5173, 19.3, 0, 2, 5, 0, 0, 10),
(16883, 5374, 0.1, 0, 1, 1, 0, 0, 10),
(16883, 5427, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 5429, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 5431, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 5433, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 5498, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 5504, 0.2, 0, 1, 1, 0, 0, 10),
(16883, 5530, 11.4, 0, 1, 6, 0, 0, 10),
(16883, 6149, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 7910, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 7971, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 7974, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 8923, 20.3, 0, 2, 5, 0, 0, 10),
(16883, 8924, 19, 0, 2, 5, 0, 0, 10),
(16883, 13926, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 16883, 0.2, 0, 1, 1, 0, 0, 10),
(16883, 17124, 0.05, 0, 1, 1, 0, 0, 10),
(16883, 24231, 15, 0, 1, 1, 0, 10, 10),
(16883, 24232, 2, 0, 1, 1, 0, 10, 10),
(16883, 24281, 1.5, 0, 1, 1, 0, 10, 10),
(16883, 24282, 0.5, 0, 1, 1, 0, 9, 10);

-- Some items have 0 in the description field.
UPDATE `item_template` SET `description`='' WHERE `description`='0';


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
