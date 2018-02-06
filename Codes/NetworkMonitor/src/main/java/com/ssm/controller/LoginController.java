package com.ssm.controller;

import com.ssm.entity.LoginAccount;
import com.ssm.services.LoginServices;
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
    private LoginServices loginServices;

    @RequestMapping("/login")
    public String goLoginPage() {
        return "login";
    }

    @RequestMapping("/doLogin")
    public @ResponseBody
    LoginAccount doLogin(String username, String password,HttpServletRequest request){
        LoginAccount loginAccount= loginServices.findAccountByUsernameAndPassword(username,password);
        if(loginAccount!=null){
            //success login
            request.getSession().setAttribute("loginId",loginAccount.getLoginId());
            request.getSession().setAttribute("question1",loginAccount.getSecurityQuestion1());
            request.getSession().setAttribute("question2",loginAccount.getSecurityQuestion2());
            request.getSession().setAttribute("question3",loginAccount.getSecurityQuestion3());
            request.getSession().setAttribute("answer1",loginAccount.getSecurityAnswer1());
            request.getSession().setAttribute("answer2",loginAccount.getSecurityAnswer2());
            request.getSession().setAttribute("answer3",loginAccount.getSecurityAnswer3());
        }
        return loginAccount;
    }

    @RequestMapping("/loginSuccess")
    public String loginSuccess(){
        return "securityQ";
    }

    @RequestMapping("/goMap")
    public String goMap(){
        return "map";
    }
}
