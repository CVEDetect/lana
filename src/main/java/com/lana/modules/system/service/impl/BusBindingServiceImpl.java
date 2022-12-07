package com.lana.modules.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lana.modules.system.dao.BusBindingDao;
import com.lana.modules.system.pojo.entity.BusBindingEntity;
import com.lana.modules.system.service.BusBindingService;
import org.springframework.stereotype.Service;

/**
 * 任务—流程绑定(BusBinding)表服务实现类
 *
 * @author lyl
 * @since 2022-12-07 21:26:49
 */
@Service("busBindingService")
public class BusBindingServiceImpl extends ServiceImpl<BusBindingDao, BusBindingEntity> implements BusBindingService {

}

