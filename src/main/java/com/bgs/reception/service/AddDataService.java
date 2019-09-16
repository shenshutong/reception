package com.bgs.reception.service;

import com.bgs.reception.pojo.Data;
import com.bgs.reception.pojo.Pic;

import java.util.List;

public interface AddDataService {
    int predictionData(Data data);

    List<Data> findDataByStatus();

    Data findDataById(Integer id);

    int updateData(Data data);

    int uploadPic(Pic pic);
}
