package com.ssm.services.Impl;

import com.ssm.dao.CreditCardDao;
import com.ssm.entity.CreditCard;
import com.ssm.services.CreditCardServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/6 0:36.
 */
@Service
public class CreditCardServicesImpl implements CreditCardServices {
    @Autowired
    /*private CreditCardDao creditCardDao;*/
    CreditCardDao creditCardDao;
    public void  deleteCard(int id) {
        creditCardDao.deleteCard(id);
    }
    public void  deleteCardnumber(long id) {
        int i=creditCardDao.findAccountnumber(id);
        creditCardDao.deleteCardnumber(id);
        System.out.println(creditCardDao.findcardbyid(i));
        if(creditCardDao.findcardbyid(i)==null){
            System.out.println("a");
                 creditCardDao.deleteAccount(i);
        }
        else{
            System.out.println("c");
        }
        System.out.println("b");

    }
    public void  justdeleteCardnumber(long id) {
        int i=creditCardDao.findAccountnumber(id);
        creditCardDao.deleteCardnumber(id);
        System.out.println(creditCardDao.findcardbyid(i));

    }
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
    public List<CreditCard> findCreditCardsByAccountId(int id) {
        return creditCardDao.findCreditCardsByAccountId(id);
    }
    public CreditCard findCreditCardsByCardId(long id) {
        return creditCardDao.findCreditCardsByCardId(id);
    }
}
