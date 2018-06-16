package com.sau.ums.protect.service;

import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Protect;

public interface ProtectService {

    //查询房屋列表
    public PageInfo<Protect> listProtect(Protect protect, Integer pageNum);

    //删除安防
    @Transactional
    public boolean delProtect(Protect protect);

    //添加安防
    public boolean addProtect(Protect protect);

    //修改
    public boolean updateProtect(Protect protect);

    //根据id查询信息
    Protect getProtectInfoById(Integer id);

}
