package com.anorng.bank.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 * 表示我们安荣公司的管理员类型的用户 
 * 主要职责是 负责证券公司的添加以及证券和银行管理员的添加
 * 
 * @author liuxun
 *
 */
@Entity
@DiscriminatorValue(value = "AdminUser")
public class AdminUser extends User {
	private static final long serialVersionUID = 1L;

	public AdminUser() {

	}

}
