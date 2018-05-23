package com.sau.ums.park.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Park;
import com.sau.ums.park.dao.ParkDao;
import com.sau.ums.util.Constant;

@Service
public class ParkServiceImpl implements ParkService {

    @Autowired
    private ParkDao pdao;

    @Override
    public PageInfo<Park> listPark(Park park, Integer pageNum) {
        PageInfo<Park> page = null;
        if ((park.getCarnum() != null) && (!"".equals(park.getCarnum()))) {
            park.setCarnum("%" + park.getCarnum() + "%");
        }

        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Park> parklist = pdao.listPark(park);
        page = new PageInfo<Park>(parklist);
        return page;
    }

    @Override
    public boolean delPark(Park park) {
        boolean isSuccess = false;

        pdao.delPark(park);
        isSuccess = true;

        return isSuccess;
    }

}
