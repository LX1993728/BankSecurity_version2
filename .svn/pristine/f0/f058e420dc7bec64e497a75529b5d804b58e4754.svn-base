package com.anorng.bank.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * 行情实体类 注意：新建一证讯类型 同时也就新产生了一个行情
 * 
 * @author liuxun
 *
 */
@Entity
@Table(name = "Market")
public class Market implements Serializable{
	private static final long serialVersionUID = 1L;
	public Market() {
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	
	@OneToOne(cascade= {CascadeType.ALL},optional=false)
	@JoinColumn(name="linkType_id")
	private LinkType linkType; // 一个行情只具有一个证讯类型 且证券类型初始化后不能被改变  
	
	@OneToOne
	@JoinColumn(name="link_id")
	private Link link; // 一个行情只具有一个证讯 且这个证讯的类型必须和上边的证讯类型相同
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LinkType getLinkType() {
		return linkType;
	}

	public void setLinkType(LinkType linkType) {
		this.linkType = linkType;
	}

	public Link getLink() {
		return link;
	}

	public void setLink(Link link) {
		this.link = link;
	}
	
}
