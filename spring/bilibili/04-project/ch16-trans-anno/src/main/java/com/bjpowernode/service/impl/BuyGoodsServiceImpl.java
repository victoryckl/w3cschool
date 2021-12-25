package com.bjpowernode.service.impl;

import com.bjpowernode.BuyGoodsService;
import com.bjpowernode.NotEnougthException;
import com.bjpowernode.dao.GoodsDao;
import com.bjpowernode.dao.SaleDao;
import com.bjpowernode.entity.Goods;
import com.bjpowernode.entity.Sale;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public class BuyGoodsServiceImpl implements BuyGoodsService {

    private SaleDao saleDao;
    private GoodsDao goodsDao;

    public void setSaleDao(SaleDao saleDao) {
        this.saleDao = saleDao;
    }

    public void setGoodsDao(GoodsDao goodsDao) {
        this.goodsDao = goodsDao;
    }

    //spring事务注解
    @Transactional(
            propagation = Propagation.REQUIRED,
            isolation = Isolation.DEFAULT,
            readOnly = false, timeout = 20,
            rollbackFor = {NullPointerException.class, NotEnougthException.class}
    )
    @Override
    public void buy(Integer goodsId, int num) {
        System.out.println("====buy方法的开始====");

        //生成销售记录
        Sale sale = new Sale();
        sale.setGid(goodsId);
        sale.setNum(num);
        saleDao.insertSale(sale);

        //查询商品
        Goods goods = goodsDao.selectById(goodsId);
        if (goods == null) {
            throw new NullPointerException(goodsId +" 商品不存在");
        } else if (goods.getAmount() < num) {
            throw new NotEnougthException(goodsId +" 商品不足");
        }

        //更新库存
        Goods buyGoods = new Goods();
        buyGoods.setId(goodsId);
        buyGoods.setAmount(num);
        goodsDao.updateGoods(buyGoods);

        System.out.println("====buy方法的完成====");
    }
}
