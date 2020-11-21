SELECT id FROM module_list WHERE package='com.cybertron.cybereader' ORDER BY id DESC LIMIT 1;

INSERT INTO module_list(type, name, package)
VALUES(0,'十点多','com.xxx.xx');

SELECT t2.name,t2.package, t1.* FROM module_time t1
INNER JOIN module_list t2 ON t1.moduleId = t2.id
WHERE tabletUser='test';