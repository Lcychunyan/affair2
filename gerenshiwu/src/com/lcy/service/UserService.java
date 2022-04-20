package com.lcy.service;

import java.sql.SQLException;

import com.lcy.dao.UserDao;
import com.lcy.domain.User;

public class UserService {

	public boolean checkUserName(String email) {
		UserDao user = new UserDao();
		Long user_exist = 0L;

		try {
			user_exist = user.checkUsername(email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user_exist>0?true:false;
	}


	public User login(String email, String password) throws SQLException {
		UserDao userDao = new UserDao();
		return userDao.login(email,password);
	}

	public User adminlogin(String name, String password) throws SQLException {
		UserDao userDao = new UserDao();
		return userDao.adminLogin(name,password);
	}

}
