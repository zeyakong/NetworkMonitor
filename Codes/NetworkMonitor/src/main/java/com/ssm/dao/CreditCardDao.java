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
    List<CreditCard> findCreditCardsByAccountId(@Param("accountId")int accountId);
}
