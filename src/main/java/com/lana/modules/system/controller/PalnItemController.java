package com.lana.modules.system.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.lana.common.utils.PageUtils;
import com.lana.common.utils.Result;
import com.lana.modules.system.pojo.entity.PalnItemEntity;
import com.lana.modules.system.service.PalnItemService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * (PalnItem)表控制层
 *
 * @author liuyulet
 * @since 2022-11-03 15:16:12
 */
@RestController
@Api(tags = "计划--任务维护")
@ApiSupport(author = "liuyulet")
@RequestMapping("/palnItem")
public class PalnItemController {
    /**
     * 服务对象
     */
    @Resource
    private PalnItemService palnItemService;

    /**
     * 任务维护接口列表
     */
    @ApiOperation(value = "任务维护接口列表", notes = "任务维护接口列表")
    @GetMapping("/getPalnItem")
    public Result list(@RequestParam Map<String, Object> params) {

        PageUtils page = palnItemService.queryPage(params);

        return Result.ok(page);
    }

    @ApiOperation(value = "新增计划任务项", notes = "新增计划任务项")
    @PostMapping("/addPalnItem")
    public Result list(@RequestBody PalnItemEntity palnItemEntity) {

        palnItemService.save(palnItemEntity);

        return Result.ok();
    }

}

