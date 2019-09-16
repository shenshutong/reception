package com.bgs.reception.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Forecast {
    private Integer id;
    private String activeName;
    private Integer activeNum;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startTime;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endTime;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date entryTime;

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

    public Integer getActiveNum() {
        return activeNum;
    }

    public void setActiveNum(Integer activeNum) {
        this.activeNum = activeNum;
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

    @Override
    public String toString() {
        return "Forecast{" +
                "id=" + id +
                ", activeName='" + activeName + '\'' +
                ", activeNum=" + activeNum +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", entryTime=" + entryTime +
                '}';
    }

    public Forecast() {
    }

    public Forecast(Integer id, String activeName, Integer activeNum, Date startTime, Date endTime, Date entryTime) {
        this.id = id;
        this.activeName = activeName;
        this.activeNum = activeNum;
        this.startTime = startTime;
        this.endTime = endTime;
        this.entryTime = entryTime;
    }
}
