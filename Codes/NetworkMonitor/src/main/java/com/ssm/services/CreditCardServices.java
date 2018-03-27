package com.ssm.services;

import com.ssm.entity.CreditCard;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/6 0:36.
 */
public interface CreditCardServices {
    List<CreditCard> findAllCreditCard();
    List<CreditCard> findCreditCardsByAccountId(int id);
    void deleteCard(int id);
    void deleteCardnumber(long id);
    void createcard(String cnumber,String cname,String cdate,String ccode,int max);
    void createcards(String cnumber,String cname,String cdate,String ccode,int max);

}
