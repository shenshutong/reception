package com.bgs.reception.service;

import com.bgs.reception.pojo.Area;
import com.bgs.reception.pojo.User;
import com.bgs.reception.pojo.UserParam;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    //查询用户所属地区
    List<Area> findArea(Integer pId);

    //查询用户列表
    PageInfo<User> findUserTableById(Integer id, UserParam param);
    //添加用户
    int addUser(@Param("user") User user);
}
