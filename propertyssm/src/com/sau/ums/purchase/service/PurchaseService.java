package com.sau.ums.purchase.service;

import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Purchase;

public interface PurchaseService {

    //查询采购列表
    public PageInfo<Purchase> listPurchase(Purchase purchase, Integer pageNum);

    //删除
    @Transactional
    public boolean delPurchase(Purchase purchase);

    //添加
    public boolean addPurchase(Purchase purchase);

    //修改
    public boolean updatePurchase(Purchase purchase);

    //根据id获取信息
    Purchase getPurchaseInfoById(Integer id);
}
