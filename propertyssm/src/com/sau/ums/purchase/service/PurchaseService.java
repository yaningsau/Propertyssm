package com.sau.ums.purchase.service;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Purchase;

public interface PurchaseService {

    //查询采购列表
    public PageInfo<Purchase> listPurchase(Purchase purchase, Integer pageNum);

}
