package com.ssm.services.Impl;

import com.ssm.dao.CardAccountDao;
import com.ssm.dao.CreditCardDao;
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
    @Autowired
    CreditCardDao creditCardDao;
    public List<CardAccount> findAllCardAccounts() {
        return cardAccountDao.findAllCardAccounts();
    }
    public void  deleteCardAccountById(int id) {
        cardAccountDao.deleteCardAccountById(id);
    }
    public void  justdeleteCardAccountById(int id) {
        cardAccountDao.deleteCardAccountById(id);
    }
    public void createaccount(int max,String name,String address,String phone,String limit,String balance){
        cardAccountDao.createaccount(max,name,address,phone,limit,balance);

    }
    public double getBalanceById(int id) {
        return cardAccountDao.getBalanceById(id);
    }
    public void updateAccountBalanceById(int id, double newb) {
        cardAccountDao.updateAccountBalanceById(id,newb);
    }
    public void updatingaccounts(String accountName,String accountAddress,String accountPhone,double limit,double balance,int accountId){

        System.out.println("Service:      name = "+accountName+"==add ="+accountAddress+"======="+accountPhone+"===limit:=="+limit+"===="+balance+"====="+accountId
        +"======id:"+accountId);


        cardAccountDao.updatingaccounts(accountName,accountAddress,accountPhone,limit,balance,accountId);

    }
    public int getmax(){
        System.out.println("getmax start");

            return cardAccountDao.getmax();



    }
    public void  xxx() {
        cardAccountDao.xxx();
    }
    public void  zzz() {
        cardAccountDao.zzz();
    }
public String deleteaccount(int id){
    String message="123";
    int i=id;
    System.out.println("impl start0");
    System.out.println("balance"+creditCardDao.checkbalance(i));
    if(creditCardDao.checkbalance(i)>0) {
        System.out.println("impl start2");
        message="You can not delete an account which balance is not zero";
        System.out.println("You can not delete the only card of account which balance is not zero");
        return message;
    }else
    {System.out.println("impl start3");
        System.out.println("The account and related account has been deleted");
        creditCardDao.deleteAccount(id);
        creditCardDao.deleteCard(id);
        message="The account and related card has been deleted";  return message;

    }



}
    public CardAccount findCardAccountById(int id) {
        return cardAccountDao.findCardAccountById(id);
    }
}
