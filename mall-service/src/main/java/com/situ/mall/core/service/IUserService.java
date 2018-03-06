package com.situ.mall.core.service;

import java.util.List;

import com.situ.mall.common.response.ServerResponse;
import com.situ.mall.core.entity.Product;
import com.situ.mall.core.entity.User;

public interface IUserService {

	ServerResponse<User> login(String username, String password);

	ServerResponse<List<User>> pageList(Integer page, Integer limit);

	ServerResponse deleteById(Integer id);

	ServerResponse deleteAll(String ids);

	ServerResponse add(User user);

	ServerResponse update(User user);

	User selectByPrimaryKey(Integer id);



	

}
