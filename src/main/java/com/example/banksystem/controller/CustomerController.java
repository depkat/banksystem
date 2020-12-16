package com.example.banksystem.controller;

import com.example.banksystem.bean.Clerk;
import com.example.banksystem.bean.Customer;
import com.example.banksystem.bean.Msg;
import com.example.banksystem.service.ClerkService;
import com.example.banksystem.service.CutomerService;
import com.mysql.cj.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
public class CustomerController {
    @Autowired
    CutomerService cutomerService;


    @GetMapping("/custManage")
    public String getcutomers(){
        return "customer";
    }

    @ResponseBody
    @GetMapping("/custSearcher")
    public Msg getcust(Model model, @RequestParam(value = "idnumber") String idnumber){
        Customer customer = cutomerService.getCust(idnumber);
//        model.addAttribute("customer",customer);
        if (customer != null){
            System.out.println(customer);
            return Msg.success().add("customer", customer);
        }else{
            System.out.println("查无此人");
            return Msg.fail().add("customer",null);
        }

    }
    @GetMapping("/addCustomer")
    public String addCutomers(){
        return "addcustomer";
    }

    @ResponseBody
    @PostMapping("/addCustomer")
    public Msg postAddCutomers(Customer customer){
        if (cutomerService.addCustomer(customer)){
            return Msg.fail().add("addresult", "添加失败");
        }
        return Msg.success().add("addrusult", "添加成功");
    }

    @ResponseBody
    @GetMapping("/getCust")
    public Customer getcust1(@RequestParam(value = "idnumber") String idnumber){
        return cutomerService.getCust(idnumber);
    }

    @ResponseBody
    @GetMapping("/checkIdnumber")
    public Msg checkIdnumber(@RequestParam(value = "idnumber") String idnumber){
        if (cutomerService.countCustByIdnumber(idnumber)){
            return Msg.success().add("checkout", "身份证号可用");
        }
        return Msg.fail().add("checkout", "该用户已存在");
    }

    @ResponseBody
    @GetMapping("/checkPhonenum")
    public Msg checkPhonenum(@RequestParam(value = "phonenum") String phonenum){
        if (cutomerService.countCustByPhonenum(phonenum)){
            return Msg.success().add("checkout", "手机号码可用");
        }
        return Msg.fail().add("checkout", "手机号码已注册过");

    }

    @ResponseBody
    @GetMapping("/checkEmail")
    public Msg checkEmail(@RequestParam(value = "email") String email){
        if (cutomerService.countCustByEmail(email)){
            return Msg.success().add("checkout", "邮箱可用");
        }
        return Msg.fail().add("checkout", "该邮箱已注册");

    }
}
