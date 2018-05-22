package com.sau.ums.purchase.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Purchase;
import com.sau.ums.purchase.service.PurchaseService;

@Controller
public class PurchaseController {

    @Autowired
    public PurchaseService ps;

    @RequestMapping("listPurchase.do")
    public String listPurchase(Purchase purchase, Integer pageNum,
            ModelMap model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        Purchase p = new Purchase();
        p.setSname(purchase.getSname());

        PageInfo<Purchase> page = ps.listPurchase(purchase, pageNum);

        model.addAttribute("page", page);
        model.addAttribute("condition", p);

        return "listPurchase";

    }

}
