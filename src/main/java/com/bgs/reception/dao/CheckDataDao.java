package com.bgs.reception.dao;

import com.bgs.reception.pojo.Data;

import java.util.List;

public interface CheckDataDao {
     List<Data> checkManageEcharts();

    List<Data> showManageData();

    /*---------------------------------------------------*/

    List<Data> checkCountyUserEcharts(Integer areaId);

    List<Data> showCountyUserData(Integer areaId);
}
