package com.shequ.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.shequ.domain.Message;
import com.shequ.domain.User;
import com.shequ.utils.DataSourceUtils;


public class ProfileServlet extends BaseServlet {

	//用户的个人信息页面主页
	public void index(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		//获取用户的session
		HttpSession session = request.getSession();
		User user1 = (User)session.getAttribute("user");
		//校验用户是否登录		
		//判断用户是否已经登录，如果未登录跳转到登录页面
		if(user1==null){
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			return;
		}
		//获取个人信息
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM users WHERE id=?";
		User user = runner.query(sql, new BeanHandler<User>(User.class),user1.getId());
		
		request.setAttribute("user",user);
		request.getRequestDispatcher("profile.jsp").forward(request,response);
	}
	
	
}
