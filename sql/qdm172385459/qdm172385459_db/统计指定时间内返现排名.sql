#起始ID
set @start_id=25576;#2021.7.8日返现记录(wp_tpxtransbwx)最小ID
set @end_id=25730;#2021.8.8日返现记录(wp_tpxtransbwx)最大ID

#返现排名
SELECT cardno 会员号,wp_card_member.username 姓名, SUM(wp_tpxtransbwx.money) 金额 
FROM `wp_tpxtransbwx`,wp_card_member
WHERE wp_tpxtransbwx.id >= @start_id
	AND wp_tpxtransbwx.id <= @end_id
	AND wp_tpxtransbwx.commiter='付款成功'
  AND wp_tpxtransbwx.cardno=wp_card_member.number
GROUP BY cardno
ORDER BY 金额 DESC;

#返现记录：
set @start_id=21763; #某一批的返现在wp_tpxtranspre开始id
SELECT wp_tpxtranspre.cardno 会员号, wp_card_member.username 姓名, 
			(wp_tpxtranspre.money/100) 金额, wp_tpxtranspre.remark 详情
FROM wp_tpxtranspre,wp_card_member 
WHERE wp_tpxtranspre.id >= @start_id AND wp_tpxtranspre.status='已通知微信发放给您，稍后您会收到公众号的领取通知' 
	AND wp_tpxtranspre.cardno=wp_card_member.number
ORDER BY wp_tpxtranspre.cardno;
