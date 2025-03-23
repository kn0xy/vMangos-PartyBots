DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200620214705');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200620214705');
-- Add your query below.


-- farmer furlbrow
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 237;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (23701, 237, 0, 1, 0, 100, 1, 75000, 90000, 150000, 180000, 23701, 0, 0, 'farmer furlbrow - say');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (23701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 56, 57, 0, 0, 0, 0, 0, 0, 0, 'farmer furlbrow - say');


-- verna furlbrow
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 238;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (23801, 238, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 23801, 0, 0, 'verna furlbrow - speak');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (23801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54, 55, 0, 0, 0, 0, 0, 0, 0, 'verna furlbrow - speak');


-- farmer saldean
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 233;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (23301, 233, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 23301, 0, 0, 'farmer saldean - speak');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (23301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58, 59, 60, 0, 0, 0, 0, 0, 0, 'farmer saldean - speak');


-- add protector weaver waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 488;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(488, 1, -10494.1, 1028.33, 95.6125, 100, 0, 0, 0),
(488, 2, -10494, 1027.09, 95.6125, 100, 0, 0, 0),
(488, 3, -10493.7, 1023.06, 95.6125, 100, 0, 0, 0),
(488, 4, -10495.6, 1021.03, 95.6125, 100, 0, 0, 0),
(488, 5, -10497.4, 1019.07, 95.6125, 100, 0, 0, 0),
(488, 6, -10498.7, 1018.96, 95.6125, 100, 0, 0, 0),
(488, 7, -10503.9, 1019.15, 95.6125, 100, 0, 0, 0),
(488, 8, -10504.9, 1020.06, 95.6125, 100, 0, 0, 0),
(488, 9, -10506.9, 1021.79, 95.6125, 100, 0, 0, 0),
(488, 10, -10507.5, 1024.46, 95.6125, 100, 0, 0, 0),
(488, 11, -10506.5, 1029.2, 95.6125, 100, 0, 0, 0),
(488, 12, -10505.7, 1030.25, 95.6125, 100, 0, 0, 0),
(488, 13, -10504, 1032.41, 95.6125, 100, 0, 0, 0),
(488, 14, -10502.8, 1032.73, 95.6125, 100, 0, 0, 0),
(488, 15, -10496.7, 1031.4, 95.6122, 100, 0, 0, 0),
(488, 16, -10495.8, 1030.45, 95.6121, 100, 0, 0, 0);


