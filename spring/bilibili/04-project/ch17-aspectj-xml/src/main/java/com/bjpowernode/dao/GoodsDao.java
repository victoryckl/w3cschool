package com.bjpowernode.dao;

import com.bjpowernode.entity.Goods;

public interface GoodsDao {
    Goods selectById(Integer id);

    //参数goods 表示本次购买的商品ID和购买数量
    // id 商品ID，amount 本次购买此商品的数量
    int updateGoods(Goods goods);
}
