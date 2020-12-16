package com.example.banksystem.dao;

import com.example.banksystem.bean.Clerk;
import com.example.banksystem.bean.ClerkExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClerkMapper {
    long countByExample(ClerkExample example);

    int deleteByExample(ClerkExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Clerk record);

    int insertSelective(Clerk record);

    List<Clerk> selectByExample(ClerkExample example);

    Clerk selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Clerk record, @Param("example") ClerkExample example);

    int updateByExample(@Param("record") Clerk record, @Param("example") ClerkExample example);

    int updateByPrimaryKeySelective(Clerk record);

    int updateByPrimaryKey(Clerk record);
}