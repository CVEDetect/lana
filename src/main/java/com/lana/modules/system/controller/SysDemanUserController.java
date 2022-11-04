package com.lana.modules.system.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.lana.common.utils.Result;
import com.lana.modules.system.pojo.dto.OverTeskDTO;
import com.lana.modules.system.pojo.entity.SysDemanUserEntity;
import com.lana.modules.system.pojo.entity.SysDepart;
import com.lana.modules.system.service.SysDemanUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.crypto.hash.Hash;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * (SysDemanUser)表控制层
 * @auther liuyulet
 * @since 2022-10-07 23:16:34
 */
@Api(tags = "需求人员分配")
@ApiSupport(author = "liuyulet")
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
     */
    @ApiOperation(value = "开始任务", notes = "开始任务")
    @GetMapping("/updateTesk")
    public Result updateDepart(@RequestParam String taskId) {
        SysDemanUserEntity sysDemanUserEntity = sysDemanUserService.getById(taskId);
        sysDemanUserEntity.setTaskStatus(1);
        sysDemanUserEntity.setTaskStartTime(new Date());
        sysDemanUserService.updateById(sysDemanUserEntity);
        return Result.ok();
    }


    /**
     * 修改
     * @return 修改
     */
    @ApiOperation(value = "开始任务", notes = "开始任务")
    @PostMapping("/overTesk")
    public Result overTesk(@RequestBody OverTeskDTO overTeskDTO) {
        SysDemanUserEntity sysDemanUserEntity = sysDemanUserService.getById(overTeskDTO.getDemanId());
        sysDemanUserEntity.setTaskRecord(overTeskDTO.getContents());
        sysDemanUserEntity.setTaskEndTime(new Date());
        sysDemanUserEntity.setTaskStatus(2);
        sysDemanUserService.updateById(sysDemanUserEntity);
        return Result.ok();
    }



    /**
     * 检验
     * @return 检验
     */
    @ApiOperation(value = "校验完成度", notes = "校验完成度")
    @GetMapping("/getAllOver")
    public Result getAllOver(@RequestParam String demanId) {

        List<HashMap<String,Object>> datas = sysDemanUserService.getAllOver(demanId);
        if(datas.size()>0){
            return Result.error("还有未完成的协作者，无法进行下一步");

        }else {
            return Result.ok();
        }
    }


}

