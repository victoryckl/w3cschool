##生成转账预处理表数据
## 记得修改wp_transpre_表格对应的日期
insert into wp_tpxtranspre(cardno,openid,merchatid,money,remark) 
select cardno,openid,merchatid,money,remark from wp_transpre_20210820_145907;
