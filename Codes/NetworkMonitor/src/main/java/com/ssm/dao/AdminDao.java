package com.ssm.dao;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:50.
 */
public interface AdminDao {
      Admin findAdminByUsernameAndPassword(@Param("username")String username, @Param("password")String password);
}