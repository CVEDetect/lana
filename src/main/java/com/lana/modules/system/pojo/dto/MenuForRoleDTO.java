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

/**
 * 密码表单
 *
 * @auther liuyulet
 */
@Data
@ApiModel("角色绑定菜单")
public class MenuForRoleDTO {
    /**
     * 角色id
     */
    @ApiModelProperty("角色id")
    private Integer roleId;
    /**
     * 绑定菜单id
     */
    @ApiModelProperty("已经绑定的，但是要换绑菜单的 菜单id：menuUpdateId，该对象是int[]数组")
    private int[] menuUpdateId;

}
