package com.lana.common.constant;

public interface CommonConstant {


	/** {@code 500 Server Error} (HTTP/1.0 - RFC 1945) */
    public static final Integer SC_INTERNAL_SERVER_ERROR_500 = 500;
    /** {@code 200 OK} (HTTP/1.0 - RFC 1945) */
    public static final Integer SC_OK_200 = 200;
    
    /**访问权限认证未通过 510*/
    public static final Integer SC_JEECG_NO_AUTHZ=510;

    /**
     * 微信密钥配置
     */
    String WECHATAPPID="wx601a42bf8731d371";
    String WECHATAPPSECRET="14094a873f96bfc840098b95b955391a";



    /**
     * 微信公众号密钥配置
     * 正式环境
     *     String SERVICENUMBERAPPID="wxae3a9be403813655";
     *     String SERVICENUMBERSECRET="ed2a59b4c02271210437ada12ad58b00";
     */
    /** 测试环境
    String SERVICENUMBERAPPID="wx876f823ab0080050";
    String SERVICENUMBERSECRET="50e829892f2a0bc2ce3320cc5117d760";*/


    String SERVICENUMBERAPPID="";
    String SERVICENUMBERSECRET="";

    /**回调地址*/
    String WECHATAPPREBACK="";

    /**
     * 支付宝配置
     */
    String ZHIFUBAOAPPID="";
    /**支付宝公钥*/
    String ZHIFUBAOPUNLICKEYP="";
    /**支付宝私钥*/
    String ZHIFUBAOPRIVATEKEY="";
    /**回调地址*/
    String ZHIFUBAOAPPREBACK="";

}
