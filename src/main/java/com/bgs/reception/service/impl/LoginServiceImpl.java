package com.bgs.reception.service.impl;

import com.bgs.reception.dao.LoginDao;
import com.bgs.reception.pojo.User;
import com.bgs.reception.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginDao loginDao;

    //用户登录
    @Override
    public User userLogin(String codeName, String password) {
        return loginDao.userLogin(codeName,password);
    }

    //验证用户名
    @Override
    public String getName(String name) {
        return loginDao.getName(name);
    }
}
