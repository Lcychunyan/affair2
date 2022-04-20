<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/admin/header.jsp"></jsp:include>  
  <div class="content-wrapper">
        <!--内容-->
        <section class="content-header">
            <h1>事项登记提醒管理</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 事项管理</a></li>
                <li class="active">事项列表</li>
            </ol>
        </section>
        <section class="content" id="showcontent">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">事项列表</h3>
                           <div class="input-group input-group-sm pull-right" style="width: 150px;">
                                  <a href="${pageContext.request.contextPath }/admin/dothings/add.jsp"><button class="btn btn-success">添加个人事项</button></a>
                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tbody>
                                <tr>
                                    <th>编号</th>
                                    <th>事项标题</th>
                                    <th>事项描述</th>
                                    <th>任务时间</th>
                                    <th>事项状态</th>
                                    <th>操作</th>
                                </tr>
                             
   								<c:forEach items="${dothings}" var="dothing" varStatus="vs">
	                                <tr>
	                                    <td>${vs.count }</td>
	                                    <td>${dothing.title }</td>
	                                    <td>${dothing.description }</td>
	                                    <td>${dothing.dotime }</td>
	                                    <td>
					                      	<c:if test="${dothing.status == 0 }">
					                   			<span class="label label-primary">未完成</span>
					                      	</c:if>
					                      	<c:if test="${dothing.status == 1}">
					                   			<span class="label label-success">已完成</span>
					                      	</c:if>
					                    </td>
	                                    <td>
	                                        <a href="javascript:void(0)" onclick="del(${dothing.id})"  class="label label-danger">删除</a>
	                                        <a href="javascript:void(0)" onclick="complete(${dothing.id})"  class="label label-primary">完成</a>
	                                    </td>
	                                </tr>
                              	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--内容-->
    </div>

<script>
    //删除投诉的方法
    function del(id) {
        if(confirm('确定删除此个人事项登记吗？')){
        $.post('${pageContext.request.contextPath}/dothing',{id:id,method:"del"},function(data){
            if(data.result == 1) {
                alert(data.message);
                window.location.reload();
            }

            if(data.result == 0) {
                alert(data.message);
            }
        },'json');
        }else{
            return false;
        }
    }
    
    
    function complete(id) {
        if(confirm('确定此个人事项已经完成？')){
        $.post('${pageContext.request.contextPath}/dothing',{id:id,method:"complete"},function(data){
            if(data.result == 1) {
                alert(data.message);
                window.location.reload();
            }

            if(data.result == 0) {
                alert(data.message);
            }
        },'json');
        }else{
            return false;
        }
    }
</script>
 
 
 
 
 
 
<jsp:include page="/admin/footer.jsp"></jsp:include>  