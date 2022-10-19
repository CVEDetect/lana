package com.lana.modules.system.controller;

import cn.hutool.core.collection.CollUtil;
import com.lana.common.utils.PageUtils;
import com.lana.common.utils.Result;
import com.lana.modules.system.pojo.vo.LookCollaVO;
import com.lana.modules.system.service.SysTaskService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (SysTask)表控制层
 * @auther liuyulet
 * @since 2022-10-07 21:45:13
 */
@RestController
@RequestMapping("/sysTask")
public class SysTaskController extends  AbstractController{
    /**
     * 服务对象
     */
    @Resource
    private SysTaskService sysTaskService;

    /**
     * 所有需求列表
     */
    @ApiOperation(value = "我的需求列表", notes = "需求列表")
    @GetMapping("/getDemanTask")
    public Result list(@RequestParam Map<String, Object> params) {

        PageUtils page = sysTaskService.queryPage(params);

        return Result.ok(page);
    }


    /**
     * 协作者信息
     */
    @ApiOperation(value = "查看协作者信息", notes = "查看协作者信息")
    @GetMapping("/getLookColla")
    public Result getLookColla(@RequestParam String demanId) {

        List<LookCollaVO> page = sysTaskService.getLookColla(demanId);

        return Result.ok(page);
    }



    /**
     * 过程管理
     */
    @ApiOperation(value = "过程列表", notes = "过程列表")
    @GetMapping("/getstep")
    public Result getstep() {


        List<HashMap<String,Object>> dates = new ArrayList<HashMap<String,Object>>();
        HashMap<String, Object> hashMap = new HashMap<>();
        HashMap<String, Object> hashMap1 = new HashMap<>();
        HashMap<String, Object> hashMap2 = new HashMap<>();
        HashMap<String, Object> hashMap3 = new HashMap<>();
        hashMap.put("value",1);
        hashMap.put("label","需求整理");

        hashMap1.put("value",2);
        hashMap1.put("label","软件开发");

        hashMap2.put("value",3);
        hashMap2.put("label","功能测试");

        hashMap3.put("value",4);
        hashMap3.put("label","实施上线");


        dates.add(hashMap);
        dates.add(hashMap1);
        dates.add(hashMap2);
        dates.add(hashMap3);

        return Result.ok(dates);
    }



}

