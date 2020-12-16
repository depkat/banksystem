package com.example.banksystem.bean;



import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Pattern;
import java.util.List;

public class Customer {

    @Pattern(regexp = "^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$",message = "身份证号码有误，请重新输入")
    private String idnumber;

    private String custname;

    @Pattern(regexp = "^[1](([3][0-9])|([4][5-9])|([5][0-3,5-9])|([6][5,6])|([7][0-8])|([8][0-9])|([9][1,8,9]))[0-9]{8}$",message = "手机号码有误，请重新输入")
    private String phonenum;

    @Email(message = "邮箱格式不正确，请重新输入")
    private String email;

    private String gender;

    private List<Card> cards;

    public Customer() {
    }

    public Customer(String idnumber, String custname, String phonenum, String email, String gender) {
        this.idnumber = idnumber;
        this.custname = custname;
        this.phonenum = phonenum;
        this.email = email;
        this.gender = gender;
    }
    public Customer(String idnumber, String custname, String phonenum, String email, String gender,List<Card> cards ) {
        this.idnumber = idnumber;
        this.custname = custname;
        this.phonenum = phonenum;
        this.email = email;
        this.gender = gender;
        this.cards = cards;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "idnumber='" + idnumber + '\'' +
                ", custname='" + custname + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", email='" + email + '\'' +
                ", gender='" + gender + '\'' +
                ", cards=" + cards +
                '}';
    }

    public String getIdnumber() {
        return idnumber;
    }

    public void setIdnumber(String idnumber) {
        this.idnumber = idnumber == null ? null : idnumber.trim();
    }

    public String getCustname() {
        return custname;
    }

    public void setCustname(String custname) {
        this.custname = custname == null ? null : custname.trim();
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum == null ? null : phonenum.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public List<Card> getCards() {
        return cards;
    }

    public void setCards(List<Card> cards) {
        this.cards = cards;
    }
}