-- update protector dorana waypoints
DELETE FROM `creature_movement` WHERE `id` = 89532;
UPDATE `creature` SET `position_x` = -10197.4, `position_y` = 988.166, `position_z` = 33.0215 WHERE `id` = 869;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(869, 1, -10197.4, 988.166, 33.0215, 100, 0, 0, 0),
(869, 2, -10212.7, 993.453, 32.5429, 100, 0, 0, 0),
(869, 3, -10216.5, 994.564, 32.4853, 100, 0, 0, 0),
(869, 4, -10228.6, 995.737, 31.9918, 100, 0, 0, 0),
(869, 5, -10256.2, 991.014, 31.3775, 100, 0, 0, 0),
(869, 6, -10266.1, 984.771, 31.3251, 100, 0, 0, 0),
(869, 7, -10272.1, 974.315, 31.2214, 100, 0, 0, 0),
(869, 8, -10280.9, 966.746, 31.1856, 100, 0, 0, 0),
(869, 9, -10288.2, 964.36, 31.1974, 100, 0, 0, 0),
(869, 10, -10330.4, 977.563, 31.2548, 100, 0, 0, 0),
(869, 11, -10362.4, 980.346, 31.1638, 100, 0, 0, 0),
(869, 12, -10370.4, 981.149, 31.1479, 100, 0, 0, 0),
(869, 13, -10382.3, 983.277, 31.0827, 100, 0, 0, 0),
(869, 14, -10396.9, 990.324, 31.5598, 100, 0, 0, 0),
(869, 15, -10408.2, 994.21, 32.0454, 100, 0, 0, 0),
(869, 16, -10429.5, 984.057, 34.2767, 100, 0, 0, 0),
(869, 17, -10445.4, 971.76, 35.1749, 100, 0, 0, 0),
(869, 18, -10464.1, 956.154, 35.5314, 100, 0, 0, 0),
(869, 19, -10467.2, 953.811, 35.9535, 100, 0, 0, 0),
(869, 20, -10495.3, 952.824, 39.0622, 100, 0, 0, 0),
(869, 21, -10530.4, 961.276, 40.8875, 100, 0, 0, 0),
(869, 22, -10560.2, 973.82, 40.9455, 100, 0, 0, 0),
(869, 23, -10589.9, 986.219, 37.1973, 100, 0, 0, 0),
(869, 24, -10615.2, 998.396, 33.3854, 100, 0, 0, 0),
(869, 25, -10638.8, 1013.84, 31.7608, 100, 0, 0, 0),
(869, 26, -10647.5, 1012.37, 31.7765, 100, 0, 0, 0),
(869, 27, -10644.5, 1015.11, 31.5651, 100, 0, 0, 0),
(869, 28, -10624.8, 1004.12, 32.6886, 100, 0, 0, 0),
(869, 29, -10596.6, 989.205, 36.4663, 100, 0, 0, 0),
(869, 30, -10567, 976.743, 40.3615, 100, 0, 0, 0),
(869, 31, -10537.3, 963.922, 41.1886, 100, 0, 0, 0),
(869, 32, -10502.7, 953.329, 39.6958, 100, 0, 0, 0),
(869, 33, -10470.4, 953.687, 36.1321, 100, 0, 0, 0),
(869, 34, -10435.4, 980.078, 34.7469, 100, 0, 0, 0),
(869, 35, -10414.7, 992.349, 32.5759, 100, 0, 0, 0),
(869, 36, -10403.3, 993.174, 31.7505, 100, 0, 0, 0),
(869, 37, -10389.2, 985.575, 31.1479, 100, 0, 0, 0),
(869, 38, -10369.7, 981.036, 31.1479, 100, 0, 0, 0),
(869, 39, -10337.6, 979.009, 31.2418, 100, 0, 0, 0),
(869, 40, -10303.5, 966.942, 31.2532, 100, 0, 0, 0),
(869, 41, -10287.7, 964.306, 31.195, 100, 0, 0, 0),
(869, 42, -10276.9, 968.969, 31.1856, 100, 0, 0, 0),
(869, 43, -10270, 978.423, 31.2619, 100, 0, 0, 0),
(869, 44, -10262.8, 987.988, 31.358, 100, 0, 0, 0),
(869, 45, -10244.3, 993.825, 31.448, 100, 0, 0, 0),
(869, 46, -10220.4, 994.948, 32.4233, 100, 0, 0, 0),
(869, 47, -10204.9, 990.924, 32.7439, 100, 0, 0, 0),
(869, 48, -10193.6, 986.492, 33.4625, 100, 0, 0, 0),
(869, 49, -10169.8, 986.489, 34.2844, 100, 0, 0, 0),
(869, 50, -10137.8, 990.136, 35.5978, 100, 0, 0, 0),
(869, 51, -10121.9, 990.285, 37.7313, 100, 0, 0, 0),
(869, 52, -10100.2, 999.191, 37.4609, 100, 0, 0, 0),
(869, 53, -10114.3, 991.44, 38.2191, 100, 0, 0, 0),
(869, 54, -10130, 990.544, 36.672, 100, 0, 0, 0),
(869, 55, -10162.3, 987.258, 33.9972, 100, 0, 0, 0),
(869, 56, -10186.5, 985.172, 34.1512, 100, 0, 0, 0);


