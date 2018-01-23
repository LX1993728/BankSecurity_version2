package com.anorng.bank.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 证券公司提供的证讯
 * 
 * @author liuxun
 *
 */
@Entity
@Table(name = "Link")
public class Link implements Serializable {
	private static final long serialVersionUID = 1L;

	public Link() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(length = 100)
	private String url; // 对应的链接

	@ManyToOne
	@JoinColumn(name = "linkType_id")
	private LinkType linkType;

	@JSONField(serialize=false)
	@ManyToOne
	@JoinColumn(name = "securitycompany_id")
	private SecurityCompany securityCompany;

	@Enumerated(EnumType.STRING)
	private STATUS status;

	public enum STATUS {
		ENABLE, DISABLE // 禁用 启用
	}

	@Transient
	private String  companyName;
	
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public STATUS getStatus() {
		return status;
	}

	public void setStatus(STATUS status) {
		this.status = status;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public LinkType getLinkType() {
		return linkType;
	}

	public void setLinkType(LinkType linkType) {
		this.linkType = linkType;
	}

	public SecurityCompany getSecurityCompany() {
		return securityCompany;
	}

	public void setSecurityCompany(SecurityCompany securityCompany) {
		this.securityCompany = securityCompany;
	}

	public Link(String url, STATUS status, Long id) {
		super();
		this.url = url;
		this.status = status;
		this.id = id;
	}

	public Link(String url, LinkType linkType, SecurityCompany securityCompany, STATUS status) {
		super();
		this.url = url;
		this.linkType = linkType;
		this.securityCompany = securityCompany;
		this.status = status;
	}
	
	

}
