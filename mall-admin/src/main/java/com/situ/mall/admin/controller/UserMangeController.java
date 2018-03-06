package com.situ.mall.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.response.ServerResponse;
import com.situ.mall.core.constant.Const;
import com.situ.mall.core.entity.Product;
import com.situ.mall.core.entity.User;
import com.situ.mall.core.service.IUserService;

import net.sf.jsqlparser.util.AddAliasesVisitor;

@Controller
@RequestMapping("/manager/user")
public class UserMangeController {
	@Autowired
	
	private IUserService userservice;
	
	
	@RequestMapping(value="/getLoginPage")
	public String getLoginPage() {
		return "login";
	}
	
	@RequestMapping("/pageList")
	@ResponseBody
	public ServerResponse<List<User>> pageList(Integer page, Integer limit) {
		return userservice.pageList(page, limit);
	}
	
	@RequestMapping("/deleteById")
	@ResponseBody
	public ServerResponse deleteById(Integer id) {
		return userservice.deleteById(id);
	}
	
	@RequestMapping("/deleteAll")
	@ResponseBody
	public ServerResponse deleteAll(String ids) {
		return userservice.deleteAll(ids);
	}
	
	@RequestMapping("/getUserPage")
	public String getUserPage() {
		return "user_list";
	}
	
	@RequestMapping("/getAddpage")
	public String getAddPage() {
		return "user_add";
	}
	
	@RequestMapping("/add")
	public ServerResponse add(User user){
		return userservice.add(user);
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public ServerResponse login(String username, String password, HttpSession session) {
		ServerResponse<User> response = userservice.login(username, password);
		if (response.isSuccess()) {
			User user = response.getData();
			if (user.getRole() == Const.Role.ROLE_ADMIN) {
				//说明登录的确实是管理员
				session.setAttribute(Const.CURRENT_USER, user);
				return response;
			} else {
				return ServerResponse.createError("不是管理员，无法登录");
			}
		}
		return response;
	}
	@RequestMapping("/getEditPage")
	public String getEditPage(Integer id, Model model) {
		User user = userservice.selectByPrimaryKey(id);
		model.addAttribute("user", user);

		return "user_edit";
	}

	@RequestMapping("/update")
	@ResponseBody
	public ServerResponse update(User user) {
		return userservice.update(user);
	}
}
