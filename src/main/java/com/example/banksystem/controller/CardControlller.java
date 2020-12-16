package com.example.banksystem.controller;

import com.example.banksystem.bean.Card;
import com.example.banksystem.bean.CardExample;
import com.example.banksystem.bean.Msg;
import com.example.banksystem.service.BusinessService;
import com.example.banksystem.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

@Controller
public class CardControlller {
    @Autowired
    CardService cardService;
    @Autowired
    BusinessService businessService;

    @GetMapping("/cardManage")
        public String cardManage(){
        return "card";
    }

    @ResponseBody
    @GetMapping("/cardSearcher")
    public Msg cardSearch(@RequestParam("cardid") String cardnum){
        List<Card> searchcardnum = cardService.searchcardnum(cardnum);
        if (searchcardnum!=null && searchcardnum.size() == 1){
            return Msg.success().add("card",searchcardnum).add("msg", "");
        }
        return Msg.fail().add("msg","卡号不存在");
    }

    @GetMapping("/deposit")
    public String deposit(){
        return "card";
    }

    @GetMapping("/deposit1")
    public String deposit1(){
        return "deposit";
    }

    @ResponseBody
    @PutMapping("/deposit/{cardid}")
    public Msg applydeposit(Card card, @PathVariable("cardid")String cardid, HttpServletRequest request) {

        BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        BigDecimal balance = cardService.selectByPrimaryKey(cardid).getBalance();
        card.setBalance(amount.add(balance));

        CardExample cardExample = new CardExample();
        CardExample.Criteria criteria = cardExample.createCriteria();
        criteria.andCardidEqualTo(cardid);
        boolean b = cardService.updateCardByExampleSelect(card, cardExample);
        if (b){
            return Msg.fail().add("msg", "存款失败");
        }
        businessService.depositBusiness(card, (int)request.getSession().getAttribute("clerkid"), amount);
        return Msg.success().add("msg", "存款成功");
    }

    @GetMapping("/withdraw")
    public String withdraw(){
        return "card";
    }

    @GetMapping("/withdraw1")
    public String withdraw1(){
        return "card/withdraw";
    }
    @ResponseBody
    @PutMapping("/withdraw/{cardid}")
    public Msg applywithdraw(Card card,@PathVariable("cardid")String cardid,HttpServletRequest request){
        BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        BigDecimal balance = cardService.selectByPrimaryKey(cardid).getBalance();
        if (balance == null || balance.compareTo(amount) < 0){
            return Msg.fail().add("msg", "余额不足");
        }
        card.setBalance(balance.subtract(amount));

        CardExample cardExample = new CardExample();
        CardExample.Criteria criteria = cardExample.createCriteria();
        criteria.andCardidEqualTo(cardid);
        boolean b = cardService.updateCardByExampleSelect(card, cardExample);
        if (b){
            return Msg.fail().add("msg", "取款失败");
        }
        businessService.withdrawBusiness(card, (int)request.getSession().getAttribute("clerkid"), amount);
        return Msg.success().add("msg", "取款成功");
    }

    @GetMapping("/transation")
    public String transation(){
        return "card";
    }

    @GetMapping("/transation1")
    public String transation1(){
        return "card/transation";
    }

    @ResponseBody
    @PostMapping("/transation/{cardid}")
    public Msg applytransation(Card card,@PathVariable("cardid") String cardid,HttpServletRequest request, HttpSession session){
        BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        Card card1 = cardService.selectByPrimaryKey(cardid);
        BigDecimal roll_outBalance = card1.getBalance();
        if (roll_outBalance == null || roll_outBalance.compareTo(amount) < 0){
            return Msg.fail().add("msg", "余额不足");
        }

        //查询对方账号信息
        CardExample cardExample = new CardExample();
        CardExample.Criteria criteria = cardExample.createCriteria();
        criteria.andCardidEqualTo(card.getCardid());
        criteria.andCustomernameEqualTo(card.getCustomername());
        List<Card> cards = cardService.selectByExample(cardExample);
        if (cards == null || cards.size() == 0){
            return Msg.fail().add("msg", "查找不到对方账户");
        }

        //转出方扣钱
        Card roll_outCard = new Card(cardid, null, roll_outBalance.subtract(amount),(String)request.getParameter("rolloutname"));
        System.out.println(roll_outCard);
        boolean b = cardService.updateByPrimaryKeySelective(roll_outCard);
        if (b){
            return Msg.fail().add("msg", "转账失败");
        }

        int clerkid =(int)session.getAttribute("clerkid");
        businessService.rolloutBusiness(roll_outCard,clerkid,amount); //保存转出记录


        //转入方加钱
        Card roll_inCard = cards.get(0);
        roll_inCard.setBalance(amount.add(roll_inCard.getBalance()));
        boolean b1 = cardService.updateByPrimaryKey(roll_inCard);
        if (b1){
            return Msg.fail().add("msg", "转账失败");
        }
        businessService.roll_inBusiness(roll_inCard, clerkid, amount); //保存转入记录
        return Msg.success().add("msg", "转账成功");
    }
}

