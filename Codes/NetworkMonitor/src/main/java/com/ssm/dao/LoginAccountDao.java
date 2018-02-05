package com.ssm.dao;

import com.ssm.entity.LoginAccount;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:50.
 */
public interface LoginAccountDao {
    LoginAccount findAdminByIdAndPassword(@Param("username")String username, @Param("password")String password);
}
