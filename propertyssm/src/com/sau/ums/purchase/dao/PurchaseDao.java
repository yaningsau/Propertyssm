package com.sau.ums.purchase.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Purchase;

@Repository
public interface PurchaseDao {

    //查询采购列表
    public List<Purchase> listPurchase(Purchase purchase);

    //删除
    public void delPurchase(Purchase purchase);

    //添加
    public void addPurchase(Purchase purchase);

}
