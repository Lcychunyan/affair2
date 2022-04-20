<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人事物管理系统</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin/base/images/logo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/fonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/dist/css/skins/_all-skins.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/plugins/datepicker/datepicker3.css">
    <script src="${pageContext.request.contextPath}/resources/admin/plugins/jQuery/jQuery-2.2.0.min.js"></script>
    <style>
        *{
            font-family:"Microsoft YaHei";
        }
        .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
            vertical-align:middle;
            text-align:center;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <header class="main-header">
        <a href="${pageContext.request.contextPath}/" class="logo">
            <span class="logo-mini"></span>
            <span class="logo-lg">个人事物管理系统</span>
        </a>
        <nav class="navbar navbar-static-top">
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">下拉菜单</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${pageContext.request.contextPath}/resources/home/img/user.png"
                                 class="user-image" alt="User Image">
                           
                            <span class="hidden-xs"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <img src="${pageContext.request.contextPath}/resources/home/img/user.png"
                                     class="img-circle" alt="User Image">
                                <p>
                                    ${user.name }
                                    <small></small>
                                </p>
                            </li>
                            <li class="user-footer">
                                
                                <div class="pull-right">
                                    <a href="${pageContext.request.contextPath}/user?method=logout" class="btn btn-default btn-flat">退出系统</a>
                                </div>
                            </li>
                             
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <aside class="main-sidebar">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${pageContext.request.contextPath}/${user.img}" class="img-circle"
                         alt="User Image" style="width:60px;height:40px">
                </div>
                <div class="pull-left info">
                    
                    <p>${user.name }</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>
       
            <ul class="sidebar-menu">
                <li class="header">管理菜单</li>
                <li>
                     <a href="${pageContext.request.contextPath}/book?method=getAdminList">
                         <i class="fa fa-user"></i>个人通讯联络
                     </a>
                </li>
                
                <li>
                    <a href="${pageContext.request.contextPath}/dothing?method=list">
                        <i class="fa fa-bell"></i>事物登记提醒
                    </a>
                </li>
                 <li>
                    <a href="${pageContext.request.contextPath}/keep?method=getAdminList">
                        <i class="fa fa-rmb"></i>个人记账理财
                    </a>
                </li>
               
                <li>
                    <a href="${pageContext.request.contextPath}/image?method=getAdminList">
                        <i class="fa fa-file-image-o"></i>个人照片查看
                    </a>
                </li>
                <li>
                     <a href="${pageContext.request.contextPath}/user?method=profile">
                         <i class="fa fa-drivers-license-o"></i>个人资料修改 
                     </a>
                </li>
                <li>
                     <a href="${pageContext.request.contextPath}/admin/password.jsp">
                         <i class="fa fa-lock"></i>我的密码修改 
                     </a>
                </li>
                <li>
                     <a href="${pageContext.request.contextPath}/user?method=logout">
                         <i class="fa fa-mail-forward "></i>退出系统
                     </a>
                </li>
            </ul>
        </section>
    </aside>