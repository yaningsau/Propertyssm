package com.sau.ums.complain.service;


import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Complain;
import org.springframework.transaction.annotation.Transactional;

public interface ComplainService {

    //查询投诉列表
    public PageInfo<Complain> listComplain(Complain complain, Integer pageNum);

    //删除
    @Transactional
    public boolean delComplain(Integer id);

    //添加
    public boolean addComplain(Complain complain);

}
