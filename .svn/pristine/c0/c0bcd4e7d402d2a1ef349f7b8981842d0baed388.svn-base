package com.anorng.bank.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.anorng.bank.core.utils.MD5Tools;
import com.anorng.bank.entity.AdminUser;
import com.anorng.bank.entity.Bank;
import com.anorng.bank.entity.BankUser;
import com.anorng.bank.entity.Link;
import com.anorng.bank.entity.LinkType;
import com.anorng.bank.entity.Market;
import com.anorng.bank.entity.SecurityCompany;
import com.anorng.bank.entity.SecurityUser;

@Service
@Transactional
public class TestService {
	@PersistenceContext
	private EntityManager em;

	public void test1() {
		// 测试数据-----------------

		// 添加4个证券类型 同时添加4个行情
		LinkType linkType1 = new LinkType();
		linkType1.setName("自选股");
		LinkType linkType2 = new LinkType();
		linkType2.setName("基本行情");
		LinkType linkType3 = new LinkType();
		linkType3.setName("盯盘小秘书");
		LinkType linkType4 = new LinkType();
		linkType4.setName("股票助手");

		Market market1 = new Market();
		market1.setLinkType(linkType1);
		Market market2 = new Market();
		market2.setLinkType(linkType2);
		Market market3 = new Market();
		market3.setLinkType(linkType3);
		Market market4 = new Market();
		market4.setLinkType(linkType4);

		em.persist(market1);
		em.persist(market2);
		em.persist(market3);
		em.persist(market4);

		// 添加证券公司以及用户
		SecurityUser user = new SecurityUser();
		user.setAccount("aaa");
		user.setPassword(MD5Tools.MD5("123456"));
		user.setName("张三");
		SecurityUser user2 = new SecurityUser();
		user2.setAccount("bbb");
		user2.setPassword(MD5Tools.MD5("123456"));
		user2.setName("李四");

		SecurityCompany company = new SecurityCompany();
		company.setName("东北证券");
		company.getSecurityUsers().add(user);
		company.getSecurityUsers().add(user2);
		company.setStatus(SecurityCompany.STATUS.UP);
		Link link1ForCompany = new Link("http://www.baidu.com", linkType1, company, Link.STATUS.ENABLE);
		market1.setLink(link1ForCompany);
		em.persist(market1);
		company.getLinks().add(link1ForCompany);
		company.getLinks().add(new Link("http://www.iqiyi.com/", linkType2, company, Link.STATUS.DISABLE));
		company.getLinks().add(new Link("http://www.youku.com/", linkType3, company, Link.STATUS.DISABLE));
		company.getLinks().add(new Link("https://cn.bing.com/", linkType4, company, Link.STATUS.DISABLE));
		company.setLogo("/图层 1.png");
		user.setSecurityCompany(company);
		user2.setSecurityCompany(company);

		SecurityUser user3 = new SecurityUser();
		user3.setAccount("ccc");
		user3.setPassword(MD5Tools.MD5("123456"));
		user3.setName("王五");
		SecurityUser user4 = new SecurityUser();
		user4.setAccount("ddd");
		user4.setPassword(MD5Tools.MD5("123456"));
		user4.setName("赵六");
		SecurityCompany company2 = new SecurityCompany();
		company2.setName("中信投建");
		company2.getSecurityUsers().add(user3);
		company2.getSecurityUsers().add(user4);
		company2.setStatus(SecurityCompany.STATUS.UP);
		company2.getLinks().add(new Link("https://www.360.cn/", linkType1, company2, Link.STATUS.DISABLE));
		company2.getLinks().add(new Link("http://desk.zol.com.cn/meinv/", linkType2, company2, Link.STATUS.DISABLE));
		company2.getLinks().add(new Link("https://www.sogou.com/", linkType3, company2, Link.STATUS.DISABLE));
		company2.getLinks().add(new Link("http://www.ivsky.com/tupian/ziranfengguang/", linkType4, company2, Link.STATUS.DISABLE));
		company2.setLogo("/图层 2.png");
		user3.setSecurityCompany(company2);
		user4.setSecurityCompany(company2);

		em.persist(company);
		em.persist(company2);
		System.out.println(company.getId() + "============");
		System.out.println(company2.getId() + "============");

		// 添加银行以及管理员信息
		Bank bank = new Bank();
		bank.setName("建设银行");
		BankUser bankUser = new BankUser();
		bankUser.setName("刘勋");
		bankUser.setAccount("admin");
		bankUser.setPassword(MD5Tools.MD5("123456"));
		BankUser bankUser2 = new BankUser();
		bankUser2.setName("张伟");
		bankUser2.setAccount("admin2");
		bankUser2.setPassword(MD5Tools.MD5("123456"));
		bank.getBankUsers().add(bankUser);
		bank.getBankUsers().add(bankUser2);
		bankUser.setBank(bank);
		bankUser2.setBank(bank);
		em.persist(bank);
		System.out.println(bank.getId() + "============");

		// 添加超级管理员信息
		AdminUser adminUser = new AdminUser();
		adminUser.setAccount("super");
		adminUser.setLogo("http://logo.com");
		adminUser.setName("刘勋");
		adminUser.setPassword(MD5Tools.MD5("123456"));
		em.persist(adminUser);
		System.out.println(adminUser.getId() + "========");

	}
}
