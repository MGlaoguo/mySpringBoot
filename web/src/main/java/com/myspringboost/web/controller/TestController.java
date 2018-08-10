package com.myspringboost.web.controller;

import com.myspringboost.entity.Auth;
import com.myspringboost.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author guojiabin
 * @version 2018/7/27 0027 17:19
 */
@Controller
@RequestMapping("test")
public class TestController {
    @Autowired
    private TestService testService;
    @RequestMapping("m1")
    @ResponseBody
    public String testMethod(){
        return "sdfasdf";
    }
    @RequestMapping("m2")
    @ResponseBody
    public String testMethod2(){
        testService.findAuth(10L);
        System.out.println("asdfssaa");
        return "aaaaaaasss";
    }
    @RequestMapping("m3")
    @ResponseBody
    public String testMethod3(){
        Auth auth = testService.findAuth(24L);
//        String authInfo = auth.getAlias();
        return auth.toString();
    }
}
