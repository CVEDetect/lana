package com.lana.modules.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lana.modules.system.dao.SysDepartDao;
import com.lana.modules.system.pojo.entity.SysDepart;
import com.lana.modules.system.service.SysDepartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 组织机构表(SysDepart)表服务实现类
 *
 * @author lyl
 * @since 2022-09-29 10:02:49
 */
@Service("sysDepartService")
public class SysDepartServiceImpl extends ServiceImpl<SysDepartDao, SysDepart> implements SysDepartService {

    @Autowired
    private SysDepartDao sysDepartDao;
    @Override
    public List<SysDepart> getlist() {

        return sysDepartDao.getlist();
    }
}

