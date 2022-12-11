package com.codingquokka.pwa_fcm_demo.Controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class HomeController {


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcome(HttpServletRequest request) {

        return "index.jsp";
    }


}
