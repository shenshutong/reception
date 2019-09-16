package com.bgs.reception.controller;

import com.bgs.reception.pojo.Actual;
import com.bgs.reception.pojo.Forecast;
import com.bgs.reception.service.CountyUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/countyUser")
public class CountyUserController {
    @Autowired
    private CountyUserService countyUserService;

    //预报数据
    @RequestMapping("/forecastData")
    @ResponseBody
    public boolean forecastData(Forecast forecast){
        int i = countyUserService.forecastData(forecast);
        if (i>0){
            return true;
        }
        return false;
    }

    @ResponseBody
    @RequestMapping("/findForecastData")
    public List<Forecast> findForecastData(){
        List<Forecast> list = countyUserService.findForecastData();
        return list;
    }

    @RequestMapping("/findDataById")
    @ResponseBody
    public Forecast findDataById(Model model, HttpServletRequest request, Integer id){
       Forecast forecast = countyUserService.findDataById(id);
        //Forecast forecast = new Forecast();
        //request.setAttribute("param",forecast);
       // model.addAttribute("forecast",forecast);
        //return "countyUser/reportData";
        return forecast;
    }

    //上报数据
    @RequestMapping("/reportData")
    @ResponseBody
    public boolean reportData(Actual actual){
        int i = countyUserService.reportData(actual);
        if (i>0){
            return true;
        }
        return false;
    }


}
