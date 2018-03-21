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
    void createCardAccount(@Param("name")String name,
                           @Param("address")String address, @Param("limit")double limit,
                           @Param("phone")String phone, @Param("balance")double balance);
    void updateCardAccount(@Param("id")int id,@Param("name")String name,
                           @Param("address")String address, @Param("limit")double limit,
                           @Param("phone")String phone, @Param("balance")double balance);
    void deleteCardAccount(int id);
}
