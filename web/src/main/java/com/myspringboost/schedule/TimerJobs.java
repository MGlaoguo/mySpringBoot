package com.myspringboost.schedule;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 定时任务
 * @author guojiabin
 * @version 2018/8/30 0030 17:25
 */
@Component
public class TimerJobs {
    private  static final long TEN_SECONDS =  10 * 1000;
    private  static final long TWENTY_SECONDS =  20 * 1000;
    private static final long PER_FIFTEEN_SECONDS = 15 * 1000;
    private static final String CORN_PER_FIFTEEN_SECONDS = "*/15 * * * * *";
    @Scheduled(fixedDelay = TEN_SECONDS)
    public void jobOne(){
        System.out.println(new Date());
        System.out.println("==================10==jobOne====================");
    }
    @Scheduled(fixedDelay = TWENTY_SECONDS)
    public void jobTwo(){
        System.out.println(new Date());
        System.out.println("=================20===jobOne====================");
    }
    @Scheduled(cron = CORN_PER_FIFTEEN_SECONDS)
    public void jobThree(){
        System.out.println(new Date());
        System.out.println("===================15=jobThree====================");
    }
}
