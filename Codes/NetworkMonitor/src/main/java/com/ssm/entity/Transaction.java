package com.ssm.entity;

import java.sql.Timestamp;

/**
 * Created by Zeya Kong
 * On 2018/2/12 14:28.
 */
public class Transaction {
    private int transactionId;
    private Timestamp transactionDateSent;
    private Timestamp transactionDateResponded;
    private String transactionType;
    private double transactionAmount;
    private String transactionStatus;
    private String storeIp;
    private long givenCardId;
    private String givenCardName;
    private String givenCardDate;
    private String givenCardCode;
    private String currentPositionIp;
    private String currentDestinationIp;

    public String getGivenCardCode() { return this.givenCardCode; }

    public void setGivenCardCode( String givenCardCode ) { this.givenCardCode = givenCardCode; }

    public String getGivenCardDate() { return this.givenCardDate; }

    public void setGivenCardDate(String givenCardDate) { this.givenCardDate = givenCardDate; }

    public String getGivenCardName() { return this.givenCardName; }

    public void setGivenCardName(String givenCardName) { this.givenCardName = givenCardName; }

    public long getCardId() { return this.givenCardId; }

    public void setCardId(long givenCardId) { this.givenCardId = givenCardId; }

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public Timestamp getTransactionDateSent() {
        return transactionDateSent;
    }

    public void setTransactionDateSent(Timestamp transactionDateSent) {
        this.transactionDateSent = transactionDateSent;
    }

    public Timestamp getTransactionDateResponded() {
        return transactionDateResponded;
    }

    public void setTransactionDateResponded(Timestamp transactionDateResponded) {
        this.transactionDateResponded = transactionDateResponded;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public double getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(double transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public String getTransactionStatus() {
        return transactionStatus;
    }

    public void setTransactionStatus(String transactionStatus) {
        this.transactionStatus = transactionStatus;
    }

    public String getStoreIp() {
        return storeIp;
    }

    public void setStoreIp(String storeIp) {
        this.storeIp = storeIp;
    }

    public String getCurrentPositionIp() {
        return currentPositionIp;
    }

    public void setCurrentPositionIp(String currentPositionIp) {
        this.currentPositionIp = currentPositionIp;
    }

    public String getCurrentDestinationIp() {
        return currentDestinationIp;
    }

    public void setCurrentDestinationIp(String currentDestinationIp) {
        this.currentDestinationIp = currentDestinationIp;
    }
}
