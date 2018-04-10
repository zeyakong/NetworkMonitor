package com.ssm.controller;

import com.ssm.entity.CardAccount;
import com.ssm.entity.CreditCard;
import com.ssm.services.CardAccountServices;
import com.ssm.services.CreditCardServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/15 17:35.
 */
@Controller
public class AccountController {

    //svg.
    @Autowired
    private CardAccountServices cardAccountServices;

    @Autowired
    private CreditCardServices creditCardServices;

    @RequestMapping("/accountCards")
    public String accountCards(int id,Model model){
        List<CreditCard> list;
        list = creditCardServices.findCreditCardsByAccountId(id);
        model.addAttribute("list",list);
        CardAccount cardAccount = cardAccountServices.findCardAccountById(id);
        model.addAttribute("cardAccount",cardAccount);
        return "accountDetail";
    }

    @RequestMapping("/updateCardnumber")
    public String updateCardnumber(long id,Model model){
        CreditCard creditCard= creditCardServices.findCreditCardsByCardId(id);
        model.addAttribute("creditCard",creditCard);
        return "cardupdate";
    }

    @RequestMapping("/updateAccountnumber")
    public String updateAccountnumber(int id,Model model){
        CardAccount cardAccount = cardAccountServices.findCardAccountById(id);
        model.addAttribute("cardAccount",cardAccount);
        return "accountupdate";
    }



    @RequestMapping("/createcardpage")
    public String createcardpage(){
        return "cardedit";
    }
    @RequestMapping("/createaccountpage")
    public String createaccountpage(){
        return "accountedit";
    }

    @RequestMapping("/cardinfopage")
    public String cardinfo(){
        return "cardInfo";
    }










    @RequestMapping("/deleteAccount")
    public String deleteAccount(int id,Model model){
      /*  cardAccountServices.xxx();*/
        creditCardServices.deleteCard(id);
        cardAccountServices.deleteCardAccountById(id);
       /* cardAccountServices.zzz();*/
        List<CardAccount> list;
        list =  cardAccountServices.findAllCardAccounts();
        if(list!=null){
            for(int i = 0 ;i<list.size();i++){
                System.out.println("----------------"+list.get(i));
            }
        }else System.out.println("---------------empty list!");
        model.addAttribute("list",list);
        return "accountInfo";
    }
    @RequestMapping("/deleteCardnumber")
    public String deleteCard(long id,Model model){
        creditCardServices.deleteCardnumber(id);
        List<CreditCard> list;
        list =  creditCardServices.findAllCreditCard();
        if(list!=null){
            for(int i = 0 ;i<list.size();i++){
                System.out.println("----------------"+list.get(i));
            }
        }else System.out.println("---------------empty list!");
        model.addAttribute("list",list);
        return "cardInfo";
    }





    @RequestMapping("/createaccount")
    public void createaccount(String name,String address,String phone,String limit,String balance,long cnumber,String cname,String cdate,String ccode,Model model){
        int max=cardAccountServices.getmax();
        max++;
        System.out.println("1");
        cardAccountServices.createaccount(max,name,address,phone,limit,balance);
        System.out.println(name);
        creditCardServices.createcards(cnumber, cname, cdate, ccode,max);

    }


    @RequestMapping("/createcards")
    public void createcards(long cnumber,String cname,String cdate,String ccode,int name){

        /* String max = String.valueOf(max1);*/
        creditCardServices.createcards(cnumber, cname, cdate, ccode, name);
        System.out.println("2");
    }

    @RequestMapping("/updatingcards")
    public void updatingcards(long cnumber2,String cname2,String cdate2,String ccode2,int name2){
           creditCardServices.justdeleteCardnumber(cnumber2);

        creditCardServices.createcards(cnumber2, cname2, cdate2, ccode2, name2);
        System.out.println("u22");
    }


    @RequestMapping("/updatingaccounts")
    public void updatingaccounts(String accountName,String accountAddress,String accountPhone,String limit,String balance,int accountId){
        /*cardAccountServices.justdeleteCardAccountById(accountId);
        cardAccountServices.createaccount(accountId,accountName,accountAddress,accountPhone,limit,balance);*/
        System.out.println("u22");
        cardAccountServices.updatingaccounts(accountName, accountAddress,  accountPhone,  limit,  balance,  accountId);
    }



}
