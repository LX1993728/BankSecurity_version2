package com.anorng.bank.controller.page;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anorng.bank.entity.AdminUser;

/**
 * 超级管理员控制器
 * @author liuxun
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping("/manage")
	public String toBankManage(HttpSession session,Model model) {
		Object user = session.getAttribute("loginUser");
		if(user == null || !(user instanceof AdminUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}
		// TODO:查询所需要的信息数据 例如 分页查看 已添加的证券公司信息 以及 唯一的一家银行的信息
		// model.addAttribute("page");
		return "adminManage";
	}
	
	/**
	 * 跳转到 超级管理员左侧菜单栏
	 * @return
	 */
	@RequestMapping("/toLeft")
	public String toLeft() {
		return "adminLeft";
	}
	
}
