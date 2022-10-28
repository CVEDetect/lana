package com.lana.modules.system.pojo.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * (SysDemanUser)实体类
 *
 * @auther liuyulet
 * @since 2022-10-07 23:16:35
 */
@Data
@TableName("sys_deman_user")
public class SysDemanUserEntity implements Serializable {
    private static final long serialVersionUID = 491299544237945298L;
    @TableId
    private Long id;
    /**
     * 用户id
     */
    private Long userId;
    /**
     * 需求id
     */
    private Long demanId;
    /**
     * 0:未开始1:进行中2:已完成
     */
    private Integer taskStatus;
    /**
     * 任务、代码、测试说明提交记录；
     */
    private String taskRecord;
    /**
     * 任务开始时间
     */
    private Date taskStartTime;
    /**
     * 任务结束时间
     */
    private Date taskEndTime;
    /**
     * 任务分配人员
     */
    private String createUser;
    /**
     * 任务分配时间
     */
    private Date createTime;

}

