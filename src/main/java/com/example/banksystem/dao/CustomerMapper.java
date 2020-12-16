package com.example.banksystem.dao;

import com.example.banksystem.bean.Customer;
import com.example.banksystem.bean.CustomerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CustomerMapper {
    long countByExample(CustomerExample example);

    int deleteByExample(CustomerExample example);

    int deleteByPrimaryKey(String idnumber);

    int insert(Customer record);

    int insertSelective(Customer record);

    List<Customer> selectByExample(CustomerExample example);

//    List<Customer> selectByExampleWithCard(CustomerExample example);

    Customer selectByPrimaryKey(String idnumber);

    Customer selectCustWithnumid(String idnumber);

    int updateByExampleSelective(@Param("record") Customer record, @Param("example") CustomerExample example);

    int updateByExample(@Param("record") Customer record, @Param("example") CustomerExample example);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
}