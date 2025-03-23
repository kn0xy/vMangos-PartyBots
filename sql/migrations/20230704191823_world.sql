DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230704191823');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230704191823');
-- Add your query below.


SET @OGUID = 51105;
SET @PTEMPLATE = 4385;

-- 33 Stranglethorn Vale 3706 / 3707 / Barrel of Sweet Nectar / Food Crate
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (11025, 11150, 11151, 11664, 11675, 11690, 11692, 11694, 11702, 11967, 11973, 12050, 12191, 16547, 29539));
DELETE FROM `gameobject` WHERE `guid` IN (11025, 11150, 11151, 11664, 11675, 11690, 11692, 11694, 11702, 11967, 11973, 12050, 12191, 16547, 29539);
DELETE FROM `pool_gameobject` WHERE `guid` IN (11025, 11150, 11151, 11664, 11675, 11690, 11692, 11694, 11702, 11967, 11973, 12050, 12191, 16547, 29539);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3706, 0, -14616.6, 337.532, 2.62036, 1.74533, 0, 0, 0.766044, 0.642788, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3706, 0, -14281.3, 28.1391, -0.400903, 1.97222, 0, 0, 0.833886, 0.551937, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3706, 0, -13657.1, 539.281, -0.583414, 0.174533, 0, 0, 0.087156, 0.996195, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3706, 0, -13221.2, 516.347, -0.161627, 0.820305, 0, 0, 0.398749, 0.91706, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3706, 0, -13007.9, -737.713, 56.0383, -2.93215, 0, 0, 0.994522, -0.104529, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3706, 0, -12733.5, 199.879, -0.906217, 2.68781, 0, 0, 0.97437, 0.224951, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3706, 0, -12705.2, -1021.45, 95.0958, 2.21657, 0, 0, 0.894934, 0.446198, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3706, 0, -12459.2, -987.089, 49.3111, -2.46091, 0, 0, 0.942641, -0.333807, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3706, 0, -12429.3, 158.839, 2.75041, -0.680679, 0, 0, 0.333807, -0.942641, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3706, 0, -12033.4, -548.406, 14.4671, -3.01942, 0, 0, 0.998135, -0.061048, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3706, 0, -12011.6, 513.743, -0.071974, 1.74533, 0, 0, 0.766044, 0.642788, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3706, 0, -11695.2, 1033.12, -0.366853, -1.71042, 0, 0, 0.75471, -0.656059, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3706, 0, -11639.6, -63.453, 10.8995, 1.309, 0, 0, 0.608761, 0.793353, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3706, 0, -11558.6, 575.308, 50.7439, 1.67552, 0, 0, 0.743145, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3706, 0, -11501.2, -612.834, 36.314, -0.733038, 0, 0, 0.358368, -0.93358, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3706, 0, -14703.6, 505.39, 2.4662, 1.32645, 0, 0, 0.615661, 0.788011, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3706, 0, -14469.6, 458.798, 15.1626, 4.15388, 0, 0, -0.874619, 0.48481, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3706, 0, -14437.4, 471.083, 3.95125, 6.17847, 0, 0, -0.0523357, 0.99863, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3706, 0, -14286, 531.689, 8.92882, 4.2237, 0, 0, -0.857167, 0.515038, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3706, 0, -14131.3, 478.44, 1.63034, 4.69494, 0, 0, -0.71325, 0.70091, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3706, 0, -13633.4, -428.278, -0.331431, 2.09439, 0, 0, 0.866025, 0.500001, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3706, 0, -13457.8, 769.28, 0.186856, 5.35816, 0, 0, -0.446198, 0.894935, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3706, 0, -13351.9, -26.9956, 22.5492, 3.63029, 0, 0, -0.970295, 0.241925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3706, 0, -12966.5, 478.285, -0.661181, 0.802851, 0, 0, 0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3706, 0, -12932.9, -626.72, 53.2888, 1.41372, 0, 0, 0.649447, 0.760406, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3706, 0, -12786.7, 494.441, -0.51737, 0.90757, 0, 0, 0.438371, 0.898794, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3706, 0, -12699.9, -35.4898, -0.492677, 4.50295, 0, 0, -0.777145, 0.629321, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3706, 0, -12535.3, -744.923, 39.7258, 5.48033, 0, 0, -0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3706, 0, -12528.8, 14.8733, -0.408921, 1.02974, 0, 0, 0.492423, 0.870356, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3706, 0, -12430.2, -831.858, 40.6406, 2.70526, 0, 0, 0.976295, 0.216442, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 3706, 0, -12365.4, 145.615, 14.6451, 4.60767, 0, 0, -0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 3706, 0, -12343.4, 209.075, 5.33371, 4.34587, 0, 0, -0.824126, 0.566406, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 3706, 0, -12325.9, 299.938, -0.375021, 4.7473, 0, 0, -0.694658, 0.71934, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 3706, 0, -12188.4, 341.415, -0.30212, 4.34587, 0, 0, -0.824126, 0.566406, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 3706, 0, -12029.3, -995.559, 49.8936, 3.07177, 0, 0, 0.999391, 0.0349061, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 3706, 0, -11977, 331.047, 3.36048, 2.07694, 0, 0, 0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 3706, 0, -11947.8, 733.472, -0.39083, 2.47837, 0, 0, 0.945518, 0.325568, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 3706, 0, -11945.3, -488.747, 30.1132, 3.50812, 0, 0, -0.983254, 0.182238, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 3706, 0, -11936.1, -584.706, 16.8704, 5.21854, 0, 0, -0.507538, 0.861629, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 3706, 0, -11852.5, 874.314, -0.255712, 4.55531, 0, 0, -0.760406, 0.649449, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 3706, 0, -11703.9, 631.469, 50.4131, 1.09956, 0, 0, 0.522498, 0.85264, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 3706, 0, -11677.3, 564.691, 50.607, 0.122173, 0, 0, 0.0610485, 0.998135, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 3706, 0, -11564.6, -582.781, 33.6824, 2.86234, 0, 0, 0.990268, 0.139175, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 3706, 0, -11299.4, -187.694, 75.5987, 5.75959, 0, 0, -0.258819, 0.965926, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 3706, 0, -14599.8, 153.503, -0.287752, 2.18166, 0, 0, 0.887011, 0.461749, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 3706, 0, -13948.5, -153.979, -0.387914, 5.58505, 0, 0, -0.34202, 0.939693, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 3706, 0, -12818.6, -748.996, 77.3723, 3.01941, 0, 0, 0.998135, 0.0610518, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 3706, 0, -11653.2, -671.2, 30.3123, 1.25664, 0, 0, 0.587785, 0.809017, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 3707, 0, -14616.6, 337.532, 2.62036, 1.74533, 0, 0, 0.766044, 0.642788, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 3707, 0, -14281.3, 28.1391, -0.400903, 1.97222, 0, 0, 0.833886, 0.551937, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 3707, 0, -13657.1, 539.281, -0.583414, 0.174533, 0, 0, 0.087156, 0.996195, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 3707, 0, -13221.2, 516.347, -0.161627, 0.820305, 0, 0, 0.398749, 0.91706, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 3707, 0, -13007.9, -737.713, 56.0383, -2.93215, 0, 0, 0.994522, -0.104529, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 3707, 0, -12733.5, 199.879, -0.906217, 2.68781, 0, 0, 0.97437, 0.224951, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 3707, 0, -12705.2, -1021.45, 95.0958, 2.21657, 0, 0, 0.894934, 0.446198, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 3707, 0, -12459.2, -987.089, 49.3111, -2.46091, 0, 0, 0.942641, -0.333807, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 3707, 0, -12429.3, 158.839, 2.75041, -0.680679, 0, 0, 0.333807, -0.942641, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 3707, 0, -12033.4, -548.406, 14.4671, -3.01942, 0, 0, 0.998135, -0.061048, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 3707, 0, -12011.6, 513.743, -0.071974, 1.74533, 0, 0, 0.766044, 0.642788, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 3707, 0, -11695.2, 1033.12, -0.366853, -1.71042, 0, 0, 0.75471, -0.656059, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 3707, 0, -11639.6, -63.453, 10.8995, 1.309, 0, 0, 0.608761, 0.793353, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 3707, 0, -11558.6, 575.308, 50.7439, 1.67552, 0, 0, 0.743145, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 3707, 0, -11501.2, -612.834, 36.314, -0.733038, 0, 0, 0.358368, -0.93358, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 3707, 0, -14703.6, 505.39, 2.4662, 1.32645, 0, 0, 0.615661, 0.788011, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 3707, 0, -14469.6, 458.798, 15.1626, 4.15388, 0, 0, -0.874619, 0.48481, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 3707, 0, -14437.4, 471.083, 3.95125, 6.17847, 0, 0, -0.0523357, 0.99863, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 3707, 0, -14286, 531.689, 8.92882, 4.2237, 0, 0, -0.857167, 0.515038, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 3707, 0, -14131.3, 478.44, 1.63034, 4.69494, 0, 0, -0.71325, 0.70091, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 3707, 0, -13633.4, -428.278, -0.331431, 2.09439, 0, 0, 0.866025, 0.500001, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+70, 3707, 0, -13457.8, 769.28, 0.186856, 5.35816, 0, 0, -0.446198, 0.894935, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+71, 3707, 0, -13351.9, -26.9956, 22.5492, 3.63029, 0, 0, -0.970295, 0.241925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+72, 3707, 0, -12966.5, 478.285, -0.661181, 0.802851, 0, 0, 0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+73, 3707, 0, -12932.9, -626.72, 53.2888, 1.41372, 0, 0, 0.649447, 0.760406, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+74, 3707, 0, -12786.7, 494.441, -0.51737, 0.90757, 0, 0, 0.438371, 0.898794, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+75, 3707, 0, -12699.9, -35.4898, -0.492677, 4.50295, 0, 0, -0.777145, 0.629321, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+76, 3707, 0, -12535.3, -744.923, 39.7258, 5.48033, 0, 0, -0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+77, 3707, 0, -12528.8, 14.8733, -0.408921, 1.02974, 0, 0, 0.492423, 0.870356, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+78, 3707, 0, -12430.2, -831.858, 40.6406, 2.70526, 0, 0, 0.976295, 0.216442, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+79, 3707, 0, -12365.4, 145.615, 14.6451, 4.60767, 0, 0, -0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+80, 3707, 0, -12343.4, 209.075, 5.33371, 4.34587, 0, 0, -0.824126, 0.566406, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+81, 3707, 0, -12325.9, 299.938, -0.375021, 4.7473, 0, 0, -0.694658, 0.71934, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+82, 3707, 0, -12188.4, 341.415, -0.30212, 4.34587, 0, 0, -0.824126, 0.566406, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+83, 3707, 0, -12029.3, -995.559, 49.8936, 3.07177, 0, 0, 0.999391, 0.0349061, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+84, 3707, 0, -11977, 331.047, 3.36048, 2.07694, 0, 0, 0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+85, 3707, 0, -11947.8, 733.472, -0.39083, 2.47837, 0, 0, 0.945518, 0.325568, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+86, 3707, 0, -11945.3, -488.747, 30.1132, 3.50812, 0, 0, -0.983254, 0.182238, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+87, 3707, 0, -11936.1, -584.706, 16.8704, 5.21854, 0, 0, -0.507538, 0.861629, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+88, 3707, 0, -11852.5, 874.314, -0.255712, 4.55531, 0, 0, -0.760406, 0.649449, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+89, 3707, 0, -11703.9, 631.469, 50.4131, 1.09956, 0, 0, 0.522498, 0.85264, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+90, 3707, 0, -11677.3, 564.691, 50.607, 0.122173, 0, 0, 0.0610485, 0.998135, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+91, 3707, 0, -11564.6, -582.781, 33.6824, 2.86234, 0, 0, 0.990268, 0.139175, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+92, 3707, 0, -11299.4, -187.694, 75.5987, 5.75959, 0, 0, -0.258819, 0.965926, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+93, 3707, 0, -14599.8, 153.503, -0.287752, 2.18166, 0, 0, 0.887011, 0.461749, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+94, 3707, 0, -13948.5, -153.979, -0.387914, 5.58505, 0, 0, -0.34202, 0.939693, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+95, 3707, 0, -12818.6, -748.996, 77.3723, 3.01941, 0, 0, 0.998135, 0.0610518, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+96, 3707, 0, -11653.2, -671.2, 30.3123, 1.25664, 0, 0, 0.587785, 0.809017, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+2, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+3, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+4, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+5, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+6, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+7, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+8, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+9, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+10, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+11, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+12, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+13, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+14, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+15, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+16, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+17, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+18, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+19, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+20, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+21, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+22, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+23, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+24, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+25, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+26, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+27, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+28, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+29, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+30, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+31, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+32, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+33, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+34, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+35, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+36, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+37, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+38, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+39, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+40, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+41, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+42, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+43, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+44, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+45, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+46, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+47, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@PTEMPLATE+48, 1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10);



INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+19, @PTEMPLATE+19, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+20, @PTEMPLATE+20, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+21, @PTEMPLATE+21, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+22, @PTEMPLATE+22, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+23, @PTEMPLATE+23, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+24, @PTEMPLATE+24, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+25, @PTEMPLATE+25, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+26, @PTEMPLATE+26, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+27, @PTEMPLATE+27, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+28, @PTEMPLATE+28, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+29, @PTEMPLATE+29, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+30, @PTEMPLATE+30, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+31, @PTEMPLATE+31, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+32, @PTEMPLATE+32, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+33, @PTEMPLATE+33, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+34, @PTEMPLATE+34, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+35, @PTEMPLATE+35, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+36, @PTEMPLATE+36, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+37, @PTEMPLATE+37, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+38, @PTEMPLATE+38, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+39, @PTEMPLATE+39, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+40, @PTEMPLATE+40, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+41, @PTEMPLATE+41, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+42, @PTEMPLATE+42, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+43, @PTEMPLATE+43, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+44, @PTEMPLATE+44, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+45, @PTEMPLATE+45, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+46, @PTEMPLATE+46, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+47, @PTEMPLATE+47, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+48, @PTEMPLATE+48, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+49, @PTEMPLATE+1, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+50, @PTEMPLATE+2, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+51, @PTEMPLATE+3, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+52, @PTEMPLATE+4, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+53, @PTEMPLATE+5, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+54, @PTEMPLATE+6, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+55, @PTEMPLATE+7, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+56, @PTEMPLATE+8, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+57, @PTEMPLATE+9, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+58, @PTEMPLATE+10, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+59, @PTEMPLATE+11, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+60, @PTEMPLATE+12, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+61, @PTEMPLATE+13, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+62, @PTEMPLATE+14, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+63, @PTEMPLATE+15, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+64, @PTEMPLATE+16, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+65, @PTEMPLATE+17, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+66, @PTEMPLATE+18, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+67, @PTEMPLATE+19, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+68, @PTEMPLATE+20, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+69, @PTEMPLATE+21, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+70, @PTEMPLATE+22, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+71, @PTEMPLATE+23, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+72, @PTEMPLATE+24, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+73, @PTEMPLATE+25, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+74, @PTEMPLATE+26, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+75, @PTEMPLATE+27, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+76, @PTEMPLATE+28, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+77, @PTEMPLATE+29, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+78, @PTEMPLATE+30, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+79, @PTEMPLATE+31, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+80, @PTEMPLATE+32, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+81, @PTEMPLATE+33, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+82, @PTEMPLATE+34, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+83, @PTEMPLATE+35, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+84, @PTEMPLATE+36, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+85, @PTEMPLATE+37, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+86, @PTEMPLATE+38, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+87, @PTEMPLATE+39, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+88, @PTEMPLATE+40, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+89, @PTEMPLATE+41, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+90, @PTEMPLATE+42, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+91, @PTEMPLATE+43, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+92, @PTEMPLATE+44, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+93, @PTEMPLATE+45, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+94, @PTEMPLATE+46, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+95, @PTEMPLATE+47, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10),
(@OGUID+96, @PTEMPLATE+48, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+49, 22, 'Stranglethorn Vale - Barrel of Sweet Nectar / Food Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+2, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+3, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+4, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+5, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+6, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+7, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+8, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+9, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+10, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+11, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+12, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+13, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+14, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+15, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+16, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+17, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+18, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+19, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+20, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+21, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+22, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+23, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+24, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+25, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+26, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+27, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+28, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+29, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+30, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+31, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+32, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+33, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+34, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+35, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+36, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+37, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+38, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+39, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+40, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+41, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+42, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+43, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+44, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+45, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+46, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+47, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0),
(@PTEMPLATE+48, @PTEMPLATE+49, 0, 'Barrel of Sweet Nectar / Food Crate - Stranglethorn Vale', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
