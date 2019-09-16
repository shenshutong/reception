package com.bgs.reception.controller;

import com.bgs.reception.pojo.Data;
import com.bgs.reception.service.CheckDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/checkData")
public class CheckDataController {
    @Autowired
    private CheckDataService checkDataService;

    @RequestMapping("/checkManageEcharts")
    @ResponseBody
    public List<Data> checkManageEcharts(){
        List<Data> list = checkDataService.checkManageEcharts();
        return list;
    }

    @ResponseBody
    @RequestMapping("/showManageData")
    public List<Data> showManageData(){
        List<Data> list = checkDataService.showManageData();
        return list;
    }
    /*---------------------------------------------------------------------------------*/

    @RequestMapping("/checkCountyUserEcharts")
    @ResponseBody
    public List<Data> checkCountyUserEcharts(Integer areaId){
        List<Data> list = checkDataService.checkCountyUserEcharts(areaId);
        return list;
    }

    @ResponseBody
    @RequestMapping("/showCountyUserData")
    public List<Data> showCountyUserData(Integer id){
        List<Data> list = checkDataService.showCountyUserData(id);
        return list;
    }
}
