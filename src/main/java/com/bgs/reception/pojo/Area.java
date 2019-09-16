package com.bgs.reception.pojo;

public class Area {
    private Integer id;
    private String areaName;
    private Integer parentId;
    private String organCode;

    public String getOrganCode() {
        return organCode;
    }

    public void setOrganCode(String organCode) {
        this.organCode = organCode;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Area() {
    }

    public Area(Integer id, String areaName, Integer parentId) {
        this.id = id;
        this.areaName = areaName;
        this.parentId = parentId;
    }

    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", areaName='" + areaName + '\'' +
                ", parentId=" + parentId +
                '}';
    }
}
