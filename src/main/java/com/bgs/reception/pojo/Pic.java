package com.bgs.reception.pojo;

import java.util.Date;

public class Pic {
    private Integer id;
    private Date createTime;
    private String picName;
    private Integer dataId;
    private String picAddress;

    public String getPicAddress() {
        return picAddress;
    }

    public void setPicAddress(String picAddress) {
        this.picAddress = picAddress;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPicName() {
        return picName;
    }

    public void setPicName(String picName) {
        this.picName = picName;
    }

    public Integer getDataId() {
        return dataId;
    }

    public void setDataId(Integer dataId) {
        this.dataId = dataId;
    }

    public Pic() {
    }

    @Override
    public String toString() {
        return "Pic{" +
                "id=" + id +
                ", createTime=" + createTime +
                ", picName='" + picName + '\'' +
                ", dataId=" + dataId +
                '}';
    }

    public Pic(Integer id, Date createTime, String picName, Integer dataId) {
        this.id = id;
        this.createTime = createTime;
        this.picName = picName;
        this.dataId = dataId;
    }
}
