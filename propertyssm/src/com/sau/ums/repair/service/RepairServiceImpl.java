package com.sau.ums.repair.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Repair;
import com.sau.ums.repair.dao.RepairDao;
import com.sau.ums.util.Constant;

@Service
public class RepairServiceImpl implements RepairService {

    @Autowired
    private RepairDao rdao;

    @Override
    public PageInfo<Repair> listRepair(Repair repair, Integer pageNum) {
        PageInfo<Repair> page = null;
        if ((repair.getName() != null) && (!"".equals(repair.getName()))) {
            repair.setName("%" + repair.getName() + "%");
        }

        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Repair> repairlist = rdao.listRepair(repair);
        page = new PageInfo<Repair>(repairlist);
        return page;
    }

    @Override
    public boolean delRepair(Repair repair) {
        boolean isSuccess = false;

        rdao.delRepair(repair);
        isSuccess = true;

        return isSuccess;
    }

    @Override
    public boolean addRepair(Repair repair) {
        boolean isSuccess = false;

        rdao.addRepair(repair);
        isSuccess = true;

        return isSuccess;
    }

}
