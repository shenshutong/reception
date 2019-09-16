package com.bgs.reception.dao;

import com.bgs.reception.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface LoginDao {
    //用户登录
    User userLogin(@Param("codeName") String codeName, @Param("password") String password);

    //验证用户名
    String getName(String name);
}
