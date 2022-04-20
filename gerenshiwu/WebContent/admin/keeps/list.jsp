<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/admin/header.jsp"></jsp:include>  
  <div class="content-wrapper">
        <!--内容-->
        <section class="content-header">
            <h1>个人记账理财列表</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>个人管理</a></li>
                <li class="active">理财列表</li>
            </ol>
        </section>
        <section class="content" id="showcontent">
      
            <div class="row">
                <div class="col-md-12">
            
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">我的理财信息列表</h3>
                              <div class="input-group input-group-sm pull-right" style="width: 150px;">
                                  <a href="${pageContext.request.contextPath }/admin/keeps/add.jsp"><button class="btn btn-success">添加理财信息</button></a>
                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table id="example1" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>类型</th>
                                    <th>标题</th>
                                    <th>金额</th>
                                    <th>日期</th>
                                    <th>操作</th>
                                </tr>
                             </thead>
                             <tbody>
   								<c:forEach items="${keeps}" var="keep" varStatus="vs">
	                                <tr>
	                                    <td>${vs.count }</td>
	                                    <td>${keep.type }</td>
	                                    <td>${keep.title }</td>
	                                    <td>${keep.money }元</td>
	                                    <td>${keep.addtime }</td>
	                                  
	                                    <td>
	                                        <a href="javascript:void(0)" onclick="del(${keep.id})"  class="label label-danger">删除</a>
	                                        <a href="${pageContext.request.contextPath}/keep?method=edit&id=${keep.id}" class="label label-primary">编辑</a>
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
    //删除提问的方法
    function del(id) {
        if(confirm('确定删除此个人理财信息吗？')){
        $.post('${pageContext.request.contextPath}/keep',{id:id,method:"del"},function(data){
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