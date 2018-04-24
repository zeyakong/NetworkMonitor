package com.ssm.dao;

import com.ssm.entity.CardAccount;
import com.ssm.entity.CreditCard;
import org.apache.ibatis.annotations.Param;
import java.lang.String;
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
    CreditCard findCreditCardsByCardId(@Param("cardId")String cardId);
    void deleteAccount(int i);
    void deleteCard(int id);
    CreditCard findcardbyid(int i);
    int findAccountnumber(long id);
    double checkbalance(int i);
    void deleteCardnumber(long id);
  /*  void createcard(@Param("cnumber")String cnumber,
                    @Param("cname")String cname, @Param("ccode")String ccode,
                    @Param("cdate")String cdate, @Param("max")int max);*/
    void createcards(@Param("cnumber")long cnumber,
                    @Param("cname")String cname,@Param("cdate")String cdate, @Param("ccode")String ccode,
                     @Param("name")int name);

    void updatingcards(@Param("cnumber2")long cnumber2,
                     @Param("cname2")String cname2,@Param("cdate2")String cdate2, @Param("ccode2")String ccode2,
                     @Param("name2")int name2);



}

