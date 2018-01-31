package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:59.
 */
@Controller
public class LoginController {

    @RequestMapping("/index")
    public String goIndex() {
        return "index";
    }
}
