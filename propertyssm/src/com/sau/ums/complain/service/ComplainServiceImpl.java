package com.sau.ums.complain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Complain;
import com.sau.ums.complain.dao.ComplainDao;
import com.sau.ums.util.Constant;

@Service
public class ComplainServiceImpl implements ComplainService {

    @Autowired
    private ComplainDao cdao;

    //查询投诉列表
    @Override
    public PageInfo<Complain> listComplain(Complain complain, Integer pageNum) {
        PageInfo<Complain> page = null;
        if ((complain.getId() != null) && (!"".equals(complain.getId()))) {
            complain.setId(complain.getId());
        }

        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Complain> complainlist = cdao.listComplain(complain);
        page = new PageInfo<Complain>(complainlist);
        return page;
    }
}
