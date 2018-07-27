package com.myspringboost.web.controller;

import com.myspringboost.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
        return "sdfasdf";
    }
}
