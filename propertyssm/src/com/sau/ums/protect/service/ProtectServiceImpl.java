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

    //删除
    @Override
    public boolean delProtect(Protect protect) {
        boolean isSuccess = false;

        pdao.delProtect(protect);
        isSuccess = true;

        return isSuccess;
    }

    //添加
    @Override
    public boolean addProtect(Protect protect) {
        boolean isSuccess = false;

        pdao.addProtect(protect);
        isSuccess = true;

        return isSuccess;
    }

}
