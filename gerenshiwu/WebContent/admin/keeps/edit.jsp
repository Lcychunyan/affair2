<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/admin/header.jsp"></jsp:include> 


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wangEditor/dist/css/wangEditor.min.css">  
<div class="content-wrapper">
        <!--内容-->
        <section class="content-header">
            <h1>个人理财信息编辑</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 理财添加</a></li>
                <li class="active">理财登记</li>
            </ol>
        </section>
        <section class="content" id="showcontent">
            <div class="row">
                <div class="col-md-6 col-md-offset-2">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">我的理财信息编辑</h3>
                        </div>
                        <form role="form" action="${pageContext.request.contextPath}/keep" method="post">
                        	<input type="hidden" name="method" value="update" />
                        	<input type="hidden" name="id" value="${keep.id }"/>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="input_title">理财标题</label>
                                    <input type="text" class="form-control" value="${keep.title }" name="title" placeholder="请输入理财的标题" required name="title">
                                </div>
                             
                                 <div class="form-group">
                                    <label for="input_title">类型</label>
                                    <select name="type" class="form-control">
	                                    
	                                    	<option value="消费" ${keep.type=="消费"?"selected":"" }>消费</option>
	                                    	<option value="收入" ${keep.type=="收入"?"selected":"" }>收入</option>
	                                    
	                                    
                                    </select>
                                </div>
                                  <div class="form-group">
                                    <label for="input_title">金额（元）</label>
                                    <input type="number" class="form-control" value="${keep.money }" required name="money" placeholder="请输入金额">
                                </div>
                               
                                <div class="form-group">
                                    <label for="input_title">日期</label>
                                    <input type="text" class="form-control" value="${keep.addtime }" required name="addtime">
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">编辑</button>
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
