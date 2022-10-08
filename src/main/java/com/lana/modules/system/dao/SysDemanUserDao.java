package com.lana.modules.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lana.modules.system.pojo.entity.SysDemanUserEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;


/**
 * (SysDemanUser)表数据库访问层
 * @auther liuyulet
 * @since 2022-10-07 23:16:34
 */
@Mapper
public interface SysDemanUserDao extends BaseMapper<SysDemanUserEntity> {


    List<HashMap<String, Object>> getAllOver(String demanId);
}

