package com.anorng.bank.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * 表示证券公司的用户
 * 
 * @author liuxun
 *
 */
@Entity
@DiscriminatorValue(value = "SecurityUser")
public class SecurityUser extends User {
	private static final long serialVersionUID = 1L;

	@ManyToOne
	@JoinColumn(name = "securitycompany_id")
	private SecurityCompany securityCompany;

	public SecurityUser() {

	}

	public SecurityCompany getSecurityCompany() {
		return securityCompany;
	}

	public void setSecurityCompany(SecurityCompany securityCompany) {
		this.securityCompany = securityCompany;
	}
}
