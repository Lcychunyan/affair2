package com.lcy.web.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.lcy.domain.User;
import com.lcy.utils.DataSourceUtils;

//更新个人信息信息的实现
public class UpdateUserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user= new User();
		HttpSession session = request.getSession();
		User user1 = (User)session.getAttribute("user");
		//获取到的数据封装进实体中
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			
			//创建个临时目录
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			List<FileItem> parseRequest;
			
			parseRequest = upload.parseRequest(request);
			
			for(FileItem item : parseRequest) {
				boolean formField = item.isFormField();
				if(formField){
					//普通表单项
					String fieldName = item.getFieldName();
					String fieldValue = item.getString("UTF-8");
					map.put(fieldName,fieldValue);
				}else{
					//文件上传项，获取文件名称和获取文件内容
					String fileName = item.getName();
					if(fileName==null||"".equals(fileName.trim())){
	                        continue;
					}
					String path = this.getServletContext().getRealPath("upload");
					InputStream in = item.getInputStream();
					OutputStream out = new FileOutputStream(path+"/"+fileName);
					IOUtils.copy(in, out);
					in.close();
					out.close();
					item.delete();
					//判断上传的图片
					map.put("img", "upload/"+fileName);
				}
			}
				BeanUtils.populate(user, map);
				//修改个人信息
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
				boolean contains = map.containsKey("img");
				if(contains){
					String sql = "update users set relname=?,phone=?,email=?,idcard=?,sex=?,address=?,img=?,qq=?,birth=?,wechat=? WHERE id=?";
					runner.update(sql,user.getRelname(),user.getPhone(),user.getEmail(),user.getIdcard(),user.getSex(),user.getAddress(),user.getImg(),user.getQq(),user.getBirth(),user.getWechat(),user1.getId());
				}else{
					String sql = "update users set relname=?,phone=?,email=?,idcard=?,sex=?,address=?,qq=?,birth=?,wechat=? WHERE id=?";
					runner.update(sql,user.getRelname(),user.getPhone(),user.getEmail(),user.getIdcard(),user.getSex(),user.getAddress(),user.getQq(),user.getBirth(),user.getWechat(),user1.getId());
				}
				String a = URLEncoder.encode("个人信息更新成功", "UTF-8");
				response.getWriter().write("<script>alert(decodeURIComponent('"+a+"'));window.location.href='user?method=profile'</script>");
				
			} catch (FileUploadException | IllegalAccessException | InvocationTargetException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}