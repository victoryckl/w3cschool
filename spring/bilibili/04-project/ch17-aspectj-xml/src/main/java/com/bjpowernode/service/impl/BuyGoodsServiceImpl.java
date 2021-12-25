package com.bjpowernode.service.impl;

import com.bjpowernode.BuyGoodsService;
import com.bjpowernode.NotEnougthException;
import com.bjpowernode.dao.GoodsDao;
import com.bjpowernode.dao.SaleDao;
import com.bjpowernode.entity.Goods;
import com.bjpowernode.entity.Sale;

import java.util.stream.Stream;

public class BuyGoodsServiceImpl implements BuyGoodsService {

    private SaleDao saleDao;
    private GoodsDao goodsDao;

    public void setSaleDao(SaleDao saleDao) {
        this.saleDao = saleDao;
    }

    public void setGoodsDao(GoodsDao goodsDao) {
        this.goodsDao = goodsDao;
    }

    //可能有个的业务方法
    public void addSale() {}
    public void addGoods() {}

    public void modifySale() {}
    public void modifyGoods() {}

    public void removeSale() {}
    public void removeGoods() {}

    public void querySale() {}
    public void findGoods() {}

    @Override
    public void buy(Integer goodsId, int num) {
        System.out.println("====buy方法的开始====");
        System.out.println("=============================================");
        Stream.of(new Throwable().getStackTrace()).forEach(System.out::println);

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
