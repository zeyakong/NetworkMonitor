package com.ssm.controller;

import com.ssm.entity.LoginAccount;
import com.ssm.services.LoginServices;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:59.
 */

@Controller
public class LoginController {
    @Autowired
    private LoginServices loginServices;

    @RequestMapping("/login")
    public String goLoginPage() {
        return "login";
    }

    @RequestMapping("/doLogin")
    public @ResponseBody
    LoginAccount doLogin(String username, String password){
        LoginAccount loginAccount= loginServices.findAccountByUsernameAndPassword(username,password);
        return loginAccount;
    }

    @RequestMapping("/loginSuccess")
    public String loginSuccess(){
        return "index";
    }
}
