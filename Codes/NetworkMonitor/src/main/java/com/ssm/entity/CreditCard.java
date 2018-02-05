package com.ssm.entity;

import java.util.Date;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:49.
 */
public class CreditCard {
    private int cardId;
    private String cardName;
    private Date expirationDate;
    private String securityId;
    private int cardAccount;

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
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

    public String getSecurityId() {
        return securityId;
    }

    public void setSecurityId(String securityId) {
        this.securityId = securityId;
    }

    public int getCardAccount() {
        return cardAccount;
    }

    public void setCardAccount(int cardAccount) {
        this.cardAccount = cardAccount;
    }
}
