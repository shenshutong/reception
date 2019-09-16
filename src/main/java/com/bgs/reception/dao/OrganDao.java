package com.bgs.reception.dao;

import com.bgs.reception.pojo.Area;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrganDao {
    List<Area> findOrgan();
    //添加机构
    int addOrgan(@Param("areaName") String areaName,@Param("organCode") String organCode,@Param("pId") Integer pId);
    //删除机构
    int deleteOrganById(Integer id);
    //修改机构名称
    int updateOrganName(@Param("id") Integer id, @Param("areaName") String areaName);
}
