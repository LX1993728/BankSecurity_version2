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
import com.anorng.bank.core.utils.Page;
import com.anorng.bank.entity.BankUser;
import com.anorng.bank.entity.LinkType;
import com.anorng.bank.entity.Market;
import com.anorng.bank.entity.SecurityCompany;
import com.anorng.bank.service.BankService;
import com.anorng.bank.service.SecurityService;

/**
 * 银行相关的控制器
 * 
 * @author liuxun
 *
 */
@Controller
@RequestMapping("/bank")
public class BankController {
	private final Logger log = LoggerFactory.getLogger(BankController.class);
	@Autowired
	SecurityService securityService;

	@Autowired
	BankService bankService;

	/**
	 * 跳转到银行用户管理页面
	 * 
	 * @param session
	 * @param model
	 * @param p
	 *            即将跳转的页码
	 * @return
	 */
	@RequestMapping("/manage")
	public String toBankManage(HttpSession session, Model model) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof BankUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}

		return "bankManage";
	}

	/**
	 * 跳转到券商管理页面
	 * 
	 * @param session
	 * @param model
	 * @param p
	 *            第几页
	 * @return
	 */
	@RequestMapping("/manage_qs")
	public String toManageQS(HttpSession session, Model model, Integer p) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof BankUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}
		if (p == null) { // 如果页码参数为null 则默认跳转到第一页
			p = 1;
		}
		model.addAttribute("page", securityService.queryCompanyByPage(p));
		return "bankManage_qs";
	}

	/**
	 * 根据证券公司的名称进行查询
	 * 
	 * @param session
	 * @param model
	 * @param name
	 *            查询字段-对应证券公司的名称
	 * @return
	 */
	@RequestMapping("/manage_query")
	public String toManageQSQueryByName(HttpSession session, Model model, String name) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof BankUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}
		if (name == null || name.trim().length() == 0) {
			return "redirect:/bank/manage_qs";
		}
		Page<SecurityCompany> page = securityService.queryCompanyByLikeName(name);
		model.addAttribute("page", page);
		model.addAttribute("cName", name);
		return "bankManage_qs";
	}

	/**
	 * 银行管理员对证券公司进行上架下架管理
	 * 
	 * @param id
	 * @param isEnable
	 * @return
	 */
	@RequestMapping("/disOrEnable")
	public String disableOrEnableSecurity(HttpSession session, Model model, Long id, Boolean isEnable, Integer p) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof BankUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}
		if (id == null || isEnable == null) {
			return "400";
		}
		// 如果有行情 关联此公司的证讯 则不允许下架
		Boolean isRelationToZX = securityService.isZXRelatedToCompany(id);
		if (isRelationToZX) {
			model.addAttribute("info", "该公司有链接被证讯关联, 不可以下架");
			return "info";
		}
		Boolean isSuccess = securityService.disOrEnableSecurity(id, isEnable);
		if (!isSuccess) {
			return "500";
		}
		if (p == null) { // 如果页码参数为null 则默认跳转到第一页
			p = 1;
		}
		model.addAttribute("page", securityService.queryCompanyByPage(p));
		return "bankManage_qs";
	}

	/**
	 * 跳转到证讯审批页面
	 * 
	 * @param session
	 * @param model
	 * @param p
	 *            页码
	 * @return
	 */
	@RequestMapping("/manage_sp")
	public String toSP(HttpSession session, Model model, Integer p) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof BankUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}

		// 获取所有已经上架的所有证券公司的公司名以及公司的ID
		List<SecurityCompany> companies = securityService.getCompanyNameAndIds();
		model.addAttribute("companies", companies);
		return "bankManage_sp";
	}

	/**
	 * 跳转到证讯绑定页面
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/manage_bd")
	public String toBD(HttpSession session, Model model) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof BankUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}

		// 获取所有的行情 信息返回到页面
		List<Market> markets = bankService.getAllMarket();
		log.info("====获取所有的证讯数据 : {}", JSON.toJSONString(markets));
		model.addAttribute("markets", markets);
		return "bankManage_bd";
	}

	/**
	 * 跳转至证讯类型管理页面
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/manage_type")
	public String toManageType(HttpSession session, Model model) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof BankUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}

		// 获取所有证讯类型的名称和主键 返回到页面
		List<LinkType> linkTypes = bankService.getAllLinkTypes();
		model.addAttribute("types", linkTypes);
		return "bankManage_type";
	}
	
	/**
	 * 修改证讯类型的名称
	 * @param session
	 * @param model
	 * @param name
	 * @param id 证讯类型的名称
	 * @return
	 */
	@RequestMapping("/changeTypeName")
	public String changeNameOfType(HttpSession session, Model model,String name,Long id) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof BankUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}
		
		if (id == null || name==null || name.trim().length()==0) {
			return "400";
		}
		Boolean isSuccess = bankService.changeTypeName(name,id);
		if (!isSuccess) {
			return "500";
		}
		return "redirect:/bank/manage_type";
	}
	
	/**
	 * 添加证讯类型
	 * @param session
	 * @param model
	 * @param name
	 * @return
	 */
	@RequestMapping("/addType")
	public String addLinkType(HttpSession session, Model model,String name) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof BankUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}
		
		if (name==null || name.trim().length()==0) {
			return "400";
		}
		Boolean isSuccess = bankService.addType(name);
		if (!isSuccess) {
			return "500";
		}
		return "redirect:/bank/manage_type";
	}
	
	/**
	 * 删除证讯类型
	 * @param session
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/delType")
	public String deleteinkType(HttpSession session, Model model,Long id) {
		Object user = session.getAttribute("loginUser");
		if (user == null || !(user instanceof BankUser)) {
			model.addAttribute("errorMsg", "登录过期，请重新登录");
			return "login";
		}
		
		if (id == null) {
			return "400";
		}
		Boolean isSuccess = bankService.deleteType(id);
		if (!isSuccess) {
			return "500";
		}
		return "redirect:/bank/manage_type";
	}

}
