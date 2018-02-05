package com.ssm.controller;

import com.ssm.entity.SecurityQuestion;
import com.ssm.services.LoginAccountServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:59.
 */
@Controller
public class LoginController {
    @Autowired
    private LoginAccountServices loginAccountServices;

    @RequestMapping("/login")
    public String goIndex() {
        return "login";
    }

    @RequestMapping("/doLogin")
    public @ResponseBody
    SecurityQuestion doLogin(String username, String password, HttpServletRequest request) {
        SecurityQuestion securityQuestion= loginAccountServices.findRandomSecurityQuestionByUsernameAndPassword(username,password);
        return securityQuestion;
    }

    @RequestMapping("/loginSuccess")
    public String loginSuccess() {
        return "index";
    }

}
