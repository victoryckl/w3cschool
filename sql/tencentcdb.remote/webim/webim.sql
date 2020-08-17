SELECT * FROM `im_module_time` WHERE package_name='com.mobisystems.fileman' LIMIT 10;

SELECT * FROM `im_module_time` WHERE app_name LIKE 'A%' LIMIT 10;

UPDATE `im_module_time` SET app_name='名师辅导班' WHERE package_name='com.cybertron.teacherlecture';
