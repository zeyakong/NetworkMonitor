package com.ssm.services;

import com.ssm.entity.CardAccount;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/6 0:11.
 */
public interface CardAccountServices {
    List<CardAccount> findAllCardAccounts();
    CardAccount findCardAccountById(int id);
    void deleteCardAccountById(int id);
    void createaccount(String name,String address,String phone,String limit,String balance);
    int getmax();
    void xxx();
    void zzz();
}
