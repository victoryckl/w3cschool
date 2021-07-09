# 记得修改对应的日期
set @start_time = '2021-06-15 00:00:00';
set @end_time =  '2021-07-07 23:59:59';
#succ
select wp_tpxguarantee.id,wp_tpxguarantee.devtype,wp_tpxguarantee.devid,wp_tpxguarantee.guaranter,
wp_tpxguarantee.flag,wp_tpxguarantee.remark,wp_tpxguarantee.isiden,FROM_UNIXTIME(wp_tpxguarantee.cTime) time, 
wp_card_member.username,wp_card_member.phone,wp_card_member.address  
from wp_tpxguarantee,wp_card_member  
where devtype not in ("P10","P12","P16","P18") 
and wp_tpxguarantee.cTime > unix_timestamp(@start_time)  
and wp_tpxguarantee.cTime < unix_timestamp(@end_time) 
and wp_tpxguarantee.flag=1 
and wp_tpxguarantee.guaranter=wp_card_member.number 
order by wp_tpxguarantee.id; 
