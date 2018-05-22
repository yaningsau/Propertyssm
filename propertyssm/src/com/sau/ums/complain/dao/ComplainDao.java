package com.sau.ums.complain.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Complain;

@Repository
public interface ComplainDao {

    //查询投诉列表
    public List<Complain> listComplain(Complain complain);

}