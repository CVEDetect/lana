package com.lana.modules.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lana.modules.system.dao.SysDemanUserDao;
import com.lana.modules.system.pojo.entity.SysDemanUserEntity;

import com.lana.modules.system.service.SysDemanUserService;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;

/**
 * (SysDemanUser)表服务实现类
 * @auther liuyulet
 * @since 2022-10-07 23:16:36
 */
@Service("sysDemanUserService")
public class SysDemanUserServiceImpl extends ServiceImpl<SysDemanUserDao, SysDemanUserEntity> implements SysDemanUserService {
    @Resource
    private SysDemanUserDao sysDemanUserDao;


}
