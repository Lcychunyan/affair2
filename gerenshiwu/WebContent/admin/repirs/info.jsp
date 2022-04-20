<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wangEditor/dist/css/wangEditor.min.css">   
<jsp:include page="/admin/header.jsp"></jsp:include>  
  <div class="content-wrapper">
        <!--内容-->
        <section class="content-header">
            <h1>用户报修详情和回复</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 报修管理</a></li>
                <li class="active">报修详情</li>
            </ol>
        </section>
        <div class="col-md-6 col-md-offset-3">
            <section class="content" id="showcontent">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">报修详情和回复</h3>
                            </div>
                        		<form action="${pageContext.request.contextPath}/repir" method="post">
                        		<input type="hidden" name="id" value="${repir.id }" />
                        		<input type="hidden" name="method" value="reply" />
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="input_name">报修标题</label>
                                        <input type="text" class="form-control" value="${repir.title }">
                                    </div>
                                   
                                    <div class="form-group">
                                        <label for="input_name">报修详情</label>
                                        <textarea  style="height:300px" class="form-control">${repir.content }</textarea>
                                    </div>
                                     <div class="form-group">
                                        <label for="input_name">回复报修</label>
                                        <textarea name="reply" style="height:300px" class="form-control">${repir.reply }</textarea>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button type="submit" class="btn btn-primary">回复</button>
                                </div>
                                </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!--内容-->
    </div>
    

<jsp:include page="/admin/footer.jsp"></jsp:include>  

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

 