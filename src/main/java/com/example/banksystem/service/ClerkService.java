package com.example.banksystem.service;

import com.example.banksystem.bean.Clerk;
import com.example.banksystem.bean.ClerkExample;
import com.example.banksystem.dao.ClerkMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClerkService {
    @Autowired
    ClerkMapper clerkMapper;

    public List<Clerk> getClerks(){
        return clerkMapper.selectByExample(null);
    }

    public List<Clerk> selectByExample(ClerkExample example){
        return clerkMapper.selectByExample(example);
    }

    public void addClerk(Clerk clerk) {
        clerkMapper.insertSelective(clerk);
    }

    public Boolean checkUsername(String username){
        ClerkExample clerkExample = new ClerkExample();
        ClerkExample.Criteria criteria = clerkExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        return clerkMapper.countByExample(clerkExample) == 0;
    }
}
