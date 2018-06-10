package com.sau.ums.propertyfee.dao;

import com.sau.ums.bean.Propertyfee;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by luchang on 2018/6/6.
 */
@Repository
public interface PropertyFeeDao {

    public List<Propertyfee> listPropertyfee(Propertyfee propertyfee);
}
