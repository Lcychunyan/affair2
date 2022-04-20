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

import com.shequ.domain.Admin;
import com.shequ.domain.Dothing;
import com.shequ.domain.Question;
import com.shequ.domain.User;
import com.shequ.utils.DataSourceUtils;

import net.sf.json.JSONObject;


//事物登记提醒相关功能
public class DothingServlet extends BaseServlet {
	
		//用户在线发布事物登记信息
		public void post(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			
			String title = request.getParameter("title");
			String description = request.getParameter("description");
			String dotime = request.getParameter("dotime");
		
			String sql = "INSERT INTO dothings (user_id,title,description,dotime,status) VALUES(?,?,?,?,?)";
			runner.update(sql,user.getId(),title,description,dotime,0);
			
			String a = URLEncoder.encode("个人事物登记发布成功", "UTF-8");
			response.getWriter().write("<script>alert(decodeURIComponent('"+a+"'));window.location.href='dothing?method=list';</script>");
			
		}
		
		//删除事物登记
		public void del(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException {
			//管理员获取要删除的信息的id
			response.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "DELETE  FROM dothings WHERE id=?";
			runner.update(sql,id);
			//删除成功返回提示信息
			JSONObject jsonObject=new JSONObject() ;
			jsonObject.put("result",1 );
			jsonObject.put("message","删除成功！");
			System.out.print(jsonObject.toString());
			response.getWriter().write(jsonObject.toString());
		}
		
		//用户查看自己的个人事项列表
		public void list(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
			
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			
			String sql = "SELECT * FROM dothings ORDER BY id DESC";
			List<Dothing> dothings = runner.query(sql,new BeanListHandler<Dothing>(Dothing.class));
			
			request.setAttribute("dothings",dothings);
			request.getRequestDispatcher("/admin/dothings/list.jsp").forward(request,response);
		}
		
		//用户确定已经完成个人事项
		public void complete(HttpServletRequest request,HttpServletResponse response) throws SQLException, ServletException, IOException {
			//获取要完成的个人事项
			response.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "UPDATE dothings SET status=1 WHERE id=?";
			runner.update(sql,id);
			//删除成功返回提示信息
			JSONObject jsonObject=new JSONObject() ;
			jsonObject.put("result",1 );
			jsonObject.put("message","个人事项已经完成！");
			System.out.print(jsonObject.toString());
			response.getWriter().write(jsonObject.toString());
		}
		
		
		
	
}