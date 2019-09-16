package com.bgs.reception.controller;

import com.bgs.reception.pojo.Data;
import com.bgs.reception.pojo.Pic;
import com.bgs.reception.service.AddDataService;
import com.bgs.reception.utils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/data")
public class AddDataController {

    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    @Autowired
    private AddDataService addDataService;

    @RequestMapping("/predictionData")
    @ResponseBody
    public boolean predictionData(Data data) {
        int i = addDataService.predictionData(data);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @ResponseBody
    @RequestMapping("/findDataByStatus")
    public List<Data> findDataByStatus() {
        List<Data> list = addDataService.findDataByStatus();
        return list;
    }

   /* @RequestMapping("/findDataById")
    @ResponseBody
    public Data findDataById(Integer id, HttpSession session) {
        Data data = addDataService.findDataById(id);
        if (data != null) {
            session.setAttribute("data", data);
        }
        return data;
    }*/
    @RequestMapping("/findDataById")
    public String findDataById(Integer id, HttpSession session,Model model) {
        Data userData = addDataService.findDataById(id);
        if (userData != null) {
            session.setAttribute("userData", userData);
            //model.addAttribute("userData",userData);
        }
        return "countyUser/addData";
    }

    @RequestMapping("/updateData")
    @ResponseBody
    public boolean updateData(Data data) {
        int i = addDataService.updateData(data);
        boolean flag = false;
        if(i!=0) {
            flag=true;
        }
        return flag;
    }

    @RequestMapping("uploadPic")
    @ResponseBody
    public Map<String, Object> uploadPic(MultipartFile pic, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        Data data = (Data) session.getAttribute("userData");//获取dataId
        if (data != null) {
            List<Pic> list = new ArrayList<>();//集合
            Pic pic1 = new Pic();//对象

            String fileName = data.getId() + "_" + sdf.format(new Date());//上传文件名拼接
            pic1.setPicName(fileName);// 图片名
            pic1.setDataId(data.getId());// dataId
           //pic1.setPicAddress(Constant.pic_address_name);
            pic1.setPicAddress("pic_address");
            String target = "D:" + File.separator + "img" + File.separator + "pic_address" + File.separator + fileName + ".jpg";//服务器地址
            File temp = new File(target);
            list.add(pic1);//对象添加到集合中


            try {
                pic.transferTo(temp);
            } catch (IOException e) {
                map.put("status", false);
                e.printStackTrace();
            }
            int i = addDataService.uploadPic(pic1);
            if (i > 0) {
                map.put("status", true);
            } else {
                map.put("status", false);
            }
        } else {
            map.put("err", false);
        }
        return map;
    }
}