-- update protector korelor waypoints
DELETE FROM `creature_movement_template` WHERE `entry` = 874;
DELETE FROM `creature_movement` WHERE `id` = 89538;
UPDATE `creature` SET `position_x` = -10900.7, `position_y` = 777.566, `position_z` = 30.7594 WHERE `id` = 874;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(874, 1, -10900.7, 777.566, 30.7594, 100, 0, 0, 0),
(874, 2, -10880.3, 749.302, 31.0975, 100, 0, 0, 0),
(874, 3, -10878, 737.431, 31.1043, 100, 0, 0, 0),
(874, 4, -10875.3, 721.515, 31.0141, 100, 0, 0, 0),
(874, 5, -10872.7, 705.523, 31.0228, 100, 0, 0, 0),
(874, 6, -10866.9, 665.396, 31.0318, 100, 0, 0, 0),
(874, 7, -10871.4, 697.394, 30.9914, 100, 0, 0, 0),
(874, 8, -10872.2, 702.698, 30.9895, 100, 0, 0, 0),
(874, 9, -10874.2, 714.666, 30.993, 100, 0, 0, 0),
(874, 10, -10876.5, 729.242, 31.1853, 100, 0, 0, 0),
(874, 11, -10878.2, 738.549, 31.1036, 100, 0, 0, 0),
(874, 12, -10879.5, 745.126, 31.0284, 100, 0, 0, 0),
(874, 13, -10883.4, 753.536, 31.1415, 100, 0, 0, 0),
(874, 14, -10899.2, 775.391, 30.7778, 100, 0, 0, 0),
(874, 15, -10917.2, 797.081, 30.8355, 100, 0, 0, 0),
(874, 16, -10927.7, 827.287, 32.0506, 100, 0, 0, 0),
(874, 17, -10927.2, 846.641, 32.7699, 100, 0, 0, 0),
(874, 18, -10918.8, 864.761, 32.8404, 100, 0, 0, 0),
(874, 19, -10914.8, 896.366, 32.2092, 100, 0, 0, 0),
(874, 20, -10944.8, 932.321, 31.5481, 100, 0, 0, 0),
(874, 21, -10947.2, 935.459, 31.5501, 100, 0, 0, 0),
(874, 22, -10949.2, 940.715, 31.5501, 100, 0, 0, 0),
(874, 23, -10943.7, 962.693, 32.0361, 100, 0, 0, 0),
(874, 24, -10938.4, 969.634, 32.946, 100, 0, 0, 0),
(874, 25, -10909.7, 983.896, 37.8003, 100, 0, 0, 0),
(874, 26, -10899.8, 994.062, 35.9963, 100, 0, 0, 0),
(874, 27, -10869.2, 1005.71, 31.8306, 100, 0, 0, 0),
(874, 28, -10837, 1008.38, 32.7562, 100, 0, 0, 0),
(874, 29, -10805.9, 1016.7, 32.3327, 100, 0, 0, 0),
(874, 30, -10769.6, 1017.6, 32.2363, 100, 0, 0, 0),
(874, 31, -10753.6, 1018.35, 32.8864, 100, 0, 0, 0),
(874, 32, -10737.4, 1024.39, 33.3608, 100, 0, 0, 0),
(874, 33, -10723.1, 1031.58, 33.3446, 100, 0, 0, 0),
(874, 34, -10703.2, 1033.79, 33.0427, 100, 0, 0, 0),
(874, 35, -10667.2, 1029.11, 32.684, 100, 0, 0, 0),
(874, 36, -10662.3, 1030.07, 32.7481, 100, 0, 0, 0),
(874, 37, -10658.2, 1035.02, 33.2014, 100, 0, 0, 0),
(874, 38, -10643, 1053.87, 33.6321, 100, 0, 0, 0),
(874, 39, -10639.9, 1058.75, 33.6541, 100, 0, 0, 0),
(874, 40, -10635.8, 1068.35, 33.8838, 100, 0, 0, 0),
(874, 41, -10634, 1085.89, 33.8001, 100, 0, 0, 0),
(874, 42, -10634.1, 1077.8, 33.8741, 100, 0, 0, 0),
(874, 43, -10635.8, 1068.35, 33.8838, 100, 0, 0, 0),
(874, 44, -10639.9, 1058.75, 33.6541, 100, 0, 0, 0),
(874, 45, -10642.6, 1054.38, 33.6352, 100, 0, 0, 0),
(874, 46, -10652, 1042.52, 33.5083, 100, 0, 0, 0),
(874, 47, -10657.8, 1035.49, 33.2532, 100, 0, 0, 0),
(874, 48, -10659.7, 1033.15, 32.9456, 100, 0, 0, 0),
(874, 49, -10666.6, 1029.02, 32.685, 100, 0, 0, 0),
(874, 50, -10696.4, 1033.53, 32.9016, 100, 0, 0, 0),
(874, 51, -10702.7, 1033.82, 33.0241, 100, 0, 0, 0),
(874, 52, -10716.7, 1033.13, 33.4431, 100, 0, 0, 0),
(874, 53, -10722.6, 1031.84, 33.3729, 100, 0, 0, 0),
(874, 54, -10731.5, 1027.34, 33.3303, 100, 0, 0, 0),
(874, 55, -10737, 1024.6, 33.3526, 100, 0, 0, 0),
(874, 56, -10747, 1019.61, 33.336, 100, 0, 0, 0),
(874, 57, -10749, 1018.6, 33.2895, 100, 0, 0, 0),
(874, 58, -10762.8, 1017.82, 32.2895, 100, 0, 0, 0),
(874, 59, -10795.2, 1018.08, 32.179, 100, 0, 0, 0),
(874, 60, -10830.4, 1009.54, 32.8525, 100, 0, 0, 0),
(874, 61, -10862.8, 1006.48, 31.6696, 100, 0, 0, 0),
(874, 62, -10894.3, 1000.25, 34.8242, 100, 0, 0, 0),
(874, 63, -10899.8, 994.062, 35.9963, 100, 0, 0, 0),
(874, 64, -10909.7, 983.896, 37.8003, 100, 0, 0, 0),
(874, 65, -10920.5, 978.511, 36.5925, 100, 0, 0, 0),
(874, 66, -10938.4, 969.634, 32.946, 100, 0, 0, 0),
(874, 67, -10948.2, 944.693, 31.5826, 100, 0, 0, 0),
(874, 68, -10947.8, 937.013, 31.5501, 100, 0, 0, 0),
(874, 69, -10917.7, 904.844, 32.2835, 100, 0, 0, 0),
(874, 70, -10916, 873.851, 32.2722, 100, 0, 0, 0),
(874, 71, -10924.2, 855.868, 32.9946, 100, 0, 0, 0),
(874, 72, -10928.7, 836.442, 32.3674, 100, 0, 0, 0),
(874, 73, -10921.4, 805.509, 30.9179, 100, 0, 0, 0),
(874, 74, -10902.6, 779.729, 30.7679, 100, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
