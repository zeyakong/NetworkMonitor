package com.ssm.controller;

import com.ssm.dto.Network;
import com.ssm.entity.Connection;
import com.ssm.entity.RelayStation;
import com.ssm.entity.Store;
import com.ssm.entity.Transaction;
import com.ssm.services.NetworkServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("/goMain")
    public String goMain(HttpServletRequest request){
//        if(request.getSession().getAttribute("loginId")==null)return "login";
//        else{
            String networkDOT = networkServices.generateDOT(networkServices.getNetwork());
            request.getSession().setAttribute("network",networkDOT);
            return "main";
//        }
    }

    @RequestMapping("/getNetworkInfo")
    public @ResponseBody Network getNetworkInfo(){
        return networkServices.getNetwork();
    }

    @RequestMapping("/changeConnectionStatusById")
    public @ResponseBody String changeConnectionStatusById(int id){
        try{
            networkServices.changeConnectionStatusById(id);
        }catch (Exception e){
            return "error";
        }
        return "ok";
    }

    @RequestMapping("/changeStationStatusByIp")
    public @ResponseBody String changeStationStatusByIp(String ip){
        try{
            networkServices.changeStationStatusByIp(ip);
        }catch (Exception e){
            return "error";
        }
        return "ok";
    }

    @RequestMapping("/getNextIp")
    public @ResponseBody String getNextIp(String ip,String destination){
       return networkServices.getNextIp(ip,destination);
    }

    @RequestMapping("/createNewTransaction")
    public @ResponseBody String createNewTransaction(Date transaction_date_sent, String transaction_type, double transaction_amount, String store_ip, String card_id, String current_position_ip, String current_destination_ip, String given_card_name, String given_card_date, String given_card_code){
        try{
            networkServices.createTransaction(transaction_type,transaction_amount,store_ip,card_id,current_position_ip,current_destination_ip, given_card_name, given_card_date, given_card_code);
        }catch (Exception e){
            return "error";
        }
        return "ok";
    }

    @RequestMapping("/updateTransaction")
    public @ResponseBody String updateTransaction(int id,String status,String currentIP,String nextIp){
        try{
            networkServices.updateTransaction(id,status,currentIP,nextIp);
        }catch (Exception e){
            return "error";
        }
        return "ok";
    }

    @RequestMapping("/setTransactionStartTime")
    public @ResponseBody String setTransactionStartTime(int id){
        try{
            networkServices.setTransactionStartTime(id);
        }catch (Exception e){
            return "error";
        }
        return "ok";
    }

    @RequestMapping("getTransactions")
    public @ResponseBody List<Transaction> getTransactions(){
        return  networkServices.findAllTransactions();
    }
}
