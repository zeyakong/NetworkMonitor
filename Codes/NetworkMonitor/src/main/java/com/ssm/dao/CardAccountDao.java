package com.ssm.dao;

import com.ssm.entity.CardAccount;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/4 22:52.
 */
public interface CardAccountDao {
    //show all account information
    //return a list of CardAccount objects

    List<CardAccount> findAllCardAccounts();
    CardAccount findCardAccountById(int id);
    void xxx();
    void zzz();
 /*   void createaccount(String name,String address,int phone,double limit,double balance);*/
  void createaccount(@Param("max")int max,@Param("name")String name,
                           @Param("address")String address,@Param("phone")String phone, @Param("limit")String limit,
                            @Param("balance")String balance);
    void updatingaccounts(@Param("accountName")String accountName,
                       @Param("accountAddress")String accountAddress,
                          @Param("accountPhone")String accountPhone,
                          @Param("l")double limit,
                       @Param("balance")double balance,
                          @Param("accountId")int accountId);
    void deleteCardAccountById(int id);
    int getmax();
    void updateAccountBalanceById(@Param("id")int id,@Param("new_balance")double nb);
    double getBalanceById(@Param("id")int id);

}

