package com.lana.modules.system.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lana.common.utils.PageUtils;
import com.lana.common.utils.Query;
import com.lana.modules.system.dao.SysStepDao;
import com.lana.modules.system.dao.SysUserDepartRoleDao;

import com.lana.modules.system.pojo.entity.SysUserDepartRoleEntity;
import com.lana.modules.system.service.SysUserDepartRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * (SysUserDepartRole)表服务实现类
 *
 * @author liuyulet
 * @since 2022-10-04 18:22:01
 */
@Service("sysUserDepartRoleService")
public class SysUserDepartRoleServiceImpl extends ServiceImpl<SysUserDepartRoleDao, SysUserDepartRoleEntity> implements SysUserDepartRoleService {

    @Resource
    private SysUserDepartRoleDao sysUserDepartRoleDao;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        IPage<SysUserDepartRoleEntity> page = this.page(
                new Query<SysUserDepartRoleEntity>().getPage(params),
                new QueryWrapper<SysUserDepartRoleEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public List<Map<String, Object>> getstepPage(List<Long> sss) {
        return sysUserDepartRoleDao.getstepPage(sss);
    }


}
