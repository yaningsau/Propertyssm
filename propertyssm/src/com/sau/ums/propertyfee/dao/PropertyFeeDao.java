package com.sau.ums.propertyfee.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Propertyfee;

@Repository
public interface PropertyFeeDao {

    public List<Propertyfee> listPropertyfee(Propertyfee propertyfee);

    //查询housefee
    public Propertyfee getHousefee(String room);

    //修改物业费
    public void Propertyfee(Propertyfee propertyfee);

}
