package com.lana.modules.system.controller;

import com.lana.common.utils.Result;
import com.lana.modules.system.pojo.entity.SysUserEntity;
import com.lana.modules.system.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 注册接口
 * @auther liuyulet
 * @date 2022/9/27 12:54
 */
@RestController
@RequestMapping("/sys/reg")
public class SysRegisterController {
    @Autowired
    private SysUserService sysUserService;

    /**
     * 注册用户
     */

    @PostMapping("/register")
    public Result login(@RequestBody SysUserEntity form){

        sysUserService.saveUser(form);

        return Result.ok("注册成功");
    }
}
