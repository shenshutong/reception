package com.bgs.reception.service;

import com.bgs.reception.pojo.Actual;
import com.bgs.reception.pojo.Forecast;

import java.util.List;

public interface CountyUserService {
    //预报数据
    int forecastData(Forecast forecast);

    List<Forecast> findForecastData();

    Forecast findDataById(Integer id);
    //上报数据
    int reportData(Actual actual);
}
