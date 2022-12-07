package com.lana.modules.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lana.modules.system.pojo.entity.BusBindingEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 任务—流程绑定(BusBinding)表数据库访问层
 *
 * @author lyl
 * @since 2022-12-07 21:26:47
 */
@Mapper
public interface BusBindingDao extends BaseMapper<BusBindingEntity> {

}

