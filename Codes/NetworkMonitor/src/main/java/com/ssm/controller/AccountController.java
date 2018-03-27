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

    @RequestMapping("/deleteAccount")
    public String deleteAccount(int id,Model model){
        cardAccountServices.xxx();
        creditCardServices.deleteCard(id);
        cardAccountServices.deleteCardAccountById(id);
        cardAccountServices.zzz();
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
    public String createaccount(String name,String address,String phone,String limit,String balance,String cnumber,String cname,String cdate,String ccode,Model model){

        System.out.println("1");
        cardAccountServices.createaccount(name,address,phone,limit,balance);
        int max=2;
       /* String max = String.valueOf(max1);*/
        creditCardServices.createcard(cnumber, cname, cdate, ccode, max);
        System.out.println("2");
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

    @RequestMapping("/createcard")
    public String createaccount1(String name,String cnumber,String cname,String cdate,String ccode,Model model){


        int max=2;
        /* String max = String.valueOf(max1);*/
        creditCardServices.createcard(cnumber, cname, cdate, ccode, max);
        System.out.println("2");
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

    @RequestMapping("/createcards")
    public String createaccounts(String name,String cnumber,String cname,String cdate,String ccode,Model model){

        int max=2;
        /* String max = String.valueOf(max1);*/
        creditCardServices.createcards(cnumber, cname, cdate, ccode, max);
        System.out.println("2");
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






}
