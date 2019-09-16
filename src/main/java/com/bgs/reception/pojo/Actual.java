package com.bgs.reception.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Actual {
    private Integer id;
    private Integer realNum;
    private String newClient;
    private String oldClient;
    private String intentionClient;
    private String money;
    private Integer foreId;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date activeTime;

    private String activeName;

    public String getActiveName() {
        return activeName;
    }

    public void setActiveName(String activeName) {
        this.activeName = activeName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getForeId() {
        return foreId;
    }

    public void setForeId(Integer foreId) {
        this.foreId = foreId;
    }

    public Date getActiveTime() {
        return activeTime;
    }

    public void setActiveTime(Date activeTime) {
        this.activeTime = activeTime;
    }

    public Actual() {
    }

    public Actual(Integer id, Integer realNum, String newClient, String oldClient, String intentionClient, String money, Integer foreId, Date activeTime) {
        this.id = id;
        this.realNum = realNum;
        this.newClient = newClient;
        this.oldClient = oldClient;
        this.intentionClient = intentionClient;
        this.money = money;
        this.foreId = foreId;
        this.activeTime = activeTime;
    }

    @Override
    public String toString() {
        return "Actual{" +
                "id=" + id +
                ", realNum=" + realNum +
                ", newClient='" + newClient + '\'' +
                ", oldClient='" + oldClient + '\'' +
                ", intentionClient='" + intentionClient + '\'' +
                ", money='" + money + '\'' +
                ", foreId=" + foreId +
                ", activeTime=" + activeTime +
                '}';
    }
}
