package com.anorng.bank.controller.page;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.anorng.bank.entity.Link;
import com.anorng.bank.entity.LinkType;
import com.anorng.bank.entity.SecurityUser;
import com.anorng.bank.service.SecurityService;

/**
 * 证券公司相关的控制器
 * 
 * @author liuxun
 *
 */
@Controller
@RequestMapping("/security")
public class SecurityController {
	private final Logger log = LoggerFactory.getLogger(SecurityController.class);
	@Autowired
	SecurityService securityService;

	@RequestMapping("/manage")
	public String toSecurityManage(HttpSession session, Model model) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof SecurityUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}
		return "securityManage";
	}

	/**
	 * 跳转到证讯管理页面
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/manage_zx")
	public String toZXManage(HttpSession session, Model model) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof SecurityUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}
		// 查询当前公司的所有证讯到页面
		SecurityUser currentUser = (SecurityUser) user;
		// 获取银行设置的且当前公司没有添加过该类型证讯的证讯类型到页面，用于添加证讯
		List<LinkType> linkTypes = securityService.getAllNeedLinkType(currentUser.getSecurityCompany().getId());
		List<Link> links = securityService.findLinksofCompanyByUserId(currentUser.getId());
		log.info("=====links by userid = {}",JSON.toJSONString(links));
		log.info("=====linkTypes all = {}",JSON.toJSONString(linkTypes));
		model.addAttribute("links", links);
		model.addAttribute("types", linkTypes);
		return "securityManage_zx";
	}

	
	/**
	 * 删除指定的不通过审核的证讯
	 * @param session
	 * @param model
	 * @param id  证讯的id
	 * @return
	 */
	@RequestMapping("/manage_del")
	public String toZXDel(HttpSession session, Model model,Long id) {
		// 参数校验
		if (id == null) {
			return "400";
		}
		
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof SecurityUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}
		
		// 查询这个是否证讯是否存在
		Link link = securityService.findLinkById(id);
		if (link == null) {
			return "404";
		}
		if (link.getStatus().equals(Link.STATUS.ENABLE)) {//  只能删除不通过的证讯
			return "400";
		}
	
		// 删除证讯
		securityService.delZX(link);
		
		return "redirect:/security/manage_zx";
	}
	
	/**
	 * 为当前的证券公司添加证讯
	 * @param session
	 * @param model
	 * @param typeId
	 * @param url
	 * @return
	 */
	@RequestMapping("/addLink")
	public String addLinkForCompany(HttpSession session, Model model,Long typeId,String url) {
		// 参数校验
		if (typeId == null || url==null || url.trim().length()==0) {
			return "400";
		}
		
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof SecurityUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}
		SecurityUser securityUser = (SecurityUser) user;
		Boolean isSuccess = securityService.addLinkForCompany(typeId,securityUser.getSecurityCompany().getId(),url);
		if (!isSuccess) {
			return "500";
		}
		return "redirect:/security/manage_zx";
	}
}
