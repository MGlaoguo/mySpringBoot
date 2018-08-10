package com.myspringboost.repository.mybatis;

import com.myspringboost.entity.Auth;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

/**
 * @author guojiabin
 * @version 2018/7/27 0027 17:59
 */
@MapperScan
public interface AuthDao {
    Auth get(long id);

    public List<Auth> selectAli1688RefreshTokenTimeout();

    /**
     * 1688 查询用户信息专用
     * @param aliId
     * @return
     */
    public Auth selectByAliId(String aliId);

    public Auth selectFirstBySellerId(Auth auth);

    public List<Auth> getCommonConditionExt(Auth auth);

    public int insert(Auth auth);

    public int updateById(Auth auth);

    int updateByAliId(Auth auth);

    /**
     * 这里是逻辑删除,is_deleted='y'
     * @param auth
     * @return
     */
    public int deleteOfWish(Auth auth);

    public int updateByUserId(Auth auth);

    Auth getDistinctAuthByAliId(Long aliId);

    List<Long> getAliIdByUserId(Long userId);

    List<Auth> getAuthForRefreshTokenWillExpried(Auth auth);

    int selectCountByPojo(Auth auth);

    List<Auth> selectByPojo(Auth auth);

    List<Long> getAuthIdListByUserId(Long userId);

    List<Long> getAuthIdListByPojo(Auth auth);

    List<Auth> getAuthIdAndAliasByPojo(Auth auth);

    List<Auth> selectWithAllStatus(Auth auth);

    int selectCountWithAllStatus(Auth auth);

    List<String> selectSiteListByUserId(Long userId);

    int deleteByPojo(Auth auth);

    Auth selectFirst(Auth auth);

    List<Auth> getAllAuthByUserId(Auth auth);

    int updateIsWishExpressById(Auth auth);

    Auth getAliasById(Long id);

    List<Auth> selectLikeWithResourceOwner(Auth auth);

    Auth selectAuthByPojo(Auth auth);
}
