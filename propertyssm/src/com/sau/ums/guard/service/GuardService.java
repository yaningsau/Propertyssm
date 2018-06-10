package com.sau.ums.guard.service;


import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Guard;
import org.springframework.transaction.annotation.Transactional;

public interface GuardService {

    //查询外来人员列表
    public PageInfo<Guard> listGuard(Guard guard, Integer pageNum);

    //删除
    @Transactional
    public boolean delGuard(Integer id);

    //添加
    public boolean addGuard(Guard guard);

}
