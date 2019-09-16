package com.bgs.reception.service;

import com.bgs.reception.pojo.User;

public interface LoginService {
    //用户登录
    User userLogin(String codeName, String password);

    //验证用户名
    String getName(String name);
}
