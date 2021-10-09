##更新表(从EXCEL导入的表转换)
##更新微信后台表格
insert into wp_tpxtransbwx(timestamp,timestr,wxorder,merchantID,money,remark,wxtoken,openid,commiter) 
select unix_timestamp(cTime),cTime,wxorder,clientorder,money,remark,wxtoken,openid,status from wp_wechat_20211008_113210;