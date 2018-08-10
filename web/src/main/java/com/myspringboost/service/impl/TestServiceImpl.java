package com.myspringboost.service.impl;

import com.myspringboost.entity.Auth;
import com.myspringboost.repository.mybatis.AuthDao;
import com.myspringboost.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author guojiabin
 * @version 2018/7/27 0027 17:54
 */
@Service
@Transactional(propagation  = Propagation.REQUIRED)
public class TestServiceImpl implements TestService{
    @Autowired
    private AuthDao authDao;
    @Override
    public Auth findAuth(Long id){
        return authDao.get(id);
    }

}
