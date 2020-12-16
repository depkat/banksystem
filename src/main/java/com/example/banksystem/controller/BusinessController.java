package com.example.banksystem.controller;

import com.example.banksystem.bean.Business;
import com.example.banksystem.service.BusinessService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.validation.groups.Default;
import java.util.List;

@Controller
public class BusinessController {
    @Autowired
    BusinessService businessService;

//    @GetMapping("/depositRecord")
//    public String listdepositRecord(HttpServletRequest request){
//        List<Business> rusult = businessService.selectByExample("存入");
//        request.setAttribute("data", rusult);
//        return "business/depositrecord";
//    }
//
//    @GetMapping("/withdrawDecord")
//    public String listwithdrawRecord(HttpServletRequest request){
//        List<Business> rusult = businessService.selectByExample("取出");
//        request.setAttribute("data", rusult);
//        return "business/withdrawrecord";
//    }
//
//    @GetMapping("/transationRecord")
//    public String listtransationRecord(HttpServletRequest request){
//        List<Business> rusult = businessService.selectByExampleOr("转账");
//        request.setAttribute("data", rusult);
//        return "business/transationrecord";
//    }

    @GetMapping("/depositRecord")
    public String listDepositRecord(HttpServletRequest request, @RequestParam(value = "pn",defaultValue = "1") Integer pn){
        // 这不是一个分页查询
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Business> records = businessService.selectByExample("存入");
        PageInfo result = new PageInfo(records, 5);
        request.setAttribute("data", result);
        return "business/depositrecord";
    }


    @GetMapping("/withdrawDecord")
    public String listwithdrawRecord(HttpServletRequest request, @RequestParam(value = "pn",defaultValue = "1") Integer pn){
        // 这不是一个分页查询
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Business> records = businessService.selectByExample("取出");
        PageInfo result = new PageInfo(records, 5);
        request.setAttribute("data", result);
        return "business/withdrawrecord";
    }


    @GetMapping("/transationRecord")
    public String listtransationRecord(HttpServletRequest request, @RequestParam(value = "pn",defaultValue = "1") Integer pn){
        // 这不是一个分页查询
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Business> records = businessService.selectByExampleOr("转账");
        PageInfo result = new PageInfo(records, 5);
        request.setAttribute("data", result);
        return "business/transationrecord";
    }

}
