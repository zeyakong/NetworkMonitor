package com.ssm.controller;

import com.ssm.dto.Network;
import com.ssm.dto.TransactionInfo;
import com.ssm.entity.*;
import com.ssm.services.CardAccountServices;
import com.ssm.services.CreditCardServices;
import com.ssm.services.NetworkServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/15 17:37.
 */
@Controller
public class NetworkController {
    @Autowired
    private NetworkServices networkServices;

    @Autowired
    private CreditCardServices creditCardServices;

    @Autowired
    private CardAccountServices cardAccountServices;

    @RequestMapping("/goMain")
    public String goMain(HttpServletRequest request) {
//        if(request.getSession().getAttribute("loginId")==null)return "login";
//        else{
        String networkDOT = networkServices.generateDOT(networkServices.getNetwork());
        request.getSession().setAttribute("network", networkDOT);
        return "main";
//        }
    }

    @RequestMapping("/getNetworkInfo")
    public @ResponseBody
    Network getNetworkInfo() {
        return networkServices.getNetwork();
    }

    @RequestMapping("/changeConnectionStatusById")
    public @ResponseBody
    String changeConnectionStatusById(int id) {
        try {
            networkServices.changeConnectionStatusById(id);
        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }

    @RequestMapping("/changeStationStatusByIp")
    public @ResponseBody
    String changeStationStatusByIp(String ip) {
        try {
            networkServices.changeStationStatusByIp(ip);
        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }

    @RequestMapping("/getNextIp")
    public @ResponseBody
    String getNextIp(String ip, String destination) {
        return networkServices.getNextIp(ip, destination);
    }

    @RequestMapping("/createNewTransaction")
    public @ResponseBody
    String createNewTransaction(Date transaction_date_sent, String transaction_type, double transaction_amount, String store_ip, String card_id, String current_position_ip, String current_destination_ip) {
        try {
            networkServices.createTransaction(transaction_type, transaction_amount, store_ip, card_id, current_position_ip, current_destination_ip);
        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }

    @RequestMapping("/updateTransaction")
    public @ResponseBody
    String updateTransaction(int id, String status, String currentIP, String nextIp) {
        try {
            networkServices.updateTransaction(id, status, currentIP, nextIp);
        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }

    @RequestMapping("/setTransactionStartTime")
    public @ResponseBody
    String setTransactionStartTime(int id) {
        try {
            networkServices.setTransactionStartTime(id);
        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }

    @RequestMapping(value = "createStore", method = RequestMethod.POST)
    public @ResponseBody
    String createStore(@RequestParam String ip, @RequestParam String name, @RequestParam int region) {
        System.out.println(ip + "  " + name + "  " + region);
        networkServices.createStore(ip, name, region);
        return "OK";
    }

    @RequestMapping(value = "createRelayStation", method = RequestMethod.POST)
    public @ResponseBody
    String createRelayStation(@RequestParam String ip, @RequestParam String status, @RequestParam int region, @RequestParam int type, @RequestParam int limit) {
        networkServices.createRelayStation(ip, status, type, region, limit);
        return "OK";
    }

    @RequestMapping(value = "changeCapacity", method = RequestMethod.PUT)
    public @ResponseBody
    String changeCapacity(@RequestParam String ip, @RequestParam Integer newLimit) {
        networkServices.updateRelayStationLimit(ip, newLimit);
        return "OK";
    }

    @RequestMapping(value = "processingVerification", method = RequestMethod.POST)
    public @ResponseBody
    String processingVerification(@RequestBody TransactionInfo transactionInfo) {
        System.out.println("Got:" + transactionInfo.toString());
        if (transactionInfo == null) {
            return "ERROR";
        }
        Double amount = transactionInfo.getTransactionAmount();
        String cardId = transactionInfo.getCardId();
        String cardType = transactionInfo.getTransactionType();
        String cname = transactionInfo.getCardName();
        String scode = transactionInfo.getSecurityCode();
        String exdate = transactionInfo.getExpirationDate();
        CreditCard creditCard = creditCardServices.findCardById(cardId);
        if (creditCard == null) {
            return "DENY";
        } else {

            System.out.println("GOT credit card"+creditCard.toString());

            if (cname.equals(creditCard.getCardName())
                    && scode.equals(creditCard.getSecurityCode())
                    && exdate.equals(creditCard.getExpirationDate())) {
                CardAccount account = cardAccountServices.findCardAccountById(Integer.parseInt(creditCard.getCardAccount()));

                System.out.println("got this card account:"+ account.toString());

                double balance = account.getBalance();
                if(cardType.equals("CREDIT")){
                    cardAccountServices.updateAccountBalanceById(Integer.parseInt(creditCard.getCardAccount()),balance+amount);
                    return "OK";
                }else if(cardType.equals("DEBIT")){
                    if(balance>=amount){
                        cardAccountServices.updateAccountBalanceById(Integer.parseInt(creditCard.getCardAccount()),balance-amount);
                        return "OK";
                    }else{
                        return "DENY";
                    }
                }else{
                    return "DENY";
                }
            } else {
                return "DENY";
            }
        }
    }

    @RequestMapping("getTransactions")
    public @ResponseBody
    List<Transaction> getTransactions() {
        return networkServices.findAllTransactions();
    }
}
