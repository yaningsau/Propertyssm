package com.sau.ums.protect.service;


import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Protect;
import org.springframework.transaction.annotation.Transactional;

public interface ProtectService {

    //查询房屋列表
    public PageInfo<Protect> listProtect(Protect protect, Integer pageNum);

    //删除安防
    @Transactional
    public boolean delProtect(Protect protect);

    //添加安防
    public boolean addProtect(Protect protect);

}
