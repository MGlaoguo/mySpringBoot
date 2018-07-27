package com.myspringboost.entity;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * @author guojiabin
 * @version 2018/7/27 0027 18:04
 */
@Component
public class Auth {
    /**
     * 授权正常
     */
    public static String STATUS_ENABLE = "enable";
    /**
     * 授权失效
     */
    public static String STATUS_DISABLE = "disable";

    //alibaba 客户唯一标示ID
    private Long aliId;
    //aliExpress卖家帐号,也是卖家旺旺ID
    private String resourceOwner;
    //长时令牌
    private String refreshToken;
    //AE授权日期
    private Date authorizedDate;
    //授权信息状态
    private String status;
    //是否默认绑定 y\n
    private String defaultBinding;
    //店铺别名
    private String alias;
    // 美元汇率
    private BigDecimal rate;

    private String appKey;
    private String appSecret;

    //卖家地址
    private String sellerAddress;
    //卖家电话
    private String sellerPhone;
    //卖家邮编
    private String sellerZipCode;
    //退回单位
    private String returnUnit;
    // refreshToken过期时间
    private Date refreshTokenTimeout;
    private String wishAppKey;
    private String joomAppKey;
    private String site;
    private String sellerId;
    private String wishProductId;
    /**
     * 协议客户
     */
    private String customerAgreement;
    /**
     * 是否授权失效
     */
    private String isExpired;
    /**
     * 版本号 magento v1 v2
     */
    private String version;

    /**
     * ae的作废,在调用时,通过向聚石塔传递resourceOwner,在塔内获取
     */
    private String accessToken;
    private Date accessTokenTimeout;
    //----------下面的属性不会持久化到数据库
    List<Long> aliIdList; // aliId列表，作为查询参数

    private String isSelect;
    private Date refreshTokenTimeoutBegin;
    private Date refreshTokenTimeoutEnd;
    private List<Long> idList;
    private Long notUserId;
    private String loginName;
    private List<String> sites;
    private String approvalStatus;// 审核状态
    private String sellerIdLike; // sellerId的模糊查询
    private List<String> notSites;

    public String getCustomerAgreement() {
        return customerAgreement;
    }

    public void setCustomerAgreement(String customerAgreement) {
        this.customerAgreement = customerAgreement;
    }

    public Long getAliId() {
        return aliId;
    }

    public void setAliId(Long aliId) {
        this.aliId = aliId;
    }

    public String getResourceOwner() {
        return resourceOwner;
    }

    public void setResourceOwner(String resourceOwner) {
        this.resourceOwner = resourceOwner;
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public void setRefresh_token(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public Date getAuthorizedDate() {
        return authorizedDate;
    }

    public void setAuthorized_date(Date authorizedDate) {
        this.authorizedDate = authorizedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDefaultBinding() {
        return defaultBinding;
    }

    public void setDefaultBinding(String defaultBinding) {
        this.defaultBinding = defaultBinding;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public List<Long> getAliIdList() {
        return aliIdList;
    }

    public void setAliIdList(List<Long> aliIdList) {
        this.aliIdList = aliIdList;
    }

    public String getAppKey() {
        return appKey;
    }

    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public String getAppSecret() {
        return appSecret;
    }

    public void setAppSecret(String appSecret) {
        this.appSecret = appSecret;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getSellerAddress() {
        return sellerAddress;
    }

    public void setSellerAddress(String sellerAddress) {
        this.sellerAddress = sellerAddress;
    }

    public String getSellerPhone() {
        return sellerPhone;
    }

    public void setSellerPhone(String sellerPhone) {
        this.sellerPhone = sellerPhone;
    }

    public String getSellerZipCode() {
        return sellerZipCode;
    }

    public void setSellerZipCode(String sellerZipCode) {
        this.sellerZipCode = sellerZipCode;
    }

    public String getReturnUnit() {
        return returnUnit;
    }

    public void setReturnUnit(String returnUnit) {
        this.returnUnit = returnUnit;
    }

    public String getIsSelect() {
        return isSelect;
    }

    public void setIsSelect(String isSelect) {
        this.isSelect = isSelect;
    }

    public Date getRefreshTokenTimeout() {
        return refreshTokenTimeout;
    }

    public void setRefreshTokenTimeout(Date refreshTokenTimeout) {
        this.refreshTokenTimeout = refreshTokenTimeout;
    }

    public Date getRefreshTokenTimeoutBegin() {
        return refreshTokenTimeoutBegin;
    }

    public void setRefreshTokenTimeoutBegin(Date refreshTokenTimeoutBegin) {
        this.refreshTokenTimeoutBegin = refreshTokenTimeoutBegin;
    }

    public Date getRefreshTokenTimeoutEnd() {
        return refreshTokenTimeoutEnd;
    }

    public void setRefreshTokenTimeoutEnd(Date refreshTokenTimeoutEnd) {
        this.refreshTokenTimeoutEnd = refreshTokenTimeoutEnd;
    }

    public String getWishAppKey() {
        return wishAppKey;
    }

    public void setWishAppKey(String wishAppKey) {
        this.wishAppKey = wishAppKey;
    }

    public String getJoomAppKey() {
        return joomAppKey;
    }

    public void setJoomAppKey(String joomAppKey) {
        this.joomAppKey = joomAppKey;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site == null ? site : site.trim();
    }

    public List<Long> getIdList() {
        return idList;
    }

    public void setIdList(List<Long> idList) {
        this.idList = idList;
    }

    public Long getNotUserId() {
        return notUserId;
    }

    public void setNotUserId(Long notUserId) {
        this.notUserId = notUserId;
    }

    public String getWishProductId() {
        return wishProductId;
    }

    public void setWishProductId(String wishProductId) {
        this.wishProductId = wishProductId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getIsExpired() {
        return isExpired;
    }

    public void setIsExpired(String isExpired) {
        this.isExpired = isExpired;
    }

    public List<String> getSites() {
        return sites;
    }

    public void setSites(List<String> sites) {
        this.sites = sites;
    }

    public String getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(String approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public String getSellerIdLike() {
        return sellerIdLike;
    }

    public void setSellerIdLike(String sellerIdLike) {
        this.sellerIdLike = sellerIdLike;
    }

    public List<String> getNotSites() {
        return notSites;
    }

    public void setNotSites(List<String> notSites) {
        this.notSites = notSites;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public Date getAccessTokenTimeout() {
        return accessTokenTimeout;
    }

    public void setAccessTokenTimeout(Date accessTokenTimeout) {
        this.accessTokenTimeout = accessTokenTimeout;
    }
}


