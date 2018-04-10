package com.ssm.dto;


/**
 * Created by Zeya Kong
 * On 4/9/2018 9:27 PM.
 */
public class TransactionInfo {

    private String transactionType;
    private double transactionAmount;
    private String cardId;
    private String cardName;
    private String securityCode;
    private String expirationDate;


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

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    @Override
    public String toString() {
        return "TransactionInfo{" +
                "transactionType='" + transactionType + '\'' +
                ", transactionAmount=" + transactionAmount +
                ", cardId='" + cardId + '\'' +
                ", cardName='" + cardName + '\'' +
                ", securityCode=" + securityCode +
                ", expirationDate='" + expirationDate + '\'' +
                '}';
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public String getSecurityCode() {
        return securityCode;
    }

    public void setSecurityCode(String securityCode) {
        this.securityCode = securityCode;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }
}
