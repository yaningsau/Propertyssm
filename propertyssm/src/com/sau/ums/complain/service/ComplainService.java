package com.sau.ums.complain.service;

import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Complain;

public interface ComplainService {

    //查询投诉列表
    public PageInfo<Complain> listComplain(Complain complain, Integer pageNum);

    //删除
    @Transactional
    public boolean delComplain(Integer id);

    //添加
    public boolean addComplain(Complain complain);

    //根据id查询信息
    Complain getComplainInfoById(Integer id);

    //修改
    public boolean updateComplain(Complain complain);

}
