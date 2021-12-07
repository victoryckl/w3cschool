#查找没有会员号的记录
#需要打开 wp_tpxtransbwx 表，按照id DESC排序，找到最近转款记录中没有会员号的首记录，记录下他的ID

#更新cardno
update wp_tpxtransbwx,wp_card_member set wp_tpxtransbwx.cardno=wp_card_member.number 
where wp_tpxtransbwx.openid=wp_card_member.openid and wp_tpxtransbwx.id>=26001 #上面查询到的本次保卡转账记录的开始ID
