package com.ssm.services;


/**
 * Created by Zeya Kong
 * On 2018/1/31 15:51.
 */
public interface LoginAccountServices {
    SecurityQuestion findRandomSecurityQuestionByUsernameAndPassword(String username,String password);
}
