package com.bgs.reception.pojo;

public class User {
    private Integer id;
    private String userName;
    private String codeName;
    private String password;
    private Integer areaId;
    private Integer level;

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public User(Integer id, String userName, String codeName, String password, Integer areaId) {
        this.id = id;
        this.userName = userName;
        this.codeName = codeName;
        this.password = password;
        this.areaId = areaId;
    }

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", codeName='" + codeName + '\'' +
                ", password='" + password + '\'' +
                ", areaId=" + areaId +
                '}';
    }
}
