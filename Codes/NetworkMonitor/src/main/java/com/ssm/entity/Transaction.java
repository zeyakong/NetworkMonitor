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
    private int transactionStatus;
    private int storeIp;
    private int cardId;
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

    public int getTransactionStatus() {
        return transactionStatus;
    }

    public void setTransactionStatus(int transactionStatus) {
        this.transactionStatus = transactionStatus;
    }

    public int getStoreIp() {
        return storeIp;
    }

    public void setStoreIp(int storeIp) {
        this.storeIp = storeIp;
    }

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
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
