package com.ssm.services.Impl;

import com.ssm.dao.CardAccountDao;
import com.ssm.entity.CardAccount;
import com.ssm.services.CardAccountServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/6 0:13.
 */
@Service
public class CardAccountServicesImpl implements CardAccountServices {
    @Autowired
    CardAccountDao cardAccountDao;
    public List<CardAccount> findAllCardAccounts() {
        return cardAccountDao.findAllCardAccounts();
    }
    public void  deleteCardAccountById(int id) {
        cardAccountDao.deleteCardAccountById(id);
    }

    public double getBalanceById(int id) {
        return cardAccountDao.getBalanceById(id);
    }

    public void createaccount(String name,String address,String phone,String limit,String balance){
        cardAccountDao.createaccount(name,address,phone,limit,balance);

    }

    public void updateAccountBalanceById(int id, double newb) {
        cardAccountDao.updateAccountBalanceById(id,newb);
    }

    public int getmax(){
        return cardAccountDao.getmax();
    }
    public void  xxx() {
        cardAccountDao.xxx();
    }
    public void  zzz() {
        cardAccountDao.zzz();
    }

    public CardAccount findCardAccountById(int id) {
        return cardAccountDao.findCardAccountById(id);
    }
}
