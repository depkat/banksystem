package com.example.banksystem.bean;

import java.math.BigDecimal;

public class Card {
    private String cardid;

    private String custidnum;

    private BigDecimal balance;

    private String customername;

    public Card() {
    }

    public Card(String cardid, String custidnum, BigDecimal balance, String customername) {
        this.cardid = cardid;
        this.custidnum = custidnum;
        this.balance = balance;
        this.customername = customername;
    }

    @Override
    public String toString() {
        return "Card{" +
                "cardid='" + cardid + '\'' +
                ", custidnum='" + custidnum + '\'' +
                ", balance=" + balance +
                ", customername='" + customername + '\'' +
                '}';
    }

    public String getCardid() {
        return cardid;
    }

    public void setCardid(String cardid) {
        this.cardid = cardid == null ? null : cardid.trim();
    }

    public String getCustidnum() {
        return custidnum;
    }

    public void setCustidnum(String custidnum) {
        this.custidnum = custidnum == null ? null : custidnum.trim();
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername == null ? null : customername.trim();
    }
}