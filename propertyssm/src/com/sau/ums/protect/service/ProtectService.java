package com.sau.ums.protect.service;

import javax.transaction.Transactional;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Protect;

public interface ProtectService {

    //查询房屋列表
    public PageInfo<Protect> listProtect(Protect protect, Integer pageNum);

    //删除安防
    @Transactional
    public boolean delProtect(Protect protect);

}
