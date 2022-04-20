<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/admin/header.jsp"></jsp:include> 


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wangEditor/dist/css/wangEditor.min.css">  
<div class="content-wrapper">
        <!--内容-->
        <section class="content-header">
            <h1>我的个人信息</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>个人管理</a></li>
                <li class="active">个人信息</li>
            </ol>
        </section>
        <section class="content" id="showcontent">
            <div class="row">
                <div class="col-md-6 col-md-offset-2">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">我的个人信息管理</h3>
                        </div>
                        <form role="form" action="${pageContext.request.contextPath}/updateUser" method="post" enctype="multipart/form-data">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="input_title">我的姓名</label>
                                    <input type="text" class="form-control" required name="relname" value="${user.relname }" placeholder="请输入我的姓名">
                                </div>
                                <div class="form-group">
                                    <label for="input_title">手机号</label>
                                    <input type="text" class="form-control" id="phone" required name="phone" value="${user.phone }" placeholder="请输入我的手机号">
                                </div>
                                 <div class="form-group">
                                    <label for="input_title">邮箱</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${user.email }" placeholder="请输入我的邮箱">
                                </div>
                                <div class="form-group">
                                    <label for="input_title">我的地址</label>
                                    <input type="text" class="form-control" id="address" name="address" value="${user.address }" placeholder="请输入我的地址">
                                </div>
                                 <div class="form-group">
                                    <label for="input_title">我的qq</label>
                                    <input type="text" class="form-control" id="qq" name="qq" value="${user.qq }" placeholder="请输入我的qq">
                                </div>
                                 <div class="form-group">
                                    <label for="input_title">我的微信</label>
                                    <input type="text" class="form-control" id="wechat" name="wechat" value="${user.wechat }" placeholder="请输入我的微信">
                                </div>
                                 <div class="form-group">
                                    <label for="input_title">出生日期</label>
                                    <input type="text" class="form-control" id="birth" name="birth" value="${user.birth }" placeholder="请输入我的出生日期">
                                </div>
                                <div class="form-group">
                                    <label for="input_title">身份证号码</label>
                                    <input type="text" class="form-control" id="idcard" name="idcard" value="${user.idcard }" placeholder="请输入我的身份证号码">
                                </div>
                        
                                <div class="form-group">
                                    <label for="logo">我的照片</label>
                                    <input type="file" id="img" name="img">   
                                    <img src="${pageContext.request.contextPath}/${user.img}" style="width:150px">
                                    
                                    
                                </div> 
                                
                                
                                   
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">修改</button>
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
