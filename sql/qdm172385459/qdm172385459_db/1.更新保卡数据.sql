# 在统计保卡前，需要先进行这个操作
update wp_tpxguarantee set flag = 99 where flag=0 and devid like 'CHK%';
# 更新保卡上传表-设置为1（自动判定）
update wp_tpxguarantee set flag = 1 where flag=0;