package com.ssm.entity;

/**
 * Created by Zeya Kong
 * On 2018/2/12 14:27.
 */
public class Store {
    private String storeIp;
    private String merchantName;
    private int region;

    public String getStoreIp() {
        return storeIp;
    }

    public void setStoreIp(String storeIp) {
        this.storeIp = storeIp;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public int getRegion() {
        return region;
    }

    public void setRegion(int region) {
        this.region = region;
    }
}
