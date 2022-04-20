package com.shequ.web.servlet;

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
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.shequ.domain.Book;
import com.shequ.domain.Image;
import com.shequ.domain.User;
import com.shequ.utils.DataSourceUtils;

//用户编辑个人相册
public class EditImage extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Image image= new Image();
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
				BeanUtils.populate(image, map);
				
				
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
				boolean contains = map.containsKey("img");
				if(contains){
					String sql = "UPDATE images SET title=?,description=?,site=?,img=? WHERE id=?";
					runner.update(sql,image.getTitle(),image.getDescription(),image.getSite(),image.getImg(),image.getId());
				}else {
					String sql = "UPDATE images SET title=?,description=?,site=? WHERE id=?";
					runner.update(sql,image.getTitle(),image.getDescription(),image.getSite(),image.getId());
				}
				
				response.sendRedirect(request.getContextPath()+"/image?method=getAdminList");
	
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