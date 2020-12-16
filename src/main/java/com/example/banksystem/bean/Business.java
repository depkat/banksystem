package com.example.banksystem.bean;

import java.math.BigDecimal;

public class Business {
    private Integer id;

    private Integer clerkid;

    private String custname;

    private String carid;

    private String type;

    private BigDecimal amount;

    private BigDecimal balance;

    public Business() {
    }

    public Business(Integer id, Integer clerkid, String custname, String carid, String type, BigDecimal amount, BigDecimal balance) {
        this.id = id;
        this.clerkid = clerkid;
        this.custname = custname;
        this.carid = carid;
        this.type = type;
        this.amount = amount;
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "Business{" +
                "id=" + id +
                ", clerkid=" + clerkid +
                ", custname='" + custname + '\'' +
                ", carid='" + carid + '\'' +
                ", type='" + type + '\'' +
                ", amount=" + amount +
                ", balance=" + balance +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getClerkid() {
        return clerkid;
    }

    public void setClerkid(Integer clerkid) {
        this.clerkid = clerkid;
    }

    public String getCustname() {
        return custname;
    }

    public void setCustname(String custname) {
        this.custname = custname == null ? null : custname.trim();
    }

    public String getCarid() {
        return carid;
    }

    public void setCarid(String carid) {
        this.carid = carid == null ? null : carid.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }
}