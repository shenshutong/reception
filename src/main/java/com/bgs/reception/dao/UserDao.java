package com.bgs.reception.dao;

import com.bgs.reception.pojo.Area;
import com.bgs.reception.pojo.User;
import com.bgs.reception.pojo.UserParam;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    //查询用户所属地区
    List<Area> findArea(Integer pId);

    //查询用户列表
    List<User> findUserTableById(@Param("id") Integer id, @Param("param") UserParam param);

    //添加用户
    int addUser(User user);
}
