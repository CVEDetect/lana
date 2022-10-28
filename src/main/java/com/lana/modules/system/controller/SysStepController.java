package com.lana.modules.system.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lana.common.utils.PageUtils;
import com.lana.common.utils.Result;
import com.lana.modules.system.pojo.dto.StepNodeDTO;
import com.lana.modules.system.pojo.entity.SysStep;
import com.lana.modules.system.pojo.entity.SysStepNode;
import com.lana.modules.system.service.SysStepNodeService;
import com.lana.modules.system.service.SysStepService;
import io.swagger.annotations.ApiOperation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.lang.reflect.Array;
import java.util.*;

/**
 * (SysStep)表控制层
 *
 * @author liuyulet
 * @since 2022-10-22 14:31:42
 */
@RestController
@RequestMapping("/sysStep")
public class SysStepController extends AbstractController {
    /**
     * 服务对象
     */
    @Resource
    private SysStepService sysStepService;

    @Resource
    private SysStepNodeService sysStepNodeService;

    /**
     * 过程管理
     */
    @ApiOperation(value = "过程节点、人员信息查询", notes = "过程节点、人员信息查询")
    @GetMapping("/getstepNode")
    public Result getstep(@RequestParam Long stepId) {

        JSONObject dates= sysStepService.getByStep(stepId);

        return Result.ok(dates);
    }



    /**
     * 获取过程节点信息
     */
    @ApiOperation(value = "协作过程列表", notes = "协作过程列表")
    @GetMapping("/getStep")
    public Result list(@RequestParam Map<String, Object> params) {

        PageUtils page = sysStepService.queryPage(params);

        return Result.ok(page);
    }


    /**
     * 保存过程节点
     */
    @ApiOperation(value = "保存过程节点用户信息", notes = "保存过程节点用户信息")
    @PostMapping("/saveStep")
    public Result saveStep(@RequestBody JSONObject jsonObject) {

        //处理数据保存过程信息
        SysStep sysStep = new SysStep();
        sysStep.setStepName(jsonObject.getString("stepName"));
        sysStep.setCreateTime(new Date());
        sysStep.setCreateUser(getUserName());
        sysStep.setStepNum(String.valueOf(jsonObject.getJSONArray("stepList").size()));
        sysStepService.saveSysStep(sysStep);
        Long stepId = sysStep.getStepId();
        //保存节点信息
        List<HashMap<String, Object>> stepList = jsonObject.getObject("stepList", List.class);
        List<SysStepNode> sysStepNodes = new ArrayList<>();
        //整理数据
        for (int i = 0; i < stepList.size(); i++) {
            SysStepNode sysStepNode = new SysStepNode();
            sysStepNode.setStepNodeLabel(stepList.get(i).get("label").toString());
            sysStepNode.setStepNodeValue(Long.valueOf(stepList.get(i).get("value").toString()));
            sysStepNode.setStepId(stepId);
            sysStepNodes.add(sysStepNode);
            //解析结果
            HashMap<String, Object> sss = jsonObject.getObject("userSelection", HashMap.class);
            //获取字符
            String userss = sss.get(stepList.get(i).get("value").toString()).toString();
            //获取截取字段
            String dats = userss.substring(1, userss.length() - 1);
            //增加判断，如果是一个人员就直接生成数组

            //生成数组
            String[] users = dats.split(",");
            int[] array = Arrays.stream(users).mapToInt(Integer::parseInt).toArray();
            sysStepService.savess(stepList.get(i).get("value").toString(), array, stepId);
        }
        sysStepNodeService.saveBatch(sysStepNodes);
        //保存节点关联用户信息
        //sysStepService.saveStepNodeUser(stepId,jsonObject.getJSONArray("userSelection"));
        return Result.ok();
    }


}

