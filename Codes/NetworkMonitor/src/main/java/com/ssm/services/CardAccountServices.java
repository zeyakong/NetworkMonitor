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
    String deleteaccount(int id);
    void deleteCardAccountById(int id);
    void justdeleteCardAccountById(int id);
    double getBalanceById(int id);
    void updateAccountBalanceById(int id, double newb);
    void createaccount(int max,String name,String address,String phone,String limit,String balance);
    void updatingaccounts(String accountName,String accountAddress,String accountPhone,double limit,double balance,int accountId);
    int getmax();
    void xxx();
    void zzz();
}
