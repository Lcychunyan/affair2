package com.lcy.web.servlet;

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

import com.lcy.domain.Admin;
import com.lcy.domain.Book;
import com.lcy.domain.User;
import com.lcy.utils.DataSourceUtils;

import net.sf.json.JSONObject;

//个人通讯录相关的功能实现
public class BookServlet extends BaseServlet {
	
		//删除通讯录的联系信息
		public void del(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
			//通讯录联系获取要删除的信息的id
			response.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "DELETE  FROM books WHERE id=?";
			runner.update(sql,id);
			//删除成功返回提示信息
			JSONObject jsonObject=new JSONObject() ;
			jsonObject.put("result",1 );
			jsonObject.put("message","删除成功！");
			System.out.print(jsonObject.toString());
			response.getWriter().write(jsonObject.toString());
		}
		
		//获取个人通讯录联系列表页面
		public void getAdminList(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			
			String sql = "select * from books WHERE user_id = ? ORDER BY id DESC";
			List<Book> books = runner.query(sql,new BeanListHandler<Book>(Book.class),user.getId());
			
			request.setAttribute("books",books);
			request.getRequestDispatcher("admin/book/list.jsp").forward(request,response);
		}
		
		//编辑通讯录页面
		public void edit(HttpServletRequest request,HttpServletResponse response) throws SQLException, ServletException, IOException {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String id = request.getParameter("id");
			
			String sql = "select * from books WHERE id = ? ORDER BY id DESC";
			Book book = runner.query(sql, new BeanHandler<Book>(Book.class),id);
			
			request.setAttribute("book",book);
			request.getRequestDispatcher("admin/book/edit.jsp").forward(request,response);
		}
}