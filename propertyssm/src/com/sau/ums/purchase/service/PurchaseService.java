package com.sau.ums.purchase.service;


import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Purchase;
import org.springframework.transaction.annotation.Transactional;

public interface PurchaseService {

    //查询采购列表
    public PageInfo<Purchase> listPurchase(Purchase purchase, Integer pageNum);

    //删除
    @Transactional
    public boolean delPurchase(Purchase purchase);

    //添加
    public boolean addPurchase(Purchase purchase);

}
