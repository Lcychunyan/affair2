<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/admin/header.jsp"></jsp:include>  
  <div class="content-wrapper">
        <!--内容-->
        <section class="content-header">
            <h1>业主报修信息管理</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 报修管理</a></li>
                <li class="active">报修列表</li>
            </ol>
        </section>
        <section class="content" id="showcontent">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">报修列表</h3>
                           
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table id="example1" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>报修业主</th>
                                    <th>业主电话</th>
                                    <th>报修物品</th>
                                    <th>报修地点</th>
                                    <th>是否回复</th>
                                    <th>报修状态</th>
                                    <th>报修时间</th>
                                    <th>操作</th>
                                </tr>
                             </thead>
                             <tbody>
   								<c:forEach items="${repirs}" var="repir" varStatus="vs">
	                                <tr>
	                                    <td>${vs.count }</td>
	                                    <td>${repir.name }</td>
	                                    <td>${repir.phone }</td>
	                                    <td>${repir.product }</td>
	                                    <td>${repir.site }</td>
	                                    <td>${empty repir.reply?"未回复":"已回复" }</td>
	                                   
	                                    <td>
					                      	<c:if test="${repir.status==0 }">
					                   			<span class="label label-primary">未审核</span>
					                      	</c:if>
					                        <c:if test="${repir.status==1 }">
					                   			<span class="label label-success">已通过</span>
					                      	</c:if>
					                      	 <c:if test="${repir.status==2 }">
					                   			<span class="label label-danger">已禁止</span>
					                      	</c:if>
					                    </td>
					                    <td>${repir.addtime }</td>
	                                    <td>
	                                        <a href="javascript:void(0)" onclick="del(${repir.id})"  class="label label-danger">删除</a>
	                                        <a href="${pageContext.request.contextPath}/repir?method=info&id=${repir.id}"  class="label label-primary">详情</a>
	                                        <a href="javascript:void(0)" onclick="allow(${repir.id})"  class="label label-success">通过</a>
	                                        <a href="javascript:void(0)" onclick="ban(${repir.id})"  class="label label-warning">禁止</a>
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
    //删除报修的方法
    function del(id) {
        if(confirm('确定删除此用户报修信息吗？')){
        $.post('${pageContext.request.contextPath}/repir',{id:id,method:"del"},function(data){
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
    
    function allow(id) {
        if(confirm('确定通过此用户报修申请信息吗？')){
        $.post('${pageContext.request.contextPath}/repir',{id:id,method:"allow"},function(data){
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
    
    function ban(id) {
        if(confirm('确定禁止此用户报修申请信息吗？')){
        $.post('${pageContext.request.contextPath}/repir',{id:id,method:"ban"},function(data){
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