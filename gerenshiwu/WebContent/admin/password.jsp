<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/admin/header.jsp"></jsp:include>    
    
    
     <div class="content-wrapper">
        <!--内容-->
        
       
            <div class="row">
                 <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="col-sm-6 col-sm-offset-3" style="margin-top: 5%">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                          		我的修改密码
                        </div>
                        <!-- /.panel-heading -->
                        <p class="text-success">${requestScope.success }</p>
                        <div class="panel-body">
                                <form role="form" action="${pageContext.request.contextPath}/user" method="post">
                                <input type="hidden" name="method" value="editPassword">
                            <div class="box-body" >
                                <div class="form-group">
                                    <label for="input_title">原密码</label>
                                    <input type="text" class="form-control"  name="oldpassword" placeholder="请输入原密码">
                                </div>
                                <p class="text-danger">${requestScope.oldpassword }</p>
                                <div class="form-group">
                               
                                  <label for="input_title">新密码</label>
                                  <input type="password" class="form-control input-2"  name="password" placeholder="请输入新密码">
                                  <p class="text-danger">${requestScope.password }</p>
                                
                                </div>
                                <div class="form-group">
                                    <label for="input_title">重复输入密码</label>
                                    <input type="password" class="form-control"  name="repassword" placeholder="请重复输入密码">
                                </div>
                                <p class="text-danger">${requestScope.repassword }</p>
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">修改</button>
                            </div>
                        </div>
                        </div>
                        </form>
                        <!-- /.panel-body -->
                    </div>
                    </div>
               
                    </div>
                </div>
            </div>
        </section>
        <!--内容-->
    </div>
      <jsp:include page="/admin/footer.jsp"></jsp:include>