package com.ssm.services;


import com.ssm.entity.LoginAccount;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:51.
 */
public interface LoginServices {
    LoginAccount findAccountByUsernameAndPassword(String username, String password);
}
