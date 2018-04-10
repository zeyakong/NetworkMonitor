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
    private String cardId;
    private String currentPositionIp;
    private String currentDestinationIp;

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

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
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
