package com.anorng.bank.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 表示证券公司
 * 
 * @author liuxun
 *
 */
@Entity
@Table(name = "SecurityCompany")
@NamedQueries(value = {
		 @NamedQuery(
			 name="querySecurityCompany",
			 query="SELECT sc FROM SecurityCompany sc"
		 ),
		 @NamedQuery(
			 name="querySecurityCompanyCount",
			 query="SELECT COUNT(sc) FROM SecurityCompany sc"
		 ),
		 @NamedQuery(
				 name="querySecurityCompanyByLikeName",
				 query="SELECT sc FROM SecurityCompany sc WHERE sc.name like :cname"
				 ),
		 @NamedQuery(
		 name="querySecurityCompanyByStatus",
		 query="SELECT sc FROM SecurityCompany sc WHERE sc.status =:status"
		 ),
		 @NamedQuery(
		 name="querySecurityCompanyCountByStatus",
		 query="SELECT COUNT(sc) FROM SecurityCompany sc WHERE sc.status =:status"
		 )
})
public class SecurityCompany implements Serializable {
	private static final long serialVersionUID = 1L;

	public SecurityCompany() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id; // 证券公司的ID

	@Column(nullable = false, length = 100)
	private String name; // 证券公司的名称
	private String logo; // 证券公司的图标的相对链接

	// 一个证券公司有多个证券登录用户
	@Basic(fetch=FetchType.EAGER)
	@OneToMany(mappedBy = "securityCompany", cascade = { CascadeType.ALL })
	private List<SecurityUser> securityUsers = new ArrayList<>();

	// 一个证券公司可以添加多个证讯的链接
	@Basic(fetch=FetchType.EAGER)
	@OneToMany(mappedBy = "securityCompany", cascade = { CascadeType.ALL })
	private List<Link> links = new ArrayList<>();

	// 表示证券公司在当前银行的上架和下架状态
	@Enumerated(EnumType.STRING)
	private STATUS status;

	public enum STATUS {
		UP, DOWN // 上架下架
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public List<SecurityUser> getSecurityUsers() {
		return securityUsers;
	}

	public void setSecurityUsers(List<SecurityUser> securityUsers) {
		this.securityUsers = securityUsers;
	}

	public List<Link> getLinks() {
		return links;
	}

	public void setLinks(List<Link> links) {
		this.links = links;
	}

	public SecurityCompany(Long id, String name) {
		this.id = id;
		this.name = name;
	}
	
	

}
