<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/admin/header.jsp"></jsp:include>  


<div class="content-wrapper">
        <!--内容-->
        <section class="content-header">
            <h1>个人通信录管理</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>通讯录管理</a></li>
                <li class="active">通讯录列表</li>
            </ol>
        </section>
        <section class="content" id="showcontent">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">我的通讯录列表</h3>
                            <div class="input-group input-group-sm pull-right" style="width: 150px;">
                                  <a href="${pageContext.request.contextPath }/admin/book/add.jsp"><button class="btn btn-success">添加通讯录</button></a>
                            </div>
                        </div>
                        <div class="box-body">
                            <table id="example1" class="table table-hover">
                            <thead>
                                 <tr>
                                    <th>编号</th>
                                    <th>姓名</th>
                                    <th>关系</th>
					                <th>头像</th>
					                <th>手机号</th>
					                <th>邮箱</th>
					                <th>地址</th>
					                <th>操作</th>
                                </tr>
                                <thead>
                                 <tbody>
								<c:forEach items="${books}" var="book" varStatus="vs">
                                <tr>
                                    <td>${vs.count}</td>
                                    <td>${book.name }</td>
                                    <td>${book.relation }</td>
                                    <td><img src="${pageContext.request.contextPath}/${book.img}" width="120px" height="100px"></td>
                                    <td>${book.phone }</td>
                                    <td>${book.email }</td>
                                    <td>${book.address }</td>
					                <td>
					                	<a href="javascript:void(0)" onclick="del(${book.id})">删除</a>
					                	<a href="${pageContext.request.contextPath}/book?method=edit&id=${book.id}">编辑</a>
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
    </div>
<script>
  //删除操作的方法
  function del(id) {
    if(confirm('确定删除此通讯录人员信息吗？')){
      $.post('${pageContext.request.contextPath }/book',{id:id,method:"del"},function(data){
          if(data.result == 1) {
            alert(data.message);
            window.location.reload();
          }
          if(data.result == 0){
            alert(data.message);
          }
      },'json');
    }else{
      return false;
    }
  }
</script>
<jsp:include page="/admin/footer.jsp"></jsp:include>  