package com.ssm.dao;

import com.ssm.entity.CardAccount;
import com.ssm.entity.CreditCard;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/4 22:52.
 */
public interface CreditCardDao {
    /**
     *
     * @param accountId the query id
     * @return all creditCards in this account.
     */
    List<CreditCard> findAllCreditCard();
    List<CreditCard> findCreditCardsByAccountId(@Param("accountId")int accountId);
    void deleteAccount(int i);
    void deleteCard(int id);
    CreditCard findCardById(String id);
    int findAccountnumber(long id);
    void deleteCardnumber(long id);
    void createcard(@Param("cnumber")String cnumber,
                    @Param("cname")String cname, @Param("ccode")String ccode,
                    @Param("cdate")String cdate, @Param("max")int max);
    void createcards(@Param("cnumber")String cnumber,
                    @Param("cname")String cname, @Param("ccode")String ccode,
                    @Param("cdate")String cdate, @Param("max")int max);
}

