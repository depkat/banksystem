package com.example.banksystem.controller;

import com.example.banksystem.bean.Clerk;
import com.example.banksystem.bean.Msg;
import com.example.banksystem.service.ClerkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;

@Controller
public class RegistController {
    @Autowired
    ClerkService clerkService;

    @GetMapping("regist")
    public String getRegist(HttpServletRequest request){
        if (request.getSession().getAttribute("login") != null){
            return "index";
        }
        return "regist";
    }

    @PostMapping("regist")
    public String postRegist(HttpServletRequest request,@Valid Clerk clerk, BindingResult result){
        if (request.getSession().getAttribute("login") != null){
            return "index";
        }
        if (result.hasErrors()){
            //校验失败，应该返回失败，显示校验失败的错误信息
            List<FieldError> fieldErrors = result.getFieldErrors();
            HashMap<String, Object> map = new HashMap<String, Object>();
            for (FieldError fieldError : fieldErrors) {
                System.out.println("错误的字段名" + fieldError.getField());
                System.out.println("错误的字段信息" + fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
        }
        String trycode = request.getParameter("trycode");
        if (trycode ==null || trycode != (String)request.getSession().getAttribute("rightCode")){
            request.setAttribute("msg", "验证码错误,请再输一次!");
            request.setAttribute("username",  request.getParameter("username"));
            return "regist";
        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        clerkService.addClerk(new Clerk(null, username, password));
        return "login";
    }

    @GetMapping("checkUsername")
    @ResponseBody
    public Msg checkUsername(@RequestParam(value = "username") String username,@Valid Clerk clerk,BindingResult result){
        if (result.hasErrors()){
            List<FieldError> fieldErrors = result.getFieldErrors();
            HashMap<String, Object> map = new HashMap<String, Object>();
            for (FieldError fieldError : fieldErrors) {
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("checkout", map);
        }
        if (clerkService.checkUsername(username)){
            return Msg.success().add("checkout", "用户名可用");
        }
        return Msg.fail().add("checkout", "用户名不可用");
    }
}
