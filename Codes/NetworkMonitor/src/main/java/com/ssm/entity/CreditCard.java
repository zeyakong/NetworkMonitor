package com.ssm.entity;

import java.util.Date;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:49.
 */
public class CreditCard {
    private String cardId;
    private String cardName;
    private String expirationDate;
    private String securityCode;
    private String cardAccount;


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

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getCardAccount() {
        return cardAccount;
    }

    public void setCardAccount(String cardAccount) {
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
