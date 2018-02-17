package com.ssm.dao;

import com.ssm.entity.CardAccount;

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
}
