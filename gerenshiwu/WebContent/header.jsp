<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>个人事物管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta name="keywords" content="" />
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
	<link rel="stylesheet" href="resources/css/zui.min.css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <link  rel="stylesheet" href="resources/css/buttons.css">
    <link href="resources/css/style.css" rel='stylesheet' type='text/css' />
	
	<link href="resources/css/css_slider.css" type="text/css" rel="stylesheet" media="all">
      <script src="resources/js/jquery-1.12.4.js"></script>
</head>
<body>

<!-- header -->
<header>
    <div class="container">
        <!-- nav -->
        <nav class="py-md-4 py-3 d-lg-flex">
            <div id="logo">
                <h1 class="mt-md-0 mt-2" style="font-size:40px"> <a href="${pageContext.request.contextPath}/">个人事物管理系统</a></h1>
            </div>
            <label for="drop" class="toggle"><span class="fa fa-bars"></span></label>
            <input type="checkbox" id="drop" />
            <ul class="menu ml-auto mt-1">
            
                
	                  <li class="booking"><a href="login.jsp">登陆</a></li>
	                  <li class="nav-login"><a href="register.jsp">注册</a></li>
                  
            </ul>
        </nav>


        <!-- //nav -->
    </div>
</header>
<!-- //header -->

<section class="banner_inner" id="home">
    <div class="banner_inner_overlay">
    </div>
</section>