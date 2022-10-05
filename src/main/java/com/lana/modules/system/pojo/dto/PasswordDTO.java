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
@ApiModel("修改密码")
public class PasswordDTO {
    /**
     * 原密码
     */
    @ApiModelProperty("原密码")
    private String password;
    /**
     * 新密码
     */
    @ApiModelProperty("新密码")
    private String newPassword;

}
