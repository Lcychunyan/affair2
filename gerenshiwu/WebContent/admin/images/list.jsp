<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/admin/header.jsp"></jsp:include>  
  <div class="content-wrapper">
        <!--内容-->
        <section class="content-header">
            <h1>我的个人照片</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>个人管理</a></li>
                <li class="active">照片列表</li>
            </ol>
        </section>
        <section class="content" id="showcontent">
      
            <div class="row">
                <div class="col-md-12">
            
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">我的照片列表</h3>
                              <div class="input-group input-group-sm pull-right" style="width: 150px;">
                                  <a href="${pageContext.request.contextPath }/admin/images/add.jsp"><button class="btn btn-success">上传我的个人照片</button></a>
                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table id="example1" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>标题</th>
                                    <th>照片</th>
                                    <th>描述</th>
                                    <th>地点</th>
                                    <th>日期</th>
                                    <th>操作</th>
                                </tr>
                             </thead>
                             <tbody>
   								<c:forEach items="${images}" var="image" varStatus="vs">
	                                <tr>
	                                    <td>${vs.count }</td>
	                                    <td>${image.title }</td>
	                                    <td><img src="${pageContext.request.contextPath}/${image.img}" style="width:200px"></td>
	                                    <td>${image.description }</td>
	                                    <td>${image.site }</td>
	                                    <td>${image.addtime }</td>
	                                  
	                                    <td>
	                                        <a href="javascript:void(0)" onclick="del(${image.id})"  class="label label-danger">删除</a>
	                                        <a href="${pageContext.request.contextPath}/image?method=edit&id=${image.id}" class="label label-primary">编辑</a>
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
    //删除的方法
    function del(id) {
        if(confirm('确定删除我的照片信息吗？')){
        $.post('${pageContext.request.contextPath}/image',{id:id,method:"del"},function(data){
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