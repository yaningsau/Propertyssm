package com.sau.ums.guard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Guard;
import com.sau.ums.guard.dao.GuardDao;
import com.sau.ums.util.Constant;

@Service
public class GuardServiceImpl implements GuardService {

    @Autowired
    private GuardDao gdao;

    //查询外来人员列表
    @Override
    public PageInfo<Guard> listGuard(Guard guard, Integer pageNum) {
        PageInfo<Guard> page = null;
        if ((guard.getName() != null) && (!"".equals(guard.getName()))) {
            guard.setName("%" + guard.getName() + "%");
        }

        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Guard> guardlist = gdao.listGuard(guard);
        page = new PageInfo<Guard>(guardlist);
        return page;
    }

    //删除
    @Override
    public boolean delGuard(Integer id) {
        boolean isSUccess = false;

        gdao.delGuard(id);
        isSUccess = true;

        return isSUccess;
    }

    //添加
    @Override
    public boolean addGuard(Guard guard) {
        boolean isSUccess = false;

        gdao.addGuard(guard);
        isSUccess = true;

        return isSUccess;
    }

}
