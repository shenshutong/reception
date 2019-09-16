package com.bgs.reception.service;

import com.bgs.reception.pojo.Data;

import java.util.List;

public interface CheckDataService {
     List<Data> checkManageEcharts();

    List<Data> showManageData();

    /*----------------------------------------------------*/

    List<Data> checkCountyUserEcharts(Integer areaId);

    List<Data> showCountyUserData(Integer areaId);
}
