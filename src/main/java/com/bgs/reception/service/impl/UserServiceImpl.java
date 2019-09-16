package com.bgs.reception.service.impl;

import com.bgs.reception.dao.UserDao;
import com.bgs.reception.pojo.Area;
import com.bgs.reception.pojo.User;
import com.bgs.reception.pojo.UserParam;
import com.bgs.reception.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    //查询用户所属地区
    @Override
    public List<Area> findArea(Integer pId) {
        return userDao.findArea(pId);
    }

    //查询用户列表
    @Override
    public PageInfo<User> findUserTableById(Integer id, UserParam param) {
        int page = (param.getOffset()/param.getLimit())+1;
        int size = param.getLimit();

        PageHelper.startPage(page,size);
        List<User> list = userDao.findUserTableById(id,param);
        PageInfo<User> p = new PageInfo<>(list);
        return p;
    }

    //添加用户
    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }
}
