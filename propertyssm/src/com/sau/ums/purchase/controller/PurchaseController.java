package com.sau.ums.purchase.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    //删除
    @RequestMapping("delPurchase.do")
    @ResponseBody
    public Map<String, Object> delPurchase(Purchase purchase,
            HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();

        boolean isSuccess = false;

        isSuccess = ps.delPurchase(purchase);

        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    //添加
    @RequestMapping("addPurchase.do")
    @ResponseBody
    public Map<String, Object> addPurchase(Purchase purchase,
            HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();

        boolean isSuccess = false;
        isSuccess = ps.addPurchase(purchase);

        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

}
