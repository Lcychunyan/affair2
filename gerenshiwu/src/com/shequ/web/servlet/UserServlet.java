package com.shequ.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.shequ.domain.Admin;
import com.shequ.domain.User;
import com.shequ.service.UserService;
import com.shequ.utils.DataSourceUtils;

import net.sf.json.JSONObject;

public class UserServlet extends BaseServlet {	
	//用户注销
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		//从session中将user删除
		session.removeAttribute("user");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}	
	
	//用户注册功能
	public void register(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException, IllegalAccessException, InvocationTargetException{
		//获取用户注册发送过来的注册数据
		Map<String,String[]> properties = request.getParameterMap();
		User user = new User();
		BeanUtils.populate(user, properties);
		
		//判断注册的用户手机号是否已经注册过
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());	
		//保存用户注册的数据到数据库中
		String sql2 = "insert into users(name,password,email,phone) values(?,?,?,?)";
		runner.update(sql2,user.getName(),user.getPassword(),user.getEmail(),user.getPhone());
		//注册成功后，转跳到登录页面，返回提示信息
		request.setAttribute("success_msg", "注册成功，请登录");
		request.getRequestDispatcher("login.jsp").forward(request, response);
		
	}
	
	//用户登录功能
	public void login(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
	
		if(password.equals("") || password == null){
			request.setAttribute("password_msg","请输入密码");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		if(phone.equals("") || phone == null){
			request.setAttribute("phone_msg","请输入手机号");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from users where phone=? and password=?";
		User user = runner.query(sql,new BeanHandler<User>(User.class),phone,password);
		
		if(user!=null){
			HttpSession session = request.getSession();
			//保存user对象到session中
			session.setAttribute("user",user);
			//提示登录成功，跳转到首页

			String a = URLEncoder.encode("恭喜你，登录成功", "UTF-8");
			response.getWriter().write("<script>alert(decodeURIComponent('"+a+"'));window.location.href='book?method=getAdminList'</script>");
		}else{
			request.setAttribute("error_msg", "抱歉，账号和密码不匹配");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}
	
	
	
	
	//管理员修改密码
	public void editPassword(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		//获取用户的session
		HttpSession session = request.getSession();
		User user1 = (User)session.getAttribute("user");
		//获取用户的原密码
		String oldpassword = request.getParameter("oldpassword");
		//获取新密码
		String password = request.getParameter("password");
		//获取确定密码
		String repassword = request.getParameter("repassword");
		//获取管理员信息
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM users WHERE id=?";
		User user = runner.query(sql, new BeanHandler<User>(User.class),user1.getId());
		//判断原密码是否正确
		if(!oldpassword.equals(user.getPassword())) {
			request.setAttribute("oldpassword","抱歉，原密码输入错误");
			request.getRequestDispatcher("admin/users/password.jsp").forward(request,response);
		}
		
		//判断有没有输入新密码
		if(password.equals("") || password == null  ) {
			request.setAttribute("password","请输入新密码");
			request.getRequestDispatcher("admin/password.jsp").forward(request,response);
		}
		
		//判断有没有输入重复密码
		if(repassword.equals("") || repassword == null  ) {
			request.setAttribute("repassword","请输入确定密码");
			request.getRequestDispatcher("admin/password.jsp").forward(request,response);
		}
		
	
		
		//更新密码
		String sql2 = "UPDATE users set password=? WHERE id=?";
		runner.update(sql2, password,user1.getId());
		String a = URLEncoder.encode("密码更新成功！", "UTF-8"); 
		response.getWriter().print("<script>alert(decodeURIComponent('"+a+"'));window.location.href='admin/users/password.jsp'</script>");
		
	}
		
	///用户中心，修改密码
	public void changePassword(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		response.setCharacterEncoding("utf-8");
		//获取用户的原密码
		String oldpassword = request.getParameter("oldpassword");
		//获取新密码
		String password = request.getParameter("password");
		//获取确定密码
		String password_o = request.getParameter("password_o");
		
		//判断用户输入的原密码是否正确
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		JSONObject jsonObject=new JSONObject() ;
		
		//判断旧密码是否输入正确
		if(!oldpassword.equals(user.getPassword())) {
			jsonObject.put("result",0 );
			jsonObject.put("message","旧密码输入错误");
			response.getWriter().write(jsonObject.toString());
			return;
		}
				
		
		//判断有没有输入新密码
		if(password.equals("") || password == null  ) {
			jsonObject.put("result",0 );
			jsonObject.put("message","请输入新密码");
			response.getWriter().write(jsonObject.toString());
			return;
		}
		
		//判断有没有输入重复密码
		if(password_o.equals("") || password_o == null  ) {
			jsonObject.put("result",0 );
			jsonObject.put("message","请输入重复密码");
			response.getWriter().write(jsonObject.toString());
			return;
		}
		
		//判断新密码和重复密码是否一致
		if(password_o.equals(password)) {
			jsonObject.put("result",0 );
			jsonObject.put("message","两次输入的密码不一致");
			response.getWriter().write(jsonObject.toString());
			return;
		}
		
		//更新密码
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "UPDATE users set password=? WHERE id=?";
		runner.update(sql, password,user.getId());
		
	
		jsonObject.put("result",1 );
		jsonObject.put("message","success");
		response.getWriter().write(jsonObject.toString());
	}
	
	//用户查看自己的个人资料
	public void profile(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		//获取用户的session
		HttpSession session = request.getSession();
		User user1 = (User)session.getAttribute("user");

		//获取个人信息
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM users WHERE id=?";
		User user = runner.query(sql, new BeanHandler<User>(User.class),user1.getId());
		
		request.setAttribute("user",user);
		request.getRequestDispatcher("/admin/users/profile.jsp").forward(request,response);
	}
		
	
	
	

	

	
	
	
	
	
}