package com.ssm.services.Impl;

import com.ssm.dao.CreditCardDao;
import com.ssm.dao.TransactionDao;
import com.ssm.entity.CreditCard;
import com.ssm.entity.Transaction;
import com.ssm.services.CreditCardServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.lang.String;
import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/6 0:36.
 */
@Service
public class CreditCardServicesImpl implements CreditCardServices {

    /*private CreditCardDao creditCardDao;*/
    @Autowired
    CreditCardDao creditCardDao;
    @Autowired
    TransactionDao transactionDao;
    public void  deleteCard(int id) {
        creditCardDao.deleteCard(id);
    }
    public String  deleteCardnumber(long id) {
        /*传进来的为卡号
        删除卡时
        1 检查是否是唯一的一张卡.
        2.1 如果是唯一的卡,检查balance
        2.11 如果balance 为0 可删除
        2.12 如果不是 不可删除

        2.2 如果不是唯一的卡 直接删除*/

        /*i为帐号*/
        System.out.println("start");
        String message="123";
        int i =0;
        i=creditCardDao.findAccountnumber(id);
        if(findCreditCardsByAccountId(i).size()==1){
            System.out.println("a");
            System.out.println("balance"+creditCardDao.checkbalance(i));
            if(creditCardDao.checkbalance(i)>0) {
                        message="You can not delete the only card of account which balance is not zero";
                        System.out.println("You can not delete the only card of account which balance is not zero");
                        return message;
            }else
            {
                creditCardDao.deleteCardnumber(id);System.out.println("The card and related account has been deleted");
                creditCardDao.deleteAccount(i);
                message="The card and related account has been deleted";  return message;

            }

        }
        else{
            creditCardDao.deleteCardnumber(id);System.out.println("The card has been deleted");
            message="The card has been deleted";  return message;
        }

       /* int i=0;
        System.out.println("dsdsa11adasda");
        i=creditCardDao.findAccountnumber(id);
        System.out.println("dsadasda"+i);
        creditCardDao.deleteCardnumber(id);
        System.out.println(creditCardDao.findcardbyid(i));
        if(creditCardDao.findcardbyid(i)==null){
            System.out.println("a");
                 creditCardDao.deleteAccount(i);
        }
        else{
            System.out.println("c");
        }
        System.out.println("b");*/

    }
   /* public void  justdeleteCardnumber(long id) {
        int i=creditCardDao.findAccountnumber(id);
        creditCardDao.deleteCardnumber(id);
        删除卡时
        1 检查是否是唯一的一张卡.
        2.1 如果是唯一的卡,检查balance
        2.11 如果balance 为0 可删除
        2.12 如果不是 不可删除

        2.2 如果不是唯一的卡 直接删除
        System.out.println(creditCardDao.findcardbyid(i));

    }*/
   /* public void createcard(String cnumber,String cname,String cdate,String ccode,int max){creditCardDao.createcard(cnumber,cname,cdate,ccode,max);}*/
    public void createcards(long cnumber,String cname,String cdate,String ccode,int name){creditCardDao.createcards(cnumber,cname,cdate,ccode,name);}
    public void updatingcards(long cnumber2,String cname2,String cdate2,String ccode2,int name2){
        System.out.println("b2");
        creditCardDao.updatingcards(cnumber2,cname2,cdate2,ccode2,name2);
        System.out.println("b3");
    }

    public List<CreditCard> findAllCreditCard() {
        return creditCardDao.findAllCreditCard();
    }
    public List<Transaction> findAll() {
        return transactionDao.findAllTransactions();
    }
    public List<Transaction> findTransactionByCardId(long id) {
        return transactionDao.findTransactionByCardId(id);
    }
    public List<CreditCard> findCreditCardsByAccountId(int id) {
        return creditCardDao.findCreditCardsByAccountId(id);
    }
    public CreditCard findCreditCardsByCardId(long id) {
        return creditCardDao.findCreditCardsByCardId(id);
    }
}
