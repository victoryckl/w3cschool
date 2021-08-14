#在统计保卡前，需要先进行这个操作
#手动选择，先执行1，完成后，再执行2

#1.更新保卡上传表-设置为99（人工判定）
update wp_tpxguarantee set flag = 99 where flag=0 and devid like 'CHK%';


#2.更新保卡上传表-设置为1（自动判定）
update wp_tpxguarantee set flag = 1 where flag=0;