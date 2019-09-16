package com.bgs.reception.dao;

import com.bgs.reception.pojo.Actual;
import com.bgs.reception.pojo.Forecast;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CountyUserDao {
    //预报数据
    int forecastData(Forecast forecast);

    List<Forecast> findForecastData();

    Forecast findDataById(@Param("id") Integer id);
    //上报数据
    int reportData(Actual actual);
}
