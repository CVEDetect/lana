package com.lana.modules.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lana.common.utils.PageUtils;
import com.lana.common.utils.Query;
import com.lana.modules.system.dao.SysDemanUserDao;
import com.lana.modules.system.pojo.entity.SysDeman;
import com.lana.modules.system.pojo.entity.SysDemanUserEntity;

import com.lana.modules.system.pojo.entity.SysUserEntity;
import com.lana.modules.system.service.SysDemanUserService;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (SysDemanUser)表服务实现类
 * @auther liuyulet
 * @since 2022-10-07 23:16:36
 */
@Service("sysDemanUserService")
public class SysDemanUserServiceImpl extends ServiceImpl<SysDemanUserDao, SysDemanUserEntity> implements SysDemanUserService {
    @Resource
    private SysDemanUserDao sysDemanUserDao;


    @Override
    public List<HashMap<String, Object>> getAllOver(String demanId) {
        return sysDemanUserDao.getAllOver(demanId);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, SysUserEntity userEntit) {
        IPage<SysDemanUserEntity> page = this.page(
                new Query<SysDemanUserEntity>().getPage(params),
                new QueryWrapper<SysDemanUserEntity>()
                        .eq("user_opinion",3)
                        .eq("user_id",userEntit.getUserId())
                        .select().orderByDesc("create_time")
        );
        return new PageUtils(page);
    }
}
