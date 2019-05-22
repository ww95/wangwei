package com.wangwei.bean;

/**
 * 用户实体类
 */
public class Account {
    //编号
    private Integer id;
    //用户名
    private String account;
    //密码
    private String password;
    //状态 权限问题
    private Integer status;

    //用户cookie
    private String cookie;

    //用户昵称
    private String ninkName;

    //用户账号是否正常
    private Integer is_normal;

    public Integer getIs_normal() {
        return is_normal;
    }

    public void setIs_normal(Integer is_normal) {
        this.is_normal = is_normal;
    }

    public String getNinkName() {
        return ninkName;
    }

    public void setNinkName(String ninkName) {
        this.ninkName = ninkName;
    }

    public String getCookie() {
        return cookie;
    }

    public void setCookie(String cookie) {
        this.cookie = cookie;
    }


    public String getAcookie() {
        return cookie;
    }

    public void setAcookie(String cookie) {
        this.cookie = cookie;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", status=" + status +
                ", cookie='" + cookie + '\'' +
                ", ninkName='" + ninkName + '\'' +
                '}';
    }
}
