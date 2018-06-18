package com.sau.ums.park.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Park;
import com.sau.ums.bean.Propertyfee;
import com.sau.ums.park.dao.ParkDao;
import com.sau.ums.propertyfee.dao.PropertyFeeDao;
import com.sau.ums.util.Constant;

@Service
public class ParkServiceImpl implements ParkService {

    @Autowired
    private ParkDao pdao;

    @Autowired
    private PropertyFeeDao propertyFeeDao;

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

    @Override
    public boolean addPark(Park park) {
        boolean isSuccess = false;

        pdao.addPark(park);
        isSuccess = true;

        return isSuccess;
    }

    @Override
    public Park getParkInfoById(String carnum) {
        return pdao.getParkInfoById(carnum);
    }

    @Override
    public boolean updatePark(Park park) {
        boolean isSuccess = false;

        pdao.updatePark(park);
        isSuccess = true;

        return isSuccess;
    }

    @Override
    public List<Park> getParkInfoByRoom(String room) {

        return pdao.getParkInfoByRoom(room);
    }

    @Override
    public boolean updateParkFee(Propertyfee propertyfee) {
        boolean isSuccess = false;

        pdao.updateParkFee(propertyfee);
        isSuccess = true;

        return isSuccess;
    }

    @Override
    public Propertyfee getHousefee(String room) {

        return propertyFeeDao.getHousefee(room);
    }

    @Override
    public List<Park> getParkInfo() {

        return pdao.getParkInfo();
    }

    @Override
    public boolean TupdatePark(Park park) {
        boolean isSuccess = false;

        pdao.TupdatePark(park);
        isSuccess = true;

        return isSuccess;
    }

    @Override
    public String getPark(String carnum) {

        return pdao.getPark(carnum);
    }

}
