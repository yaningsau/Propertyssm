package com.sau.ums.purchase.service;

import javax.transaction.Transactional;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Purchase;

public interface PurchaseService {

    //查询采购列表
    public PageInfo<Purchase> listPurchase(Purchase purchase, Integer pageNum);

    //删除
    @Transactional
    public boolean delPurchase(Purchase purchase);

}
