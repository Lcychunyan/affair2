<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp"></jsp:include>
<div class="container" style="margin-top: 5%;margin-bottom: 10%">
    <div class="row">
       
        <div class="col-md-6 col-md-offset-3">
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-log-in"></span>&nbsp;用户登录</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="${pageContext.request.contextPath }/user" method="post">
                     	<input type="hidden" name="method" value="login">
                        <fieldset>
                        	<p class="text-red">${requestScope.success_msg }</p>
                        	<p class="text-red">${requestScope.error_msg }</p>
                            <div class="form-group">
                                <label for="input_contact"><span class="glyphicon glyphicon-phone"></span>&nbsp;手机号</label>
                                <input id="phone" class="form-control input-lg" placeholder="请输入用户名" name="phone" type="text" autofocus>
                                <p class="text-red">${requestScope.name_msg }</p>
                            </div>
                            <div class="col-md-12" id="error_contact"></div>
                            <div class="form-group">
                                <label for="input_password"><span class="glyphicon glyphicon-lock"></span>&nbsp;密码</label>
                                <input id="password" class="form-control input-lg" placeholder="请输入密码" name="password" type="password" value="">
                                <p class="text-red">${requestScope.phone_msg }</p>
                            </div>
                            <button type="submit" class="btn btn-lg btn-success btn-block">登录</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/footer.jsp"></jsp:include>