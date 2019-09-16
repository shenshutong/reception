package com.bgs.reception.controller;

import com.bgs.reception.pojo.Area;
import com.bgs.reception.pojo.User;
import com.bgs.reception.pojo.UserParam;
import com.bgs.reception.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    //查询用户所属地区
    @RequestMapping("/findArea")
    @ResponseBody
    public List<Area> findArea(Integer id){
        List<Area> list = userService.findArea(id);
        return list;
    }

    //查询用户列表
    @ResponseBody
    @RequestMapping("/findUserTableById")
    public PageInfo<User> findUserTableById(Integer id,UserParam param){
        PageInfo<User> pageInfo = userService.findUserTableById(id,param);
        return pageInfo;
    }

    //添加用户
    @RequestMapping("/addUser")
    @ResponseBody
    public boolean addUser(User user){
        int i = userService.addUser(user);
        if (i>0){
            return true;
        }
        return false;
    }













}
