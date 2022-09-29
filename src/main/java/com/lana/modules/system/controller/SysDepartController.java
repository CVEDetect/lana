package com.lana.modules.system.controller;



import com.baomidou.mybatisplus.extension.api.ApiController;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.lana.common.utils.Result;
import com.lana.modules.system.pojo.entity.SysDepart;
import com.lana.modules.system.service.SysDepartService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 组织机构表(SysDepart)表控制层
 *
 * @author lyl
 * @since 2022-09-29 10:02:34
 */
@Api(tags="组织机构接口")
@ApiSupport(author = "liuyulet")
@RestController
@RequestMapping("/sysDepart")
public class SysDepartController extends ApiController {
    /**
     * 服务对象
     */
    @Resource
    private SysDepartService sysDepartService;

    /**
     * 查询所有数据
     * @return 所有数据
     */
    @ApiOperation(value = "组织机构列表", notes = "组织机构列表")
    @GetMapping("/getDepart")
    public Result selectAll() {
        List<SysDepart> departs = sysDepartService.list();
        return Result.ok(departs);
    }


}

