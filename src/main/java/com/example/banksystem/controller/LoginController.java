package com.example.banksystem.controller;

import com.example.banksystem.bean.Clerk;
import com.example.banksystem.bean.ClerkExample;
import com.example.banksystem.bean.Msg;
import com.example.banksystem.service.ClerkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    ClerkService clerkService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView imgvrifyControllerDefaultKaptcha(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        String rightCode = (String) request.getSession().getAttribute("rightCode");
        //删除session中数据
        //request.getSession().removeAttribute("rightCode");
        String tryCode = request.getParameter("tryCode");
        System.out.println("rightCode:" + rightCode + " ———— tryCode:" + tryCode);
        if (!rightCode.equals(tryCode)) {
            model.addObject("msg", "验证码错误,请再输一次!");
            model.setViewName("login");
        } else {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            ClerkExample clerkExample = new ClerkExample();
            ClerkExample.Criteria criteria = clerkExample.createCriteria();
            criteria.andUsernameEqualTo(username);
            criteria.andPasswordEqualTo(password);
            List<Clerk> clerks = clerkService.selectByExample(clerkExample);
            if (clerks != null && clerks.size() == 1){
                //model.addObject("msg", "登陆成功");
                request.getSession().setAttribute("login", username);
                request.getSession().setAttribute("clerkid", clerks.get(0).getId());
                model.setViewName("redirect:index");
            }else {
                model.addObject("msg", "账号或者密码错误");
                model.setViewName("login");
            }

        }
        return model;
    }

//    @RequestMapping(value = "/login", method = RequestMethod.POST)
//    public String imgvrifyControllerDefaultKaptcha(HttpServletRequest request, HttpServletResponse response) {
//
//        String rightCode = (String) request.getSession().getAttribute("rightCode");
//        String tryCode = request.getParameter("tryCode");
//        System.out.println("rightCode:" + rightCode + " ———— tryCode:" + tryCode);
//        if (!rightCode.equals(tryCode)) {
//            return "login";
//
//        } else {
//            return "index";
//        }

//    }
    /**
     * 返回首页
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String index(HttpServletRequest request) {
        if (request.getSession().getAttribute("login") != null){
            return "redirect:index";
        }
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("login");
        return "login";
    }



    @GetMapping("/index")
    public String tohome(HttpServletRequest request){
        return "index";
    }

}
