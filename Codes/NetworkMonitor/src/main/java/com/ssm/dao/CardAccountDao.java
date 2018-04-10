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
    void updateAccountBalanceById(@Param("id")int id,@Param("new_balance")double nb);
    double getBalanceById(@Param("id")int id);



    void xxx();
    void zzz();
 /*   void createaccount(String name,String address,int phone,double limit,double balance);*/
    void createaccount(@Param("name")String name,
                           @Param("address")String address, @Param("limit")String limit,
                           @Param("phone")String phone, @Param("balance")String balance);
//    void updateAccount(@Param("name")String name,
//                       @Param("address")String address, @Param("limit")String limit,
//                       @Param("phone")String phone, @Param("balance")String balance,
//                       @Param("id")int id);
    void deleteCardAccountById(int id);
    int getmax();
}

