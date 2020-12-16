package com.example.banksystem.bean;

import javax.validation.constraints.Pattern;

public class Clerk {
    private Integer id;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})",message = "用户名必须是6-16位数字和字母的组合或者2-5位中文")
    private String username;

    @Pattern(regexp = "^\\w{6,12}$",message = "用户名必须由字母，数字下划线组成，并且长度为6到12位")
    private String password;

    public Clerk() {
    }

    public Clerk(Integer id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    @Override
    public String toString() {
        return "Clerk{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}