package com.ssm.services.Impl;

import com.ssm.dao.LoginAccountDao;
import com.ssm.entity.LoginAccount;
import com.ssm.services.LoginServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:51.
 */
@Service
public class LoginServicesImpl implements LoginServices {
    @Autowired
    private LoginAccountDao loginAccountDao;

    public LoginAccount findAccountByUsernameAndPassword(String username, String password) {
        return  loginAccountDao.findLoginAccountByUsernameAndPassword(username,password);
    }
}
