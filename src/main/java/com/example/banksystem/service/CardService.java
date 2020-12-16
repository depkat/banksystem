package com.example.banksystem.service;

import com.example.banksystem.bean.Card;
import com.example.banksystem.bean.CardExample;
import com.example.banksystem.dao.CardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardService {
    @Autowired
    CardMapper cardMapper;

    public List<Card> searchcardnum(String cardid) {
        CardExample cardExample = new CardExample();
        CardExample.Criteria criteria = cardExample.createCriteria();
        criteria.andCardidEqualTo(cardid);
        return cardMapper.selectByExample(cardExample);
    }


    public boolean updateCardByExampleSelect(Card card, CardExample cardExample) {
        return cardMapper.updateByExampleSelective(card, cardExample) == 0;
    }

    public Card selectByPrimaryKey(String cardid){
        return cardMapper.selectByPrimaryKey(cardid);
    }

    public boolean updateByPrimaryKeySelective(Card record){
        return cardMapper.updateByPrimaryKeySelective(record) == 0;
    }

    public List<Card> selectByExample(CardExample example){
        return cardMapper.selectByExample(example);
    }

    public boolean updateByPrimaryKey(Card record){
        return cardMapper.updateByPrimaryKey(record) == 0;
    };
}
