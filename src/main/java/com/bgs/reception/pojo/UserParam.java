package com.bgs.reception.pojo;

public class UserParam {
    private Integer offset;
    private Integer limit;

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    @Override
    public String toString() {
        return "UserParam{" +
                "offset=" + offset +
                ", limit=" + limit +
                '}';
    }

    public UserParam(Integer offset, Integer limit) {
        this.offset = offset;
        this.limit = limit;
    }

    public UserParam() {
    }
}
