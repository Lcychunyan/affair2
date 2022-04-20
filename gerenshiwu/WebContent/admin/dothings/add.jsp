<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/admin/header.jsp"></jsp:include> 


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wangEditor/dist/css/wangEditor.min.css">  
<div class="content-wrapper">
        <!--内容-->
        <section class="content-header">
            <h1>我的个人事项添加</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 事项添加</a></li>
                <li class="active">事项添加</li>
            </ol>
        </section>
        <section class="content" id="showcontent">
            <div class="row">
                <div class="col-md-6 col-md-offset-2">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">我的个人事项添加</h3>
                        </div>
                        <form role="form" action="${pageContext.request.contextPath}/dothing" method="post">
                        	<input type="hidden" name="method" value="post" />
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="input_title">事项标题</label>
                                    <input type="text" class="form-control" id="name" required name="title" placeholder="请输入个人事项的标题">
                                </div>
                                
                                 <div class="form-group">
                                    <label for="input_title">完成时间</label>
                                    <input type="datetime-local" class="form-control" required name="dotime" placeholder="请输入完成的时间">
                                </div>
                              
                                <div class="form-group">
                                    <label for="input_title">事项说明</label>
                                    <textarea name="description" class="form-control" required  cols="30" rows="10" placeholder="请输入事项的说明"></textarea>
                                </div>                    
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">添加</button>
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
