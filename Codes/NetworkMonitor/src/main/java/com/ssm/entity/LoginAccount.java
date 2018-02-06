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
    private String securityQuestion1;
    private String securityQuestion2;
    private String securityQuestion3;
    private String securityAnswer1;
    private String securityAnswer2;
    private String securityAnswer3;
    private String isActive;

    public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }

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

    public String getSecurityQuestion1() {
        return securityQuestion1;
    }

    public void setSecurityQuestion1(String securityQuestion1) {
        this.securityQuestion1 = securityQuestion1;
    }

    public String getSecurityQuestion2() {
        return securityQuestion2;
    }

    public void setSecurityQuestion2(String securityQuestion2) {
        this.securityQuestion2 = securityQuestion2;
    }

    public String getSecurityQuestion3() {
        return securityQuestion3;
    }

    public void setSecurityQuestion3(String securityQuestion3) {
        this.securityQuestion3 = securityQuestion3;
    }

    public String getSecurityAnswer1() {
        return securityAnswer1;
    }

    public void setSecurityAnswer1(String securityAnswer1) {
        this.securityAnswer1 = securityAnswer1;
    }

    public String getSecurityAnswer2() {
        return securityAnswer2;
    }

    public void setSecurityAnswer2(String securityAnswer2) {
        this.securityAnswer2 = securityAnswer2;
    }

    public String getSecurityAnswer3() {
        return securityAnswer3;
    }

    public void setSecurityAnswer3(String securityAnswer3) {
        this.securityAnswer3 = securityAnswer3;
    }

    @Override
    public String toString() {
        return "LoginAccount{" +
                "loginId=" + loginId +
                ", loginType='" + loginType + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", securityQuestion1='" + securityQuestion1 + '\'' +
                ", securityQuestion2='" + securityQuestion2 + '\'' +
                ", securityQuestion3='" + securityQuestion3 + '\'' +
                ", securityAnswer1='" + securityAnswer1 + '\'' +
                ", securityAnswer2='" + securityAnswer2 + '\'' +
                ", securityAnswer3='" + securityAnswer3 + '\'' +
                '}';
    }
}
