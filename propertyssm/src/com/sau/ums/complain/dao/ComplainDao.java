package com.sau.ums.complain.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Complain;

@Repository
public interface ComplainDao {

    //查询投诉列表
    public List<Complain> listComplain(Complain complain);

    //删除
    public void delComplain(Integer id);

    //添加
    public void addComplain(Complain complain);

    //根据id查询信息
    Complain getComplainInfoById(Integer id);

    //修改
    public void updateComplain(Complain complain);

}
