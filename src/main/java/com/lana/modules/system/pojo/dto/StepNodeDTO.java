/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 * <p>
 * https://www.renren.io
 * <p>
 * 版权所有，侵权必究！
 */

package com.lana.modules.system.pojo.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.HashMap;
import java.util.List;

/**
 * 密码表单
 *
 * @auther liuyulet
 */
@Data
@ApiModel("过程节点用户信息")
public class StepNodeDTO {
    /**
     * 过程名称
     */
    @ApiModelProperty("过程名称")
    private String stepName;
    /**
     * 用户信息
     */
    @ApiModelProperty("过程节点绑定的用户信息")
    private Object userSelection;
    /**
     * 过程节点信息
     */
    @ApiModelProperty("过程节点信息")
    private Object stepList;

}
