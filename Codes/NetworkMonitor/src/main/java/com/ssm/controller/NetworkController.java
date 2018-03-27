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
    public void changeConnectionStatusById(int id){
        networkServices.changeConnectionStatusById(id);
    }

    @RequestMapping("/changeStationStatusByIp")
    public void changeStationStatusByIp(String ip){
        networkServices.changeStationStatusByIp(ip);
    }

    @RequestMapping("/getNextIp")
    public String getNextIp(String startIp,String destination){
       return networkServices.getNextIp(startIp,destination);
    }

    @RequestMapping("/createNewTransaction")
    public void createNewTransaction(String transaction_type, double transaction_amount, String store_ip, String card_id, String current_position_ip, String current_destination_ip){
        networkServices.createTransaction(transaction_type,transaction_amount,store_ip,card_id,current_position_ip,current_destination_ip);
    }


    @RequestMapping("/updateTransaction")
    public void updateTransaction(int id,String status,String currentIP,String nextIp){
        networkServices.updateTransaction(id,status,currentIP,nextIp);
    }

    @RequestMapping("/setTransactionStartTime")
    public void setTransactionStartTime(int id){
        networkServices.setTransactionStartTime(id);
    }

    @RequestMapping("getTransactions")
    public @ResponseBody List<Transaction> getTransactions(){
        return  networkServices.findAllTransactions();
    }
}
