package com.anorng.bank.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * 表示证券公司 因为只有一个用户，也可以表示为一个用户
 * 
 * @author liuxun
 *
 */
@Entity
@DiscriminatorValue(value = "BankUser")
public class BankUser extends User {
	private static final long serialVersionUID = 1L;

	public BankUser() {

	}

	// 一个银行的管理员对应一个银行
	@ManyToOne
	@JoinColumn(name = "bank_id")
	private Bank bank;

	public Bank getBank() {
		return bank;
	}

	public void setBank(Bank bank) {
		this.bank = bank;
	}

}
