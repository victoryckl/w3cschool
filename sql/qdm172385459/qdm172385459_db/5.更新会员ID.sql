#查找没有会员号的记录
SELECT * FROM wp_tpxtransbwx WHERE cardno = '';

#更新cardno
#update wp_tpxtransbwx,wp_card_member set wp_tpxtransbwx.cardno=wp_card_member.number 
where wp_tpxtransbwx.openid=wp_card_member.openid and wp_tpxtransbwx.id>=25466 #上句SQL查询到的本次保卡转账记录的开始ID
