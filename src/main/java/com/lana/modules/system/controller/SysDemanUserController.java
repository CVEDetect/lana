package com.lana.modules.system.controller;

import com.lana.common.utils.Result;
import com.lana.modules.system.pojo.entity.SysDemanUserEntity;
import com.lana.modules.system.pojo.entity.SysDepart;
import com.lana.modules.system.service.SysDemanUserService;
import io.swagger.annotations.ApiOperation;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SysDemanUser)表控制层
 * @auther liuyulet
 * @since 2022-10-07 23:16:34
 */
@RestController
@RequestMapping("/sysDemanUser")
public class SysDemanUserController {
    /**
     * 服务对象
     */
    @Resource
    private SysDemanUserService sysDemanUserService;

    /**
     * 修改
     *
     * @return 修改
     *
     * 点击开始这个任务的人是什么角色，这个需求就处于什么状态；如果是开发人员点击开始，需求的状态就是开发状态；
     * 如果是实施人员点击了开始，那么这条需求的状态就是实施；
     */
    @ApiOperation(value = "开始任务", notes = "开始任务")
    @GetMapping("/updateTesk")
    public Result updateDepart(@RequestParam String taskId) {
        SysDemanUserEntity sysDemanUserEntity = sysDemanUserService.getById(taskId);
        sysDemanUserEntity.setTaskStatus(1);
        sysDemanUserService.updateById(sysDemanUserEntity);
        return Result.ok();
    }

}

