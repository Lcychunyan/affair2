package com.lcy.dao;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.taglibs.standard.tag.common.sql.DataSourceUtil;

import com.lcy.domain.User;
import com.lcy.utils.DataSourceUtils;

public class UserDao {

	public Long checkUsername(String email) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from users where uemail=?";
		Long query = (Long)runner.query(sql,new ScalarHandler(),email);
		return query;
	}

	public User login(String email, String password) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from users where uemail=? and upassword=?";
		return runner.query(sql,new BeanHandler<User>(User.class),email,password);
				
	}

	public User adminLogin(String name, String password) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from users where name=? and password=?";
		return runner.query(sql,new BeanHandler<User>(User.class),name,password);
	}

}
