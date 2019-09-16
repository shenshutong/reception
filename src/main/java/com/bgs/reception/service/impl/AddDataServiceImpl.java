package com.bgs.reception.service.impl;

import com.bgs.reception.dao.AddDataDao;
import com.bgs.reception.pojo.Data;
import com.bgs.reception.pojo.Pic;
import com.bgs.reception.service.AddDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AddDataServiceImpl implements AddDataService {
    @Autowired
    private AddDataDao addDataDao;

    @Override
    public int predictionData(Data data) {
        int b = addDataDao.predictionData(data);
        return b;
    }

    @Override
    public List<Data> findDataByStatus() {
        return addDataDao.findDataByStatus();
    }

    @Override
    public Data findDataById(Integer id) {
        return addDataDao.findDataById(id);
    }

    @Override
    public int updateData(Data data) {
        return addDataDao.updateData(data);
    }

    @Override
    public int uploadPic(Pic pic) {
        return addDataDao.uploadPic(pic);
    }
}
