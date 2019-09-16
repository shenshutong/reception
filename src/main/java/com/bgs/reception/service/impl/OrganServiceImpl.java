package com.bgs.reception.service.impl;

import com.bgs.reception.dao.OrganDao;
import com.bgs.reception.pojo.Area;
import com.bgs.reception.service.OrganService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrganServiceImpl implements OrganService {
    @Autowired
    private OrganDao organDao;

    @Override
    public List<Area> findOrgan() {
        return organDao.findOrgan();
    }
    //添加机构
    @Override
    public int addOrgan(String areaName,String organCode,Integer pId) {
        return organDao.addOrgan(areaName,organCode,pId);
    }
    //删除机构
    @Override
    public int deleteOrganById(Integer id) {
        return organDao.deleteOrganById(id);
    }

    //修改机构名称
    @Override
    public int updateOrganName(Integer id, String areaName) {
        return organDao.updateOrganName(id, areaName);
    }
}
