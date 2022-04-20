package com.lcy.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.lcy.domain.Image;
import com.lcy.domain.User;
import com.lcy.utils.DataSourceUtils;

import net.sf.json.JSONObject;

//个人照片管理
public class ImageServlet extends BaseServlet {
	
	//删除个人的个人照片信息
	public void del(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		//通讯录联系获取要删除的信息的id
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "DELETE  FROM images WHERE id=?";
		runner.update(sql,id);
		//删除成功返回提示信息
		JSONObject jsonObject=new JSONObject() ;
		jsonObject.put("result",1 );
		jsonObject.put("message","删除成功！");
		System.out.print(jsonObject.toString());
		response.getWriter().write(jsonObject.toString());
	}
		
	//获取个人相册的列表
	public void getAdminList(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		String sql = "select * from images WHERE user_id = ? ORDER BY id DESC";
		List<Image> images = runner.query(sql,new BeanListHandler<Image>(Image.class),user.getId());
		
		request.setAttribute("images",images);
		request.getRequestDispatcher("admin/images/list.jsp").forward(request,response);
	}
	
	
	//获取个人相册的修改页面
	public void edit(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException, IOException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String id = request.getParameter("id");
		
		String sql = "select * from images WHERE id = ?";
		Image image = runner.query(sql, new BeanHandler<Image>(Image.class),id);
		
		
		request.setAttribute("image",image);
		request.getRequestDispatcher("admin/images/edit.jsp").forward(request,response);
	}
	
}