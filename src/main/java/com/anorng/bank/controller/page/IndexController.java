package com.anorng.bank.controller.page;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

/**
 * 跳转到首页-即登录页 根据错误码跳转
 * 
 * @author liuxun
 *
 */
@Controller
public class IndexController {

	/**
	 * 跳转到登录页
	 * 
	 * @return
	 */
	@RequestMapping("/toLogin")
	public String toIndex() {
		return "login";
	}

	@RequestMapping("/toError")
	public String toErrorPage(Integer errCode) {
		List<Integer> errCodes = new ArrayList<>();
		errCodes.add(400);
		errCodes.add(401);
		errCodes.add(403);
		errCodes.add(404);
		errCodes.add(500);
		if (errCodes.contains(errCode)) {
			return errCode.toString();
		}
		return "400";
	}

	@RequestMapping("/toWelcome")
	public String toWelcome() {
		return "welcome";
	}

	// 统一重定向，防止报错
	@RequestMapping("/redict")
	public ModelAndView toRedict(String url) throws IOException {
		if (url == null) {
			return null;
		}
		return  new ModelAndView(new RedirectView(url));
	}
}
