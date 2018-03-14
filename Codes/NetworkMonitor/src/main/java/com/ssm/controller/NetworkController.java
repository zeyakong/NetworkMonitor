package com.ssm.controller;

import com.ssm.dto.Network;
import com.ssm.entity.Connection;
import com.ssm.entity.RelayStation;
import com.ssm.entity.Store;
import com.ssm.services.NetworkServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
}
