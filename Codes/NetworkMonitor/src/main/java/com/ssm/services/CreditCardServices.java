package com.ssm.services;

import com.ssm.entity.CreditCard;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/6 0:36.
 */
public interface CreditCardServices {
    List<CreditCard> findCreditCardsByAccountId(int id);
}
