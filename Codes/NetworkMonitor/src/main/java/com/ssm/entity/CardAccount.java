package com.ssm.entity;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:49.
 */
public class CardAccount {
    private String accountName;
    private String accountAddress;
    private int accountId;
    private int accountPhone;
    private double limit;
    private double balance;

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getAccountAddress() {
        return accountAddress;
    }

    public void setAccountAddress(String accountAddress) {
        this.accountAddress = accountAddress;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getAccountPhone() {
        return accountPhone;
    }

    public void setAccountPhone(int accountPhone) {
        this.accountPhone = accountPhone;
    }

    public double getLimit() {
        return limit;
    }

    public void setLimit(double limit) {
        this.limit = limit;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }
}
