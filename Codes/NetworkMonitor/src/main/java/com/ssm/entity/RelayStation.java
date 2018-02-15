package com.ssm.entity;

/**
 * Created by Zeya Kong
 * On 2018/2/12 14:27.
 */
public class RelayStation {
    private String stationIp;
    private int stationStatus;

    public String getStationIp() {
        return stationIp;
    }

    public void setStationIp(String stationIp) {
        this.stationIp = stationIp;
    }

    public int getStationStatus() {
        return stationStatus;
    }

    public void setStationStatus(int stationStatus) {
        this.stationStatus = stationStatus;
    }
}
