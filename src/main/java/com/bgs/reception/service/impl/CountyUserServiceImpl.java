package com.bgs.reception.service.impl;

import com.bgs.reception.dao.CountyUserDao;
import com.bgs.reception.pojo.Actual;
import com.bgs.reception.pojo.Forecast;
import com.bgs.reception.service.CountyUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountyUserServiceImpl implements CountyUserService {
    @Autowired
    private CountyUserDao countyUserDao;

    //预报数据
    @Override
    public int forecastData(Forecast forecast) {
        return countyUserDao.forecastData(forecast);
    }

    @Override
    public List<Forecast> findForecastData() {
        return countyUserDao.findForecastData();
    }

    @Override
    public Forecast findDataById(Integer id) {
        return countyUserDao.findDataById(id);
    }

    //上报数据
    @Override
    public int reportData(Actual actual) {
        return countyUserDao.reportData(actual);
    }
}
