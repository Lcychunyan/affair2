<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/header.jsp"></jsp:include>
<div class="container" style="margin-top: 2%;margin-bottom: 2%">
    <div class="row">
       
        <div class="col-md-6 col-md-offset-3">
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-log-in"></span>&nbsp;用户信息注册</h3>
                </div>
                <div class="panel-body">
                    <form id="vform" role="form" action="${pageContext.request.contextPath}/user" method="post">
                    <input type="hidden" name="method" value="register" >
                        <fieldset>
                            <div class="form-group">
                                <label for="input_contact"><span class="glyphicon glyphicon-phone"></span>&nbsp;用户名</label>
                                
                                <input  class="form-control input-lg" name="name" id="name"  placeholder="请输入用户名" type="text">
                            </div>
                            <div class="form-group">
                                <label for="input_contact"><span class="glyphicon glyphicon-phone"></span>&nbsp;登录密码</label>
                                <input  class="form-control input-lg" name="password" id="password"  placeholder="请输入登录系统密码" type="password">
                            </div>
                            
                            <div class="form-group">
                                <label for="input_contact"><span class="glyphicon glyphicon-phone"></span>&nbsp;手机号</label>
                                <input  class="form-control input-lg" placeholder="请输入你的手机号" id="phone" name="phone" type="text">
                               <p style="color:red">${requestScope.phone_msg}</p>
                            </div>
                            <div class="form-group">
                                <label for="input_password"><span class="glyphicon glyphicon-lock"></span>&nbsp;邮箱</label>
                                <input class="form-control input-lg" placeholder="请输入邮箱" name="email" id="email" type="email">
                                <p style="color:red">${requestScope.email_msg}</p>
                            
                            </div>
                            <div class="col-md-12" id="error_password"></div>
                            <button type="submit"  class="btn btn-lg btn-success btn-block">注册</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/footer.jsp"></jsp:include> 
<script>
$(document).ready(function () {
	
	$("#vform").validate({
	    rules:{
	        name:"required",
	        password:"required",
	       
	        phone:"required",
	       
	        email:"required",
	    },
	    messages:{
	    	name:"姓名不能为空",
	    	password:"密码不能为空",
	    	
	    	phone:"手机号不能为空",
	    	
	    	email:"邮箱不能为空",
	    	
	    }
	});
});
</script> 



