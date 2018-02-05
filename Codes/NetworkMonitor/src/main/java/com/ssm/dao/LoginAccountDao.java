package com.ssm.dao;

import com.ssm.entity.LoginAccount;
import com.ssm.entity.SecurityQuestion;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:50.
 */
public interface LoginAccountDao {
    SecurityQuestion findSecurityQuestionByUsernameAndPassword(@Param("username")String username, @Param("password")String password, @Param("questionNum")int questionNum);
}
