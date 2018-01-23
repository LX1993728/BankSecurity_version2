package com.anorng.bank.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 表示银行
 * 
 * @author liuxun
 *
 */
@Entity
@Table(name = "Bank")
public class Bank implements Serializable {
	private static final long serialVersionUID = 1L;

	public Bank() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(length = 100)
	private String name; // 银行的名称

	// 一个银行对应多个银行管理员
	@OneToMany(mappedBy = "bank", cascade = { CascadeType.ALL })
	private List<BankUser> bankUsers = new ArrayList<>();

	public List<BankUser> getBankUsers() {
		return bankUsers;
	}

	public void setBankUsers(List<BankUser> bankUsers) {
		this.bankUsers = bankUsers;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
