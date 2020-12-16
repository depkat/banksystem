package com.example.banksystem.service;

import com.example.banksystem.bean.Clerk;
import com.example.banksystem.bean.Customer;
import com.example.banksystem.bean.CustomerExample;
import com.example.banksystem.dao.ClerkMapper;
import com.example.banksystem.dao.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CutomerService {
    @Autowired
    CustomerMapper customerMapper;

    public List<Customer> getcusts(){
        return customerMapper.selectByExample(null);
    }

    public Customer getCustbyIdnumber(String idnumber){
        return customerMapper.selectByPrimaryKey(idnumber);
    }

    public Customer getCust(String idnumber){
        return customerMapper.selectCustWithnumid(idnumber);
    }

    public  boolean countCustByIdnumber(String idnumber){
        CustomerExample customerExample = new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        criteria.andIdnumberEqualTo(idnumber);
        return customerMapper.countByExample(customerExample) == 0;
    }

    public boolean countCustByPhonenum(String phonenum) {
        CustomerExample customerExample = new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        criteria.andPhonenumEqualTo(phonenum);
        return customerMapper.countByExample(customerExample) == 0;
    }

    public boolean countCustByEmail(String email) {
        CustomerExample customerExample = new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        criteria.andEmailEqualTo(email);
        return customerMapper.countByExample(customerExample) == 0;
    }

    public boolean addCustomer(Customer customer) {
        return customerMapper.insert(customer) == 0;
    }
}
