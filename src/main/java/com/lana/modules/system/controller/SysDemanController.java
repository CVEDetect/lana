package com.lana.modules.system.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.lana.common.utils.PageUtils;
import com.lana.common.utils.Result;
import com.lana.modules.system.pojo.dto.UserForDemdDTO;
import com.lana.modules.system.pojo.dto.UserForRoleDTO;
import com.lana.modules.system.pojo.entity.SysDeman;
import com.lana.modules.system.pojo.entity.SysDemanHistroyEntity;
import com.lana.modules.system.pojo.entity.SysProjectEntity;
import com.lana.modules.system.pojo.entity.SysUserEntity;
import com.lana.modules.system.service.SysDemanHistroyService;
import com.lana.modules.system.service.SysDemanService;
import com.lana.modules.system.service.SysProjectService;
import com.lana.modules.system.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

/**
 * (SysDeman)表控制层
 *
 * @author liuyulet
 * @since 2022-09-30 11:25:38
 */
@RestController
@Api(tags = "需求信息接口")
@ApiSupport(author = "liuyulet")
@RequestMapping("/sysDeman")
public class SysDemanController  extends  AbstractController{
    /**
     * 服务对象
     */
    @Resource
    private SysDemanService sysDemanService;
    @Autowired
    private SysUserService sysUserService;

    @Resource
    private SysProjectService sysProjectService;
    /**
     * 变更历史记录
     */
    @Resource
    private SysDemanHistroyService sysDemanHistroyService;
    /**
     * 所有需求列表
     */
    @ApiOperation(value = "需求列表", notes = "需求列表")
    @GetMapping("/getDeman")
    public Result list(@RequestParam Map<String, Object> params) {

        PageUtils page = sysDemanService.queryPage(params);

        return Result.ok(page);
    }

    /**
     * 需求
     * @return 新增
     */
    @ApiOperation(value = "新增需求", notes = "新增需求")
    @PostMapping("/addDeman")
    public Result addDeman(@RequestBody SysDeman sysDeman) {
        sysDeman.setCreateTime(new Date());
        //添加人员
        SysUserEntity user = sysUserService.getById(sysDeman.getDemanConsci());
        sysDeman.setDemanConsciAcoun(user.getFullname()+"["+user.getMobile()+"]");
        //添加项目
        SysProjectEntity sysProjectEntity = sysProjectService.getProjects(sysDeman.getDemanProject());
        sysDeman.setDemanProjectNam(sysProjectEntity.getProjectName());
        sysDemanService.save(sysDeman);
        return Result.ok();
    }


    /**
     * 删除
     *
     * @return 删除
     */
    @ApiOperation(value = "删除需求", notes = "删除需求(只能删除未分配的需求)")
    @GetMapping("/delDeman")
    public Result delDepart(@RequestParam Long id) {
        sysDemanService.removeById(id);
        return Result.ok();
    }


    /**
     * 需求
     * @return 修改
     */
    @ApiOperation(value = "修改需求（需求变更）", notes = "修改需求（需求变更）")
    @PostMapping("/updateProject")
    public Result updateProject(@RequestBody SysDeman sysDeman) {


        SysUserEntity user = sysUserService.getById(sysDeman.getDemanConsci());
        sysDeman.setDemanConsciAcoun(user.getFullname()+"["+user.getMobile()+"]");

        SysProjectEntity sysProjectEntity = sysProjectService.getProjects(sysDeman.getDemanProject());
        sysDeman.setDemanProjectNam(sysProjectEntity.getProjectName());

        //需求修改，就需要将此次修改的记录加入到
        SysDeman deman = sysDemanService.getById(sysDeman.getId());
        SysDemanHistroyEntity sysDemanHistroyEntity = new SysDemanHistroyEntity();
        //赋值转换
        BeanUtils.copyProperties(deman,sysDemanHistroyEntity);
        //加入历史表
        Boolean flag = sysDemanHistroyService.save(sysDemanHistroyEntity);
        if(flag){
            sysDeman.setDemanChange(sysDeman.getDemanChange()+1);
            sysDemanService.updateById(sysDeman);
        }
        //需求修改，就需要将此次修改的记录加入到
        return Result.ok();
    }

    /**
     * 需求分配人员
     *
     * @return 需求分配人员
     */
    @ApiOperation(value = "机构绑定人员", notes = "机构绑定人员")
    @PostMapping("/userForDeman")
    public Result userForDeman(@RequestBody UserForDemdDTO userForDemdDTO) {
        //将数据更新到用户和组织机构中间表
        sysDemanService.userForDeman(userForDemdDTO);

        SysDeman deman = sysDemanService.getById(userForDemdDTO.getDemendId());
        deman.setDemanStatus(2);
        sysDemanService.updateById(deman);
        //修改需求状态
        return Result.ok();
    }

    /**
     * 所有需求列表
     */
    @ApiOperation(value = "需求列表", notes = "需求列表")
    @GetMapping("/getMyDeman")
    public Result getMyDeman(@RequestParam Map<String, Object> params) {

        PageUtils page = sysDemanService.getMyDeman(params);

        return Result.ok(page);
    }




}

