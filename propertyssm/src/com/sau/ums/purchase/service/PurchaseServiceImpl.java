package com.sau.ums.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Purchase;
import com.sau.ums.purchase.dao.PurchaseDao;
import com.sau.ums.util.Constant;

@Service
public class PurchaseServiceImpl implements PurchaseService {

    @Autowired
    private PurchaseDao pdao;

    //查询采购列表
    @Override
    public PageInfo<Purchase> listPurchase(Purchase purchase, Integer pageNum) {

        PageInfo<Purchase> page = null;
        if ((purchase.getSname() != null) && (!"".equals(purchase.getSname()))) {
            purchase.setSname("%" + purchase.getSname() + "%");
        }
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Purchase> purchaselist = pdao.listPurchase(purchase);
        page = new PageInfo<Purchase>(purchaselist);
        return page;
    }

    //删除
    @Override
    public boolean delPurchase(Purchase purchase) {
        boolean isSuccess = false;

        pdao.delPurchase(purchase);
        isSuccess = true;

        return isSuccess;
    }
}
