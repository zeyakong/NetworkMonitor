package com.ssm.controller;

import com.ssm.entity.CardAccount;
import com.ssm.services.CardAccountServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/17 12:19.
 */
@Controller
public class IndexPageController {
    @Autowired
    private CardAccountServices cardAccountServices;

    @RequestMapping("/accountInfo")
    public String accountInfo(Model model){
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
