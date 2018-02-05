package com.ssm.services.Impl;

import com.ssm.dao.LoginAccountDao;
import com.ssm.entity.SecurityQuestion;
import com.ssm.services.LoginAccountServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:51.
 */
@Service
public class LoginAccountServicesImpl implements LoginAccountServices {
    @Autowired
    private LoginAccountDao loginAccountDao;

    public SecurityQuestion findRandomSecurityQuestionByUsernameAndPassword(String username, String password) {
        //int num = min + (int)(Math.random() * (max-min+1)
        int num = 1+(int)(Math.random()*3);
        return loginAccountDao.findSecurityQuestionByUsernameAndPassword(username,password,num);
    }
}
