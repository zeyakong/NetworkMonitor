package com.ssm.controller;

import com.ssm.entity.CardAccount;
import com.ssm.entity.CreditCard;
import com.ssm.services.CardAccountServices;
import com.ssm.services.CreditCardServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
    public String accountCards(int id, Model model) {
        List<CreditCard> list;
        list = creditCardServices.findCreditCardsByAccountId(id);
        model.addAttribute("list", list);
        CardAccount cardAccount = cardAccountServices.findCardAccountById(id);
        model.addAttribute("cardAccount", cardAccount);
        return "accountDetail";
    }
}
