package com.ssm.services;


import com.ssm.entity.SecurityQuestion;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:51.
 */
public interface LoginAccountServices {
    SecurityQuestion findRandomSecurityQuestionByUsernameAndPassword(String username,String password);
}
