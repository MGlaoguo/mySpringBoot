package com.myspringboost.service.impl;

import com.myspringboost.entity.Auth;
import com.myspringboost.repository.mybatis.AuthDao;
import com.myspringboost.service.TestService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author guojiabin
 * @version 2018/7/27 0027 17:54
 */
@Service
public class TestServiceImpl implements TestService{
    @Autowired
    private AuthDao authDao;
    @Override
    public Auth findAuth(Long id){
        return authDao.get(id);
    }

}
