package com.codingquokka.pwa_fcm_demo.Controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.Map;


@Controller
public class HomeController {

    @Inject
    private FCMService fcmService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcome(HttpServletRequest request) {

        return "index.jsp";
    }

    @RequestMapping(value = "/fcm", method = RequestMethod.GET)
    public ResponseEntity fcm(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> paramMap) {
        try {
            fcmService.sendMessageTo(paramMap.get("token").toString(), paramMap.get("title").toString(), paramMap.get("body").toString());
        } catch (Exception e) {
            return ResponseEntity.status(400).build();
        }
        return ResponseEntity.ok().build();
    }


}
