<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/admin/header.jsp"></jsp:include> 


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wangEditor/dist/css/wangEditor.min.css">  
<div class="content-wrapper">
        <!--内容-->
        <section class="content-header">
            <h1>通讯录编辑</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 通讯录编辑</a></li>
                <li class="active">通讯录编辑</li>
            </ol>
        </section>
        <section class="content" id="showcontent">
            <div class="row">
                <div class="col-md-6 col-md-offset-2">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">通讯录联系人员编辑</h3>
                        </div>
                        <form role="form" action="${pageContext.request.contextPath}/editBook" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${book.id }" />
                            <div class="box-body">
 			
                                <div class="form-group">
                                    <label for="input_title">联系人员姓名</label>
                                    <input type="text" class="form-control" value="${book.name}" required name="name" placeholder="请输入联系人员姓名！">
                                </div>
                                  <div class="form-group">
                                    <label for="input_title">与联系人关系</label>
                                    <input type="text" class="form-control" value="${book.relation}" required name="relation" placeholder="请输入你与联系人关系">
                                </div>
                                <div class="form-group">
                                    <label for="input_title">手机号</label>
                                    <input type="text" class="form-control" value="${book.phone}" id="phone" required name="phone" placeholder="请输入联系人员手机号">
                                </div>
                                 <div class="form-group">
                                    <label for="input_title">邮箱</label>
                                    <input type="email" class="form-control" id="email" value="${book.email}" required name="email" placeholder="请输入联系人员邮箱">
                                </div>
                                <div class="form-group">
                                    <label for="input_title">联系人员地址</label>
                                    <input type="text" class="form-control" id="address" value="${book.address}" required name="address" placeholder="请输入地址">
                                </div>
                        
                                <div class="form-group">
                                    <label for="logo">联系人照片</label>
                                    <input type="file" id="img" name="img">   
                                    <img src="${pageContext.request.contextPath}/${book.img}" style="width:150px">
                                    
                                    
                                </div> 
 
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">更新</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!--内容-->
    </div>

<script src="${pageContext.request.contextPath}/resources/wangEditor/dist/js/wangEditor.min.js"></script>
<script>
      var editor = new wangEditor('textarea1');
      editor.config.menus = [
        'fontsize',
        'bold',
        'italic',
        'eraser',
        'forecolor',
        'fontfamily',
        'head',
        'orderlist',
        'alignleft',
        'aligncenter',
        'alignright',
        'emotion',
        'undo',
        'redo',
       ];
        editor.create();
  </script>

  
  
<jsp:include page="/admin/footer.jsp"></jsp:include>  
