package com.bgs.reception.controller;

import com.bgs.reception.pojo.User;
import com.bgs.reception.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private LoginService loginService;

    //用户登录
    @RequestMapping("/userLogin")
    @ResponseBody
    public User userLogin(HttpSession session, String codeName, String password){
        User user = loginService.userLogin(codeName,password);

        if (user!=null){
            session.setAttribute("user",user);
        }
        return user;
    }

    //验证用户名
    @RequestMapping("/getName")
    @ResponseBody
    public boolean getName(String codeName){
        String name1 = loginService.getName(codeName);
        if (name1!=null){
            return true;
        }
        return false;
    }

    //退出登录
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session){
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/jsps/login.jsp";
    }

}
