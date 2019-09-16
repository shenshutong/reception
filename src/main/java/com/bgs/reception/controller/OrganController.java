package com.bgs.reception.controller;

import com.bgs.reception.pojo.Area;
import com.bgs.reception.service.OrganService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/organ")
public class OrganController {
    @Autowired
    private OrganService organService;

    @RequestMapping("/findOrgan")
    public String findOrgan(Model model,HttpSession session){
        List<Area> list = organService.findOrgan();
       // model.addAttribute("list",list);
        session.setAttribute("list",list);
        return "/manage/OrganManagement";
    }

    //添加机构
    @RequestMapping("/addOrgan")
    @ResponseBody
    public boolean addOrgan(String areaName,String organCode,Integer pId){
        int i = organService.addOrgan(areaName,organCode,pId);
        if (i>0){
            return true;
        }
        return false;
    }

    //删除机构
    @ResponseBody
    @RequestMapping("/deleteOrganById")
    public boolean deleteOrganById(Integer id){
        int i = organService.deleteOrganById(id);
        if (i>0){
            return true;
        }
        return false;
    }

    //修改机构名称
    @RequestMapping("/updateOrganName")
    @ResponseBody
    public boolean updateOrganName(Integer id, String areaName){
        int i = organService.updateOrganName(id,areaName);
        if (i!=0){
            return true;
        }
        return false;
    }
}
