package com.ssm.services;

import com.ssm.entity.CreditCard;
import com.ssm.entity.Transaction;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/6 0:36.
 */
public interface CreditCardServices {
    List<CreditCard> findAllCreditCard();
    List<Transaction> findAll();
    List<Transaction>  findTransactionByCardId(long id);
    List<CreditCard> findCreditCardsByAccountId(int id);
    CreditCard findCreditCardsByCardId(long id);
    void deleteCard(int id);
    void deleteCardnumber(long id);
    void justdeleteCardnumber(long id);
    void createcards(long cnumber,String cname,String cdate,String ccode,int name);
    void updatingcards(long cnumber2,String cname2,String cdate2,String ccode2,int name2);



}
