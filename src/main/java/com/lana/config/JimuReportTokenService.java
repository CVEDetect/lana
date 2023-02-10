package com.lana.config;

import com.lana.common.utils.RedisUtils;
import org.apache.commons.lang.StringUtils;
import org.jeecg.modules.jmreport.api.JmReportTokenServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


/**
 * 自定义积木报表鉴权(如果不进行自定义，则所有请求不做权限控制)
 *  * 1.自定义获取登录token
 *  * 2.自定义获取登录用户
 * @author: jeecg-boot
 */



@Component
public class JimuReportTokenService implements JmReportTokenServiceI {

    //鉴权思路：

    @Autowired
    private RedisUtils redisUtils;

    //获取token
    @Override

    public String getToken(HttpServletRequest request) {
        //从header中获取token
        String token = request.getHeader("token");
        //如果header中不存在token，则从参数中获取token
        if(StringUtils.isBlank(token)){
            token = request.getParameter("token");
        }
        return token;
    }
    //验证token
    @Override
    public Boolean verifyToken(String s) {
        if(redisUtils.get(s)!=null){
            return true;
        }else {
            return false;
        }


    }
    //获取用户信息
    @Override
    public Map<String, Object> getUserInfo(String token) {
        return null;
    }
    //获取用户名
    @Override
    public String getUsername(String s) {

        return "admin";
    }


}
