package com.bgs.reception.service.impl;

import com.bgs.reception.dao.CheckDataDao;
import com.bgs.reception.pojo.Data;
import com.bgs.reception.service.CheckDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CheckDataServiceImpl implements CheckDataService {
    @Autowired
    private CheckDataDao checkDataDao;
    @Override
    public List<Data> checkManageEcharts() {
        return checkDataDao.checkManageEcharts();
    }

    @Override
    public List<Data> showManageData() {
        return checkDataDao.showManageData();
    }


    /*---------------------------------------------------------------------------------------*/


    @Override
    public List<Data> checkCountyUserEcharts(Integer areaId) {
        return checkDataDao.checkCountyUserEcharts(areaId);
    }

    @Override
    public List<Data> showCountyUserData(Integer areaId) {
        return checkDataDao.showCountyUserData(areaId);
    }


}
