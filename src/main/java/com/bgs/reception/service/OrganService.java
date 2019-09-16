package com.bgs.reception.service;

import com.bgs.reception.pojo.Area;

import java.util.List;

public interface OrganService {
    List<Area> findOrgan();
    //添加机构
    int addOrgan(String areaName,String organCode,Integer pId);

    //删除机构
    int deleteOrganById(Integer id);

    //修改机构名称
    int updateOrganName(Integer id, String areaName);
}
