DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180807090510');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180807090510');
-- Add your query below.

SET @GUID := 53793;

UPDATE `creature_template` SET `speed_walk`=(2.5 / 2.5), `speed_run`=(10.0 / 7.0) WHERE `entry`='10408';
UPDATE `creature_template` SET `speed_walk`=(2.5 / 2.5), `speed_run`= (8.0 / 7.0) WHERE `entry`='10409';
UPDATE `creature_template` SET `speed_walk`=(2.5 / 2.5), `speed_run`=(10.0 / 7.0) WHERE `entry`='10809';


DELETE a FROM `creature_movement` a INNER JOIN `creature` b ON a.id=b.guid WHERE b.id IN (10408, 10409, 10809);
DELETE a FROM `creature_addon` a INNER JOIN `creature` b ON a.guid=b.guid WHERE b.id IN (10408, 10409, 10809);

DELETE FROM `creature` WHERE `id` IN (10408, 10409, 10809);

DELETE FROM `pool_creature` WHERE `guid`='53854';
DELETE FROM `pool_creature` WHERE `guid`='52147';
DELETE FROM `pool_template` WHERE `entry`='32902';

REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`) VALUES
('10408', '0', '0', '0', '1', '16', '0', '0'),
('10409', '0', '0', '0', '1', '16', '0', '0'),
('10809', '0', '0', '0', '1', '16', '0', '0');

REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES
(@GUID + 00, '10408', '329', '0', '0', '3954.533', '-3642.824', '134.1840', '3.717164', '1800', '1800', '0', '0', '8523', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 01, '10409', '329', '0', '0', '3954.533', '-3642.824', '134.1840', '3.717164', '1800', '1800', '0', '0', '8943', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 02, '10408', '329', '0', '0', '4048.206', '-3520.037', '121.6583', '3.020629', '1800', '1800', '0', '0', '8523', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 03, '10409', '329', '0', '0', '4048.206', '-3520.037', '121.6583', '3.020629', '1800', '1800', '0', '0', '8943', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 04, '10408', '329', '0', '0', '3985.920', '-3543.385', '124.8977', '6.228680', '1800', '1800', '0', '0', '8523', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 05, '10409', '329', '0', '0', '3985.920', '-3543.385', '124.8977', '6.228680', '1800', '1800', '0', '0', '8943', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 06, '10408', '329', '0', '0', '3897.527', '-3682.287', '141.7200', '3.065440', '1800', '1800', '0', '0', '8523', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 07, '10409', '329', '0', '0', '3897.527', '-3682.287', '141.7200', '3.065440', '1800', '1800', '0', '0', '8943', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 08, '10408', '329', '0', '0', '3872.850', '-3525.794', '138.3972', '4.944027', '1800', '1800', '0', '0', '8523', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 09, '10409', '329', '0', '0', '3872.850', '-3525.794', '138.3972', '4.944027', '1800', '1800', '0', '0', '8943', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 10, '10408', '329', '0', '0', '3824.227', '-3617.324', '145.2988', '4.779363', '1800', '1800', '0', '0', '8523', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 11, '10409', '329', '0', '0', '3824.227', '-3617.324', '145.2988', '4.779363', '1800', '1800', '0', '0', '8943', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 12, '10409', '329', '0', '0', '4058.864', '-3530.328', '122.2466', '0.000000', '604800', '604800', '0', '0', '8943', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 13, '10408', '329', '0', '0', '4058.864', '-3530.328', '122.2466', '0.000000', '604800', '604800', '0', '0', '8523', '0', '0', '2', '1', '0', '0', '10'),
(@GUID + 14, '10809', '329', '0', '0', '4058.864', '-3530.328', '122.2466', '0.000000', '604800', '604800', '0', '0', '15160', '0', '0', '2', '1', '0', '0', '10');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 00;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 00, @POINT := @POINT + 1, '3916.479', '-3667.517', '137.9747', '0', '11', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3892.435', '-3678.493', '141.3983', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3876.823', '-3681.058', '142.5055', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3857.698', '-3675.368', '143.6271', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3844.008', '-3685.722', '143.3532', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3838.721', '-3702.622', '142.4620', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3829.817', '-3716.548', '141.9058', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3838.721', '-3702.622', '142.4620', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3844.008', '-3685.722', '143.3532', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3857.532', '-3675.493', '143.6161', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3876.823', '-3681.058', '142.5055', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3892.435', '-3678.493', '141.3983', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3916.479', '-3667.517', '137.9747', '0', '0', '100'),
(@GUID + 00, @POINT := @POINT + 1, '3955.461', '-3644.003', '134.2263', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 01;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 01, @POINT := @POINT + 1, '3916.479', '-3667.517', '137.9747', '0', '11', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3892.435', '-3678.493', '141.3983', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3876.823', '-3681.058', '142.5055', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3857.698', '-3675.368', '143.6271', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3844.008', '-3685.722', '143.3532', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3838.721', '-3702.622', '142.4620', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3829.817', '-3716.548', '141.9058', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3838.721', '-3702.622', '142.4620', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3844.008', '-3685.722', '143.3532', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3857.532', '-3675.493', '143.6161', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3876.823', '-3681.058', '142.5055', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3892.435', '-3678.493', '141.3983', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3916.479', '-3667.517', '137.9747', '0', '0', '100'),
(@GUID + 01, @POINT := @POINT + 1, '3955.461', '-3644.003', '134.2263', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 02;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 02, @POINT := @POINT + 1, '4040.317', '-3519.078', '121.6485', '0', '11', '100'),
(@GUID + 02, @POINT := @POINT + 1, '4024.391', '-3520.038', '122.0079', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '4017.718', '-3540.070', '122.8682', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '4009.287', '-3557.343', '125.1329', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '4001.142', '-3574.829', '127.5148', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '3997.406', '-3601.483', '129.1390', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '3990.568', '-3623.250', '130.0376', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '3967.963', '-3640.871', '132.9653', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '3939.726', '-3649.159', '139.2397', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '3967.963', '-3640.871', '132.9653', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '3990.568', '-3623.250', '130.0376', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '3997.406', '-3601.483', '129.1390', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '4001.142', '-3574.829', '127.5148', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '4009.287', '-3557.343', '125.1329', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '4017.718', '-3540.070', '122.8682', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '4024.391', '-3520.038', '122.0079', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '4040.317', '-3519.078', '121.6485', '0', '0', '100'),
(@GUID + 02, @POINT := @POINT + 1, '4052.768', '-3521.180', '121.6582', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 03;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 03, @POINT := @POINT + 1, '4040.317', '-3519.078', '121.6485', '0', '11', '100'),
(@GUID + 03, @POINT := @POINT + 1, '4024.391', '-3520.038', '122.0079', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '4017.718', '-3540.070', '122.8682', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '4009.287', '-3557.343', '125.1329', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '4001.142', '-3574.829', '127.5148', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '3997.406', '-3601.483', '129.1390', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '3990.568', '-3623.250', '130.0376', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '3967.963', '-3640.871', '132.9653', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '3939.726', '-3649.159', '139.2397', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '3967.963', '-3640.871', '132.9653', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '3990.568', '-3623.250', '130.0376', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '3997.406', '-3601.483', '129.1390', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '4001.142', '-3574.829', '127.5148', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '4009.287', '-3557.343', '125.1329', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '4017.718', '-3540.070', '122.8682', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '4024.391', '-3520.038', '122.0079', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '4040.317', '-3519.078', '121.6485', '0', '0', '100'),
(@GUID + 03, @POINT := @POINT + 1, '4052.768', '-3521.180', '121.6582', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 04;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 04, @POINT := @POINT + 1, '4006.214', '-3544.493', '123.3955', '0', '11', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4041.109', '-3522.289', '121.8847', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4062.124', '-3531.168', '122.2874', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4035.811', '-3528.732', '122.4344', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4019.317', '-3528.228', '122.1163', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4006.195', '-3556.553', '124.9073', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3989.481', '-3588.787', '127.5852', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3976.519', '-3585.482', '127.6888', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3964.556', '-3568.536', '127.8451', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3960.291', '-3557.213', '128.6039', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3989.231', '-3554.605', '124.7409', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4003.149', '-3565.293', '126.2914', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3994.237', '-3598.019', '128.7352', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3997.831', '-3617.911', '128.9647', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4004.635', '-3629.829', '129.6341', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3982.108', '-3631.739', '130.2734', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3962.179', '-3642.436', '133.3074', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3982.108', '-3631.739', '130.2734', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4004.635', '-3629.829', '129.6341', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3997.831', '-3617.911', '128.9647', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3994.237', '-3598.019', '128.7352', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4003.149', '-3565.293', '126.2914', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3989.231', '-3554.605', '124.7409', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3960.204', '-3556.982', '128.6165', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3964.556', '-3568.536', '127.8451', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3976.519', '-3585.482', '127.6888', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3989.481', '-3588.787', '127.5852', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4006.195', '-3556.553', '124.9073', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4019.317', '-3528.228', '122.1163', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4035.811', '-3528.732', '122.4344', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4062.124', '-3531.168', '122.2874', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4041.109', '-3522.289', '121.8847', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '4006.214', '-3544.493', '123.3955', '0', '0', '100'),
(@GUID + 04, @POINT := @POINT + 1, '3983.615', '-3545.684', '124.8809', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 05;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 05, @POINT := @POINT + 1, '4006.214', '-3544.493', '123.3955', '0', '11', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4041.109', '-3522.289', '121.8847', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4062.124', '-3531.168', '122.2874', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4035.811', '-3528.732', '122.4344', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4019.317', '-3528.228', '122.1163', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4006.195', '-3556.553', '124.9073', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3989.481', '-3588.787', '127.5852', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3976.519', '-3585.482', '127.6888', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3964.556', '-3568.536', '127.8451', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3960.291', '-3557.213', '128.6039', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3989.231', '-3554.605', '124.7409', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4003.149', '-3565.293', '126.2914', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3994.237', '-3598.019', '128.7352', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3997.831', '-3617.911', '128.9647', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4004.635', '-3629.829', '129.6341', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3982.108', '-3631.739', '130.2734', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3962.179', '-3642.436', '133.3074', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3982.108', '-3631.739', '130.2734', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4004.635', '-3629.829', '129.6341', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3997.831', '-3617.911', '128.9647', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3994.237', '-3598.019', '128.7352', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4003.149', '-3565.293', '126.2914', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3989.231', '-3554.605', '124.7409', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3960.204', '-3556.982', '128.6165', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3964.556', '-3568.536', '127.8451', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3976.519', '-3585.482', '127.6888', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3989.481', '-3588.787', '127.5852', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4006.195', '-3556.553', '124.9073', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4019.317', '-3528.228', '122.1163', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4035.811', '-3528.732', '122.4344', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4062.124', '-3531.168', '122.2874', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4041.109', '-3522.289', '121.8847', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '4006.214', '-3544.493', '123.3955', '0', '0', '100'),
(@GUID + 05, @POINT := @POINT + 1, '3983.615', '-3545.684', '124.8809', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 06;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 06, @POINT := @POINT + 1, '3867.772', '-3680.017', '142.9447', '0', '11', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3844.066', '-3688.324', '143.1286', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3829.266', '-3653.286', '145.4925', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3821.816', '-3635.054', '146.2683', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3839.657', '-3599.702', '144.3317', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3859.102', '-3579.139', '141.9189', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3883.772', '-3545.473', '137.7696', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3859.102', '-3579.139', '141.9189', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3839.657', '-3599.702', '144.3317', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3821.784', '-3634.978', '146.2768', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3829.266', '-3653.286', '145.4925', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3844.066', '-3688.324', '143.1286', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3867.772', '-3680.017', '142.9447', '0', '0', '100'),
(@GUID + 06, @POINT := @POINT + 1, '3901.579', '-3681.779', '141.1552', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 07;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 07, @POINT := @POINT + 1, '3867.772', '-3680.017', '142.9447', '0', '11', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3844.066', '-3688.324', '143.1286', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3829.266', '-3653.286', '145.4925', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3821.816', '-3635.054', '146.2683', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3839.657', '-3599.702', '144.3317', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3859.102', '-3579.139', '141.9189', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3883.772', '-3545.473', '137.7696', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3859.102', '-3579.139', '141.9189', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3839.657', '-3599.702', '144.3317', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3821.784', '-3634.978', '146.2768', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3829.266', '-3653.286', '145.4925', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3844.066', '-3688.324', '143.1286', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3867.772', '-3680.017', '142.9447', '0', '0', '100'),
(@GUID + 07, @POINT := @POINT + 1, '3901.579', '-3681.779', '141.1552', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 08;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 08, @POINT := @POINT + 1, '3876.978', '-3543.292', '137.9654', '0', '11', '100'),
(@GUID + 08, @POINT := @POINT + 1, '3863.605', '-3578.259', '141.3753', '0', '0', '100'),
(@GUID + 08, @POINT := @POINT + 1, '3849.272', '-3602.101', '143.5796', '0', '0', '100'),
(@GUID + 08, @POINT := @POINT + 1, '3841.887', '-3614.958', '145.0618', '0', '0', '100'),
(@GUID + 08, @POINT := @POINT + 1, '3833.568', '-3623.720', '145.4078', '0', '0', '100'),
(@GUID + 08, @POINT := @POINT + 1, '3812.112', '-3644.593', '146.6226', '0', '0', '100'),
(@GUID + 08, @POINT := @POINT + 1, '3833.568', '-3623.720', '145.4078', '0', '0', '100'),
(@GUID + 08, @POINT := @POINT + 1, '3841.701', '-3615.153', '145.0730', '0', '0', '100'),
(@GUID + 08, @POINT := @POINT + 1, '3849.175', '-3602.262', '143.5978', '0', '0', '100'),
(@GUID + 08, @POINT := @POINT + 1, '3863.605', '-3578.259', '141.3753', '0', '0', '100'),
(@GUID + 08, @POINT := @POINT + 1, '3876.975', '-3543.300', '137.9629', '0', '0', '100'),
(@GUID + 08, @POINT := @POINT + 1, '3872.041', '-3522.901', '138.3610', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 09;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 09, @POINT := @POINT + 1, '3876.978', '-3543.292', '137.9654', '0', '11', '100'),
(@GUID + 09, @POINT := @POINT + 1, '3863.605', '-3578.259', '141.3753', '0', '0', '100'),
(@GUID + 09, @POINT := @POINT + 1, '3849.272', '-3602.101', '143.5796', '0', '0', '100'),
(@GUID + 09, @POINT := @POINT + 1, '3841.887', '-3614.958', '145.0618', '0', '0', '100'),
(@GUID + 09, @POINT := @POINT + 1, '3833.568', '-3623.720', '145.4078', '0', '0', '100'),
(@GUID + 09, @POINT := @POINT + 1, '3812.112', '-3644.593', '146.6226', '0', '0', '100'),
(@GUID + 09, @POINT := @POINT + 1, '3833.568', '-3623.720', '145.4078', '0', '0', '100'),
(@GUID + 09, @POINT := @POINT + 1, '3841.701', '-3615.153', '145.0730', '0', '0', '100'),
(@GUID + 09, @POINT := @POINT + 1, '3849.175', '-3602.262', '143.5978', '0', '0', '100'),
(@GUID + 09, @POINT := @POINT + 1, '3863.605', '-3578.259', '141.3753', '0', '0', '100'),
(@GUID + 09, @POINT := @POINT + 1, '3876.975', '-3543.300', '137.9629', '0', '0', '100'),
(@GUID + 09, @POINT := @POINT + 1, '3872.041', '-3522.901', '138.3610', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 10;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 10, @POINT := @POINT + 1, '3825.589', '-3637.616', '146.2683', '0', '11', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3830.994', '-3654.648', '145.4073', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3843.038', '-3672.378', '144.1751', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3835.622', '-3701.872', '142.6342', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3858.735', '-3682.834', '142.8188', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3877.295', '-3702.883', '142.7733', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3884.243', '-3677.156', '141.8186', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3900.018', '-3672.843', '139.3767', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3884.243', '-3677.156', '141.8186', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3877.295', '-3702.883', '142.7733', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3858.735', '-3682.834', '142.8188', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3835.622', '-3701.872', '142.6342', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3843.038', '-3672.378', '144.1751', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3830.994', '-3654.648', '145.4073', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3825.589', '-3637.616', '146.2683', '0', '0', '100'),
(@GUID + 10, @POINT := @POINT + 1, '3825.659', '-3613.042', '145.3223', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 11;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 11, @POINT := @POINT + 1, '3825.589', '-3637.616', '146.2683', '0', '11', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3830.994', '-3654.648', '145.4073', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3843.038', '-3672.378', '144.1751', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3835.622', '-3701.872', '142.6342', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3858.735', '-3682.834', '142.8188', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3877.295', '-3702.883', '142.7733', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3884.243', '-3677.156', '141.8186', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3900.018', '-3672.843', '139.3767', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3884.243', '-3677.156', '141.8186', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3877.295', '-3702.883', '142.7733', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3858.735', '-3682.834', '142.8188', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3835.622', '-3701.872', '142.6342', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3843.038', '-3672.378', '144.1751', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3830.994', '-3654.648', '145.4073', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3825.589', '-3637.616', '146.2683', '0', '0', '100'),
(@GUID + 11, @POINT := @POINT + 1, '3825.659', '-3613.042', '145.3223', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 12;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 12, @POINT := @POINT + 1, '4034.626', '-3522.788', '121.9841', '0', '11', '100'),
(@GUID + 12, @POINT := @POINT + 1, '4011.729', '-3544.598', '123.3231', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '4004.572', '-3561.597', '125.8133', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '4001.470', '-3584.367', '128.7754', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3992.750', '-3616.823', '129.5816', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3977.861', '-3632.357', '130.2103', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3955.903', '-3645.677', '134.6364', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3941.329', '-3647.643', '138.7606', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3908.146', '-3672.523', '138.9765', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3879.029', '-3680.381', '142.3059', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3857.208', '-3682.060', '142.8944', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3840.657', '-3667.585', '144.4126', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3831.583', '-3635.955', '146.2683', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3838.776', '-3608.240', '145.1143', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3853.099', '-3582.581', '142.6207', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3865.073', '-3561.984', '138.6980', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3891.764', '-3545.740', '137.5531', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3865.073', '-3561.984', '138.6980', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3853.099', '-3582.581', '142.6207', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3838.776', '-3608.240', '145.1143', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3831.583', '-3635.955', '146.2683', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3840.657', '-3667.585', '144.4126', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3857.132', '-3682.066', '142.8977', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3879.029', '-3680.381', '142.3059', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3908.146', '-3672.523', '138.9765', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3941.329', '-3647.643', '138.7606', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3955.903', '-3645.677', '134.6364', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3977.861', '-3632.357', '130.2103', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '3992.750', '-3616.823', '129.5816', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '4001.470', '-3584.367', '128.7754', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '4004.572', '-3561.597', '125.8133', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '4011.729', '-3544.598', '123.3231', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '4034.626', '-3522.788', '121.9841', '0', '0', '100'),
(@GUID + 12, @POINT := @POINT + 1, '4058.864', '-3530.328', '122.2466', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 13;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 13, @POINT := @POINT + 1, '4034.626', '-3522.788', '121.9841', '0', '11', '100'),
(@GUID + 13, @POINT := @POINT + 1, '4011.729', '-3544.598', '123.3231', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '4004.572', '-3561.597', '125.8133', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '4001.470', '-3584.367', '128.7754', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3992.750', '-3616.823', '129.5816', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3977.861', '-3632.357', '130.2103', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3955.903', '-3645.677', '134.6364', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3941.329', '-3647.643', '138.7606', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3908.146', '-3672.523', '138.9765', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3879.029', '-3680.381', '142.3059', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3857.208', '-3682.060', '142.8944', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3840.657', '-3667.585', '144.4126', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3831.583', '-3635.955', '146.2683', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3838.776', '-3608.240', '145.1143', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3853.099', '-3582.581', '142.6207', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3865.073', '-3561.984', '138.6980', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3891.764', '-3545.740', '137.5531', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3865.073', '-3561.984', '138.6980', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3853.099', '-3582.581', '142.6207', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3838.776', '-3608.240', '145.1143', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3831.583', '-3635.955', '146.2683', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3840.657', '-3667.585', '144.4126', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3857.132', '-3682.066', '142.8977', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3879.029', '-3680.381', '142.3059', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3908.146', '-3672.523', '138.9765', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3941.329', '-3647.643', '138.7606', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3955.903', '-3645.677', '134.6364', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3977.861', '-3632.357', '130.2103', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '3992.750', '-3616.823', '129.5816', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '4001.470', '-3584.367', '128.7754', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '4004.572', '-3561.597', '125.8133', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '4011.729', '-3544.598', '123.3231', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '4034.626', '-3522.788', '121.9841', '0', '0', '100'),
(@GUID + 13, @POINT := @POINT + 1, '4058.864', '-3530.328', '122.2466', '0', '0', '100');

SET @POINT := 0;
DELETE FROM `creature_movement` WHERE `id`=@GUID + 14;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID + 14, @POINT := @POINT + 1, '4034.626', '-3522.788', '121.9841', '0', '11', '100'),
(@GUID + 14, @POINT := @POINT + 1, '4011.729', '-3544.598', '123.3231', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '4004.572', '-3561.597', '125.8133', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '4001.470', '-3584.367', '128.7754', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3992.750', '-3616.823', '129.5816', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3977.861', '-3632.357', '130.2103', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3955.903', '-3645.677', '134.6364', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3941.329', '-3647.643', '138.7606', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3908.146', '-3672.523', '138.9765', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3879.029', '-3680.381', '142.3059', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3857.208', '-3682.060', '142.8944', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3840.657', '-3667.585', '144.4126', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3831.583', '-3635.955', '146.2683', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3838.776', '-3608.240', '145.1143', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3853.099', '-3582.581', '142.6207', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3865.073', '-3561.984', '138.6980', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3891.764', '-3545.740', '137.5531', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3865.073', '-3561.984', '138.6980', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3853.099', '-3582.581', '142.6207', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3838.776', '-3608.240', '145.1143', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3831.583', '-3635.955', '146.2683', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3840.657', '-3667.585', '144.4126', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3857.132', '-3682.066', '142.8977', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3879.029', '-3680.381', '142.3059', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3908.146', '-3672.523', '138.9765', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3941.329', '-3647.643', '138.7606', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3955.903', '-3645.677', '134.6364', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3977.861', '-3632.357', '130.2103', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '3992.750', '-3616.823', '129.5816', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '4001.470', '-3584.367', '128.7754', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '4004.572', '-3561.597', '125.8133', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '4011.729', '-3544.598', '123.3231', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '4034.626', '-3522.788', '121.9841', '0', '0', '100'),
(@GUID + 14, @POINT := @POINT + 1, '4058.864', '-3530.328', '122.2466', '0', '0', '100');

REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
('32973', '1', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '0', '10'),
('32974', '1', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '0', '10'),
('32975', '1', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '0', '10'),
('32976', '1', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '0', '10'),
('32977', '1', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '0', '10'),
('32978', '1', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '0', '10'),
('32979', '1', 'Strat - Rockwing Gargoyle / Rockwing Screecher / Stonespine', '0', '0', '0', '10');

REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GUID + 00, '32973', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 01, '32973', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 02, '32974', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 03, '32974', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 04, '32975', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 05, '32975', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 06, '32976', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 07, '32976', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 08, '32977', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 09, '32977', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 10, '32978', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 11, '32978', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher', '0', '0', '10'),
(@GUID + 12, '32979', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher / Stonespine', '0', '0', '10'),
(@GUID + 13, '32979', '0', 'Strat - Rockwing Gargoyle / Rockwing Screecher / Stonespine', '0', '0', '10'),
(@GUID + 14, '32979', '15', 'Strat - Rockwing Gargoyle / Rockwing Screecher / Stonespine', '0', '0', '10');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
