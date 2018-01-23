package com.anorng.bank.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 证讯类型
 * 
 * @author liuxun
 *
 */
@Table
@Entity(name = "LinkType")
public class LinkType implements Serializable {
	private static final long serialVersionUID = 1L;

	public LinkType() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(length = 40)
	private String name; // 证讯类型的名称

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

	public LinkType(Long id, String name) {
		this.id = id;
		this.name = name;
	}

	
}
