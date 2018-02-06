package com.ssm.entity;

import java.util.Date;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:49.
 */
public class CreditCard {
    private long cardId;
    private String cardName;
    private Date expirationDate;
    private String securityCode;
    private int cardAccount;


    public long getCardId() {
        return cardId;
    }

    public void setCardId(long cardId) {
        this.cardId = cardId;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getSecurityCode() {
        return securityCode;
    }

    public void setSecurityCode(String securityCode) {
        this.securityCode = securityCode;
    }

    public int getCardAccount() {
        return cardAccount;
    }

    public void setCardAccount(int cardAccount) {
        this.cardAccount = cardAccount;
    }

    @Override
    public String toString() {
        return "CreditCard{" +
                "cardId=" + cardId +
                ", cardName='" + cardName + '\'' +
                ", expirationDate=" + expirationDate +
                ", securityCode='" + securityCode + '\'' +
                ", cardAccount=" + cardAccount +
                '}';
    }
}
