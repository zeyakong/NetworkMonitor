package com.ssm.entity;

/**
 * Created by Zeya Kong
 * On 2018/1/31 15:49.
 */
public class LoginAccount {
    private int loginId;
    private String loginType;
    private String username;
    private String password;

    public int getLoginId() {
        return loginId;
    }

    public void setLoginId(int loginId) {
        this.loginId = loginId;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
