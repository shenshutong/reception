package com.bgs.reception.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Data {
    private Integer id;
    private String activeName;
    private String planNum;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startTime;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endTime;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date entryTime;
    private Integer realNum;
    private String newClient;
    private String oldClient;
    private String intentionClient;
    private String money;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date activeTime;
    private Integer areaId;

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    private String areaName;

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getActiveName() {
        return activeName;
    }

    public void setActiveName(String activeName) {
        this.activeName = activeName;
    }

    public String getPlanNum() {
        return planNum;
    }

    public void setPlanNum(String planNum) {
        this.planNum = planNum;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(Date entryTime) {
        this.entryTime = entryTime;
    }

    public Integer getRealNum() {
        return realNum;
    }

    public void setRealNum(Integer realNum) {
        this.realNum = realNum;
    }

    public String getNewClient() {
        return newClient;
    }

    public void setNewClient(String newClient) {
        this.newClient = newClient;
    }

    public String getOldClient() {
        return oldClient;
    }

    public void setOldClient(String oldClient) {
        this.oldClient = oldClient;
    }

    public String getIntentionClient() {
        return intentionClient;
    }

    public void setIntentionClient(String intentionClient) {
        this.intentionClient = intentionClient;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public Date getActiveTime() {
        return activeTime;
    }

    public void setActiveTime(Date activeTime) {
        this.activeTime = activeTime;
    }

    public Data() {
    }

    @Override
    public String toString() {
        return "Data{" +
                "id=" + id +
                ", activeName='" + activeName + '\'' +
                ", planNum=" + planNum +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", entryTime=" + entryTime +
                ", realNum=" + realNum +
                ", newClient='" + newClient + '\'' +
                ", oldClient='" + oldClient + '\'' +
                ", intentionClient='" + intentionClient + '\'' +
                ", money='" + money + '\'' +
                ", activeTime=" + activeTime +
                '}';
    }

    public Data(Integer id, String activeName, String planNum, Date startTime, Date endTime, Date entryTime, Integer realNum, String newClient, String oldClient, String intentionClient, String money, Date activeTime) {
        this.id = id;
        this.activeName = activeName;
        this.planNum = planNum;
        this.startTime = startTime;
        this.endTime = endTime;
        this.entryTime = entryTime;
        this.realNum = realNum;
        this.newClient = newClient;
        this.oldClient = oldClient;
        this.intentionClient = intentionClient;
        this.money = money;
        this.activeTime = activeTime;
    }
}
