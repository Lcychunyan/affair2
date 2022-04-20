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

import com.shequ.domain.Book;
import com.shequ.domain.Keep;
import com.shequ.domain.User;
import com.shequ.utils.DataSourceUtils;

import net.sf.json.JSONObject;

//个人记账理财的相关功能实现
public class KeepServlet extends BaseServlet {
	
	//删除个人的记账信息
	public void del(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		//通讯录联系获取要删除的信息的id
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "DELETE  FROM keeps WHERE id=?";
		runner.update(sql,id);
		//删除成功返回提示信息
		JSONObject jsonObject=new JSONObject() ;
		jsonObject.put("result",1 );
		jsonObject.put("message","删除成功！");
		System.out.print(jsonObject.toString());
		response.getWriter().write(jsonObject.toString());
	}
	
	//获取个人记账的记录
	public void getAdminList(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		String sql = "select * from keeps WHERE user_id = ? ORDER BY id DESC";
		List<Keep> keeps = runner.query(sql,new BeanListHandler<Keep>(Keep.class),user.getId());
		
		request.setAttribute("keeps",keeps);
		request.getRequestDispatcher("admin/keeps/list.jsp").forward(request,response);
	}
	
	//添加个人记账信息
	public void add(HttpServletRequest request,HttpServletResponse response) throws SQLException, ServletException, IOException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		String type = request.getParameter("type");
		String money = request.getParameter("money");
		String title = request.getParameter("title");
		String addtime = request.getParameter("addtime");
		
		String sql = "INSERT INTO keeps(user_id,type,money,title,addtime) VALUES (?,?,?,?,?)";
		runner.update(sql,user.getId(),type,money,title,addtime);
		
		String a = URLEncoder.encode("个人记账信息添加成功", "UTF-8");
		response.getWriter().write("<script>alert(decodeURIComponent('"+a+"'));window.location.href='keep?method=getAdminList';</script>");	
		
	}
	
	//编辑个人记账信息
	public void edit(HttpServletRequest request,HttpServletResponse response) throws SQLException, ServletException, IOException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String id = request.getParameter("id");
		
		String sql = "select * from keeps WHERE id = ?";
		Keep keep = runner.query(sql, new BeanHandler<Keep>(Keep.class),id);
		request.setAttribute("keep",keep);
		request.getRequestDispatcher("admin/keeps/edit.jsp").forward(request,response);
	}
	
	//更新个人记账信息
	public void update(HttpServletRequest request,HttpServletResponse response) throws SQLException, ServletException, IOException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		String type = request.getParameter("type");
		String money = request.getParameter("money");
		String title = request.getParameter("title");
		String addtime = request.getParameter("addtime");
		String id = request.getParameter("id");
		String sql = "UPDATE keeps set type=?,money=?,title=?,addtime=? WHERE id=?";
		runner.update(sql,type,money,title,addtime,id);
		
		String a = URLEncoder.encode("个人记账信息编辑成功", "UTF-8");
		response.getWriter().write("<script>alert(decodeURIComponent('"+a+"'));window.location.href='keep?method=getAdminList';</script>");	
	}
	
}