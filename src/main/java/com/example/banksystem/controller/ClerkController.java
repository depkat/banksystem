package com.example.banksystem.controller;

import com.example.banksystem.bean.Clerk;
import com.example.banksystem.bean.Msg;
import com.example.banksystem.service.ClerkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ClerkController {
    @Autowired
    ClerkService clertService;

//    @ResponseBody
//    @PostMapping("/addClerk")
//    public String



    @GetMapping("/clerks")
    public String getClerts(){
        List<Clerk> clerks = clertService.getClerks();
        for (Clerk clerk : clerks) {
            System.out.println(clerk);
        }
        return "index";
    }


}
