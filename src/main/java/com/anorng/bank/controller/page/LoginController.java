package com.anorng.bank.controller.page;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.anorng.bank.core.utils.MD5Tools;
import com.anorng.bank.entity.BankUser;
import com.anorng.bank.entity.SecurityUser;
import com.anorng.bank.entity.User;

/**
 * 登录的控制器
 * 
 * @author liuxun
 *
 */
@Controller
public class LoginController {
	private final Logger log = LoggerFactory.getLogger(LoginController.class);
	@PersistenceContext
	private EntityManager em;

	/**
	 * 登录提交
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/login",method= {RequestMethod.POST})
	public String login(User user, Model model, HttpSession session) {
		if (user.getAccount() == null || user.getPassword() == null || user.getAccount().trim().length() == 0
				|| user.getPassword().trim().length() == 0) {
			model.addAttribute("errorMsg", "账号和密码不能为空或空格");
			return "login";
		}
		String account = user.getAccount().trim();
		String password = user.getPassword();
		TypedQuery<User> query = em.createNamedQuery("queryUserByAccountAndPassword", User.class);
		query.setParameter("account", account);
		query.setParameter("password", MD5Tools.MD5(password));
		List<User> userList = query.getResultList();
		if (userList.size()==0) {
			log.info("====登录查询不到该用户 account={} password={} ====", account, password);
			model.addAttribute("errorMsg", "账号或密码错误");
			return "login";
		}
		User userReal = userList.get(0);
		log.info("loginUser={}", JSON.toJSONString(userReal));
		userReal.setPassword(null);
		session.setAttribute("loginUser", userReal);
		session.setMaxInactiveInterval(0); // 设置永久不过期

		if (userReal instanceof BankUser) {
			log.info("银行管理员 {} 正在登录", userReal.getName());
			// 跳转到银行管理页面
			return "redirect:/bank/manage";
		} else if (userReal instanceof SecurityUser) {
			log.info("券商管理员 {} 正在登录", userReal.getName());
			// 跳转到券商管理页面
			return "redirect:/security/manage";
		} else {
			log.info("安荣超级管理员 {} 正在登录", userReal.getName());
			// 跳转到超级管理员页面
			return "redirect:/admin/manage";
		}
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value="/logout",method= {RequestMethod.GET})
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/toLogin";
	}
}
