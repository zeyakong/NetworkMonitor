package com.ssm.controller;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.ssm.entity.CardAccount;
import com.ssm.entity.CreditCard;
import com.ssm.entity.Transaction;
import com.ssm.services.CardAccountServices;
import com.ssm.services.CreditCardServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
import java.util.Calendar;
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

    @RequestMapping("/carddetail")
    public String carddetail(long id,Model model){
        List<Transaction> list;
        list = creditCardServices.findTransactionByCardId(id);
        model.addAttribute("list",list);
        CreditCard creditCard = creditCardServices.findCreditCardsByCardId(id);
        model.addAttribute("creditCard",creditCard);
        System.out.println("card detail");
        System.out.println(list);
        System.out.println("card detail2");
        return "cardDetail";
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
    @ResponseBody
    public String deleteAccount(int id,Model model){
        System.out.println("controller");
        String message="";
        message=cardAccountServices.deleteaccount(id);
        System.out.println("controller2");
        return message;
    }

    @RequestMapping("/deleteCardnumber")
    @ResponseBody
    public String deleteCard(long id,Model model){
        String message="";
        message=creditCardServices.deleteCardnumber(id);
        return message;
    }





    @RequestMapping("/createaccount")
    @ResponseBody
    public String createaccount(String name,String address,String phone,String limit,String balance,long cnumber,String cname,String cdate,String ccode,Model model){
        String message="";
        Pattern p,p1,p2,p3,p4,p5,p6,p7,p8,p9= null;
        Matcher m,m1,m2,m3,m4,m5,m6,m7,m8,m9 = null;
        boolean flg,flg1,flg2,flg3,flg4,flg5,flg6,flg7,flg8,flg9 = false;
        String Scnumber = String.valueOf(cnumber);
        p = Pattern.compile("[1-8]{1}[0-9]{15}");
        m = p.matcher(Scnumber);
        flg = m.matches();
        p2 = Pattern.compile("[a-zA-Z]{2,15}[\\s*]{1}[a-zA-Z]{2,15}");
        m2 = p2.matcher(cname);
        flg2 = m2.matches();
        p3 = Pattern.compile("(0?[0-9]|1[0-2])[/]{1}[0-9]{4}");
        m3 = p3.matcher(cdate);
        flg3 = m3.matches();
        p4 = Pattern.compile("[1-9]{1}[0-9]{2}");
        m4 = p4.matcher(ccode);
        flg4 = m4.matches();


        int limit1=Integer.parseInt(limit);
        int balance1=Integer.parseInt(balance);
        p1 = Pattern.compile("[a-zA-Z]{2,15}[\\s*]{1}[a-zA-Z]{2,15}");
        m1 = p1.matcher(name);
        flg1 = m1.matches();
        p5 = Pattern.compile("[a-zA-Z0-9\\s*]{2,50}[,]{1}[\\s*]{1}[a-zA-Z\\s*]{2,15}[,]{1}[\\s*]{1}[a-zA-Z]{2,3}[\\s*]{1}[0-9]{5}");
        m5 = p5.matcher(address);
        flg5 = m5.matches();
        p6 = Pattern.compile("[(]{1}[0-9]{3}[)]{1}[\\s*]{1}[0-9]{3}[-]{1}[0-9]{4}");
        m6 = p6.matcher(phone);
        flg6 = m6.matches();
        p7 = Pattern.compile("[0-9]{1,5}");
        m7 = p7.matcher(limit);
        flg7 = m7.matches();
        p8 = Pattern.compile("[0-9]{1,5}");
        m8 = p8.matcher(balance);
        flg8 = m8.matches();
        if (flg==false){
            message="Card Number must be 16 digit and can not start with 0 or 9!";

        }else{
            if(flg2==false){
                message="Account First Name and Last name of Card Owner should in 2~15 character alphabet!";
            }else{
                if(flg3==false){
                    message="Invalid date format!";
                }
                else{
                    String cdatee[]=cdate.split("/");
                    Calendar now = Calendar.getInstance();
                    int monthn=(now.get(Calendar.MONTH) + 1);
                    int yearn=now.get(Calendar.YEAR);
                    int month=Integer.parseInt(cdatee[0]);
                    int year=Integer.parseInt(cdatee[1]);
                    if (year<yearn||(year==yearn&&month<monthn)){
                        message="The expiration date expired!";
                    }else{
                        if(flg4==false){
                            message="Invalid security code";
                        }else {
                             if(flg1==false){
                                 message="Card First Name and Last name of Card Owner should in 2~15 character alphabet!";

                             }else{
                                 if (flg5==false){
                                     message="Invalid address format";
                                 }else{
                                     if(flg6==false){
                                         message="Invalid phone format";
                                     }else{
                                         if(flg7==false||limit1>25000){
                                             message="Invalid limit amount";
                                         }else{
                                             if(flg8==false||balance1>25000){
                                                 message="Invalid balance amount";
                                             }else{
                                                 if(creditCardServices.findCreditCardsByCardId(cnumber)!=null){
                                                     message="This card is already exist!";
                                                 }else{
                                                     int max=cardAccountServices.getmax();
                                                     max++;
                                                     cardAccountServices.createaccount(max,name,address,phone,limit,balance);
                                                     creditCardServices.createcards(cnumber, cname, cdate, ccode,max);
                                                     message="Success to create account!";
                                                 }



                                             }
                                         }
                                     }
                                 }
                             }


                        }
                    }

                }
            }
        }


        /*int max=cardAccountServices.getmax();
        max++;
        cardAccountServices.createaccount(max,name,address,phone,limit,balance);
        creditCardServices.createcards(cnumber, cname, cdate, ccode,max);*/
return message;
    }


    @RequestMapping("/createcards")
    @ResponseBody
    public String createcards(long cnumber,String cname,String cdate,String ccode,int name){
        String message="";
        Pattern p,p2,p3,p4 = null;
        Matcher m,m1,m2,m3,m4 = null;
        boolean flg,flg2,flg3,flg4 = false;
        String Scnumber = String.valueOf(cnumber);
        p = Pattern.compile("[1-8]{1}[0-9]{15}");
        m = p.matcher(Scnumber);
        flg = m.matches();
        p2 = Pattern.compile("[a-zA-Z]{2,15}[\\s*]{1}[a-zA-Z]{2,15}");
        m2 = p2.matcher(cname);
        flg2 = m2.matches();
        p3 = Pattern.compile("(0?[0-9]|1[0-2])[/]{1}[0-9]{4}");
        m3 = p3.matcher(cdate);
        flg3 = m3.matches();
        p4 = Pattern.compile("[1-9]{1}[0-9]{2}");
        m4 = p4.matcher(ccode);
        flg4 = m4.matches();
        if (flg==false){
            message="Card Number must be 16 digit and can not start with 0 or 9!";

        }else{
            if(flg2==false){
                message="First Name and Last name of Card Owner should in 2~15 character alphabet!";
            }else{
                if(flg3==false){
                    message="Invalid date format!";
                }
                else{
                    String cdatee[]=cdate.split("/");
                    Calendar now = Calendar.getInstance();
                    int monthn=(now.get(Calendar.MONTH) + 1);
                    int yearn=now.get(Calendar.YEAR);
                    int month=Integer.parseInt(cdatee[0]);
                    int year=Integer.parseInt(cdatee[1]);
                    if (year<yearn||(year==yearn&&month<monthn)){
                            message="The expiration date expired!";
                    }else{
                        if(flg4==false){
                            message="Invalid security code";
                        }else {
                            if(creditCardServices.findCreditCardsByCardId(cnumber)!=null){
                                message="This card is already exist!";
                            }else{
                                if(cardAccountServices.findCardAccountById(name)==null){
                                    message="This Account do not exist!"; ;
                                }else{
                                    creditCardServices.createcards(cnumber, cname, cdate, ccode, name);
                                    message="Success to create card";
                                }
                            }
                        }
                    }

                }
            }
        }


return message;

    }

    @RequestMapping("/updatingcards")
    @ResponseBody
    public String updatingcards(@RequestParam long cnumber2,@RequestParam String cname2,@RequestParam String cdate2,@RequestParam String ccode2,@RequestParam int name2){
        String message="";
        Pattern p,p2,p3,p4 = null;
        Matcher m,m1,m2,m3,m4 = null;
        boolean flg,flg2,flg3,flg4 = false;
        String Scnumber = String.valueOf(cnumber2);
        p = Pattern.compile("[1-8]{1}[0-9]{15}");
        m = p.matcher(Scnumber);
        flg = m.matches();
        p2 = Pattern.compile("[a-zA-Z]{2,15}[\\s*]{1}[a-zA-Z]{2,15}");
        m2 = p2.matcher(cname2);
        flg2 = m2.matches();
        p3 = Pattern.compile("(0?[0-9]|1[0-2])[/]{1}[0-9]{4}");
        m3 = p3.matcher(cdate2);
        flg3 = m3.matches();
        p4 = Pattern.compile("[1-9]{1}[0-9]{2}");
        m4 = p4.matcher(ccode2);
        flg4 = m4.matches();
        if (flg==false){
            message="Card Number must be 16 digit and can not start with 0 or 9!";

        }else{
            if(flg2==false){
                message="First Name and Last name of Card Owner should in 2~15 character alphabet!";
            }else{
                if(flg3==false){
                    message="Invalid date format!";
                }
                else{
                    String cdatee[]=cdate2.split("/");
                    Calendar now = Calendar.getInstance();
                    int monthn=(now.get(Calendar.MONTH) + 1);
                    int yearn=now.get(Calendar.YEAR);
                    int month=Integer.parseInt(cdatee[0]);
                    int year=Integer.parseInt(cdatee[1]);
                    if (year<yearn||(year==yearn&&month<monthn)){
                        message="The expiration date expired!";
                    }else{
                        if(flg4==false){
                            message="Invalid security code";
                        }else {
                                if(cardAccountServices.findCardAccountById(name2)==null){
                                    message="This Account do not exist!"; ;
                                }else{
                                    if(creditCardServices.findCreditCardsByCardId(cnumber2)!=null){
                                        message="This card is already exist!";
                                    }else{
                                        creditCardServices.updatingcards(cnumber2,cname2,cdate2,ccode2,name2);
                                        message="Success to update card";
                                    }
                                    /*creditCardServices.updatingcards(cnumber2,cname2,cdate2,ccode2,name2);
                                    message="Success to update card";*/
                                }
                            }
                        }


                }
            }
        }


        return message;


    }


    @RequestMapping("/updatingaccounts")
    @ResponseBody
    public String updatingaccounts(@RequestParam String accountName, @RequestParam String accountAddress,@RequestParam String accountPhone,@RequestParam double limit,@RequestParam double balance,@RequestParam int accountId){
        String message="";
        Pattern p,p1,p2,p3,p4,p5,p6,p7,p8,p9= null;
        Matcher m,m1,m2,m3,m4,m5,m6,m7,m8,m9 = null;
        boolean flg,flg1,flg2,flg3,flg4,flg5,flg6,flg7,flg8,flg9 = false;
        int limit2 = (new Double(limit)).intValue();
        int balance2 = (new Double(balance)).intValue();
        String limit1=String.valueOf(limit);
        String balance1=String.valueOf(balance);
        p1 = Pattern.compile("[a-zA-Z]{2,15}[\\s*]{1}[a-zA-Z]{2,15}");
        m1 = p1.matcher(accountName);
        flg1 = m1.matches();
        p5 = Pattern.compile("[a-zA-Z0-9\\s*]{2,50}[,]{1}[\\s*]{1}[a-zA-Z\\s*]{2,15}[,]{1}[\\s*]{1}[a-zA-Z]{2,3}[\\s*]{1}[0-9]{5}");
        m5 = p5.matcher(accountAddress);
        flg5 = m5.matches();
        p6 = Pattern.compile("[(]{1}[0-9]{3}[)]{1}[\\s*]{1}[0-9]{3}[-]{1}[0-9]{4}");
        m6 = p6.matcher(accountPhone);
        flg6 = m6.matches();
        p7 = Pattern.compile("[0-9]{1,5}[.]{1}[0-9]{1}");
        m7 = p7.matcher(limit1);
        flg7 = m7.matches();
        p8 = Pattern.compile("[0-9]{1,5}[.]{1}[0-9]{1}");
        m8 = p8.matcher(balance1);
        flg8 = m8.matches();
System.out.println(limit1);
        System.out.println(limit2);
        System.out.println(flg7);
        System.out.println(balance1);
        System.out.println(balance2);
        System.out.println(flg8);
        if(flg1==false){
            message="Card First Name and Last name of Card Owner should in 2~15 character alphabet!";

        }else{
            if (flg5==false){
                message="Invalid address format";
            }else{
                if(flg6==false){
                    message="Invalid phone format";
                }else{
                    if(flg7==false||limit2>25000){
                        message="Invalid limit amount";
                    }else{
                        if(flg8==false||balance2>25000){
                            message="Invalid balance amount";
                        }else{
                            cardAccountServices.updatingaccounts(accountName, accountAddress,  accountPhone,  limit,  balance,  accountId);

                            message="Success to update account!";

                        }
                    }
                }
            }
        }












       /* System.out.println("name = "+accountName+"==add ="+accountAddress+"======="+accountPhone+"====="+limit+"===="+balance+"====="+accountId);
        cardAccountServices.updatingaccounts(accountName, accountAddress,  accountPhone,  limit,  balance,  accountId);*/
        return message;
    }

}
