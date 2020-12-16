package com.example.banksystem.service;

import com.example.banksystem.bean.Business;
import com.example.banksystem.bean.BusinessExample;
import com.example.banksystem.bean.Card;
import com.example.banksystem.dao.BusinessMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class BusinessService {
    @Autowired
    BusinessMapper businessMapper;


    public boolean depositBusiness(Card card, int clerkid, BigDecimal amount){
        Business depositebusiness = new Business(null, clerkid, card.getCustomername(), card.getCardid(), "存入", amount, card.getBalance());
        return  businessMapper.insertSelective(depositebusiness) == 0;
    }

    public boolean withdrawBusiness(Card card, int clerkid, BigDecimal amount){
        Business depositebusiness = new Business(null, clerkid, card.getCustomername(), card.getCardid(), "取出", amount, card.getBalance());
        return  businessMapper.insertSelective(depositebusiness) == 0;
    }

    public boolean rolloutBusiness(Card card, int clerkid, BigDecimal amount){
        Business depositebusiness = new Business(null, clerkid, card.getCustomername(), card.getCardid(), "转出", amount, card.getBalance());
        return  businessMapper.insertSelective(depositebusiness) == 0;
    }

    public boolean roll_inBusiness(Card card, int clerkid, BigDecimal amount){
        Business depositebusiness = new Business(null, clerkid, card.getCustomername(), card.getCardid(), "转入", amount, card.getBalance());
        return  businessMapper.insertSelective(depositebusiness) == 0;
    }

    public List<Business> selectByExample(String type){
        BusinessExample businessExample = new BusinessExample();
        BusinessExample.Criteria criteria = businessExample.createCriteria();
        criteria.andTypeEqualTo(type);
        businessExample.setOrderByClause("id desc");
        return businessMapper.selectByExample(businessExample);
    }

    public List<Business> selectByExampleOr(String type){
        BusinessExample businessExample = new BusinessExample();

        BusinessExample.Criteria criteria1 = businessExample.createCriteria();
        criteria1.andTypeEqualTo("转入");

        BusinessExample.Criteria criteria2 = businessExample.createCriteria();
        criteria2.andTypeEqualTo("转出");

        businessExample.or(criteria2);
        businessExample.setOrderByClause("id desc");
        return businessMapper.selectByExample(businessExample);
    }
}
