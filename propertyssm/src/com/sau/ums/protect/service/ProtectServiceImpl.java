package com.sau.ums.protect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Protect;
import com.sau.ums.protect.dao.ProtectDao;
import com.sau.ums.util.Constant;

@Service
public class ProtectServiceImpl implements ProtectService {

    @Autowired
    private ProtectDao pdao;

    //查询安防列表
    @Override
    public PageInfo<Protect> listProtect(Protect protect, Integer pageNum) {
        PageInfo<Protect> page = null;
        if ((protect.getPosition() != null)
                && (!"".equals(protect.getPosition()))) {
            protect.setPosition("%" + protect.getPosition() + "%");
        }
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Protect> protectlist = pdao.listProtect(protect);
        page = new PageInfo<Protect>(protectlist);
        return page;
    }

    @Override
    public boolean delProtect(Protect protect) {
        boolean isSuccess = false;

        pdao.delProtect(protect);
        isSuccess = true;

        return isSuccess;
    }

}
