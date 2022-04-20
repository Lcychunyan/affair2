package com.shequ.web.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.shequ.domain.Admin;
import com.shequ.utils.DataSourceUtils;

import net.sf.json.JSONObject;

//通讯录联系的相关功能
public class AdminServlet extends BaseServlet {

	public void adminlogin(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		

		if(password.equals("") || password == null){
			request.setAttribute("password_msg","请输入密码");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		if(name.equals("") || name == null){
			request.setAttribute("name_msg","请输入通讯录联系用户名");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from admins where name=? and password=?";
		Admin admin = runner.query(sql,new BeanHandler<Admin>(Admin.class),name,password);
		
		if(admin!=null){
			HttpSession session = request.getSession();
			//保存user对象到session中
			session.setAttribute("admin",admin);
			//提示登录成功，跳转到首页
			
			String a = URLEncoder.encode("通讯录联系登录成功", "UTF-8");
			response.getWriter().write("<script>alert(decodeURIComponent('"+a+"'));window.location.href='admin/index.jsp'</script>");
		}else{
			request.setAttribute("error_msg", "抱歉，账号和密码不匹配");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	
	//通讯录联系退出登录
	public void adminLogout(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		HttpSession session = request.getSession();
		//从session中将user删除
		session.removeAttribute("admin");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		
	}
	
	//删除
	public void del(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		//通讯录联系获取要删除的信息的id
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "DELETE  FROM admins WHERE id=?";
		runner.update(sql,id);
		//删除成功返回提示信息
		JSONObject jsonObject=new JSONObject() ;
		jsonObject.put("result",1 );
		jsonObject.put("message","删除成功！");
		System.out.print(jsonObject.toString());
		response.getWriter().write(jsonObject.toString());
	}
	
	//获取通讯录联系列表页面
	public void getAdminList(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from admins ORDER BY id DESC";
		List<Admin> admins = runner.query(sql,new BeanListHandler<Admin>(Admin.class));
		
		request.setAttribute("admins", admins);
		request.getRequestDispatcher("admin/admins/list.jsp").forward(request,response);
	}
	
	//通讯录联系添加页面
	public void addAdmin(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		//获取通讯录联系用户名
		String name = request.getParameter("name");
		//获取通讯录联系密码
		String password = request.getParameter("password");
		//获取确定密码
		String password_o = request.getParameter("password_o");
		
		//判断用户有没有输入用户名
		if(name == null || name.equals("")){
			request.setAttribute("name_msg", "请输入通讯录联系用户名");
			request.getRequestDispatcher("/admin/admins/add.jsp").forward(request,response);
		}
	
		//判断用户有没有输入密码
		if(password == null || password.equals("")){
			request.setAttribute("password_msg", "请输入密码");
			request.getRequestDispatcher("/admin/admins/add.jsp").forward(request, response);
		}
		
		//判断两次密码输入是否一致
		if(!password.equals(password_o)){
			request.setAttribute("password_o_msg", "抱歉，两次输入的密码不一致");
			request.getRequestDispatcher("/admin/admins/add.jsp").forward(request, response);
		}
		
		//保存时间
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String addtime = format.format(new Date());
		
		//保存通讯录联系的信息到数据库中
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		
		String sql = "INSERT INTO admins (name,password,addtime) value (?,?,?)";
	    runner.update(sql,name,password,addtime);
	    //更新成功，跳转到通讯录联系列表页面
	    response.sendRedirect(request.getContextPath()+"/user?method=getUserList");
		
	}
}
