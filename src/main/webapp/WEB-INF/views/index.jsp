<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>银行管理系统</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
            http://localhost:3306/crud
     -->
    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        .col-center-block {
            float: none;
            display: inline-block;
            vertical-align: middle;
        }
        .left-component{
            background-color: #dedef8;
            box-shadow: inset 1px -0.1px 1px darkgray, inset -0.1px 1px 1px darkgray;
        }
        .logo{
            color: black;
            font-size: 25px;
        }


    </style>
</head>
<body>
    <!-- 搭建显示页面 -->
    <div class="container-fluid ">
        <!-- 标题 -->
        <div class="row" style="background-color: #2b669a ;color: white;">
            <div class="col-center-block" style="font-size:33px">
                <span>&nbsp;&nbsp;银行管理系统</span>
            </div>
            <div class="col-center-block" style = "position:absolute;right:0">
                <button type="button" class="btn btn-info btn-lg">
                    <span class="glyphicon glyphicon-user"></span>
                    <a href="">${sessionScope.login }</a>
                </button>
                <button type="button" class="btn btn-warning btn-lg">
                    <span class="glyphicon glyphicon-off"></span>
                    <a href="${APP_PATH }/logout">退出</a>
                </button>
            </div>
        </div>
        <div class="row left-component" style="height: 100%">
            <div class="col-md-2">
                <div class="row">
                    <div  class="col-md-12 left-component" style="line-height: 400%;">
                        <a class=" logo " href="${APP_PATH}">
                            &nbsp;<span class="glyphicon glyphicon-home"></span>
                            首页
                        </a>
                    </div>

                    <div  class="col-md-12 left-component" style="line-height: 350%">
                        <div>
                            <a class=" logo " href="${APP_PATH}/custManage">
                                &nbsp;<span class="glyphicon glyphicon-user"></span>
                                客户管理
                            </a>
                        </div>
                        <div>
                            <a class=" logo " href="${APP_PATH}/addCustomer">
                                &nbsp;<span class="glyphicon glyphicon-user"></span>
                                客户录入
                            </a>
                        </div>

                    </div>
                    <div  class="col-md-12 left-component" style="line-height: 400%">
                        <div>
                            <a class=" logo " href="${APP_PATH}/cardManage">
                                &nbsp;<span class="glyphicon glyphicon-th-large"></span>
                                银行卡管理
                            </a>
                        </div>
                        <div>
                            <a class=" logo " href="${APP_PATH}/deposit">
                                &nbsp;<span class="glyphicon glyphicon-th-large"></span>
                                存款
                            </a>
                        </div>
                        <div>
                            <a class=" logo " href="${APP_PATH}/withdraw">
                                &nbsp;<span class="glyphicon glyphicon-th-large"></span>
                                取款
                            </a>
                        </div>
                        <div>
                            <a class=" logo " href="${APP_PATH}/transation">
                                &nbsp;<span class="glyphicon glyphicon-th-large"></span>
                                转账
                            </a>
                        </div>
                    </div>
                    <div  class="col-md-12 left-component" style="line-height: 400%;">
                        <div>
                            <a class=" logo " href="${APP_PATH}/depositRecord">
                                &nbsp;<span class="glyphicon glyphicon glyphicon-th"></span>
                                存款记录
                            </a>
                        </div>
                        <div>
                            <a class=" logo " href="${APP_PATH}/withdrawDecord">
                                &nbsp;<span class="glyphicon glyphicon glyphicon-th"></span>
                                取款记录
                            </a>
                        </div>
                        <div>
                            <a class=" logo " href="${APP_PATH}/transationRecord">
                                &nbsp;<span class="glyphicon glyphicon glyphicon-th"></span>
                                转账记录
                            </a>
                        </div>
                    </div>
                    <div  class="col-md-12 left-component" style="line-height: 400%;height: 146px">
                    </div>
                </div>


            </div>

            <div class="col-md-10">
                <div class="row">
                    <div  class="col-md-12 left-component" style="line-height: 400%;">
                        <div style="color: #999999;font-size: 25px">
                            <a href="${APP_PATH}">
                                银行管理系统
                            </a>
                        </div>

                    </div>
                </div>
                <div class="row " style="text-align: center;background-color: lightgray;">
                    <div  class="col-md-12 " >
                        <div style="color: black;font-size: 100px;line-height: 500%;height: 650px">
                            <p>
                                欢迎来到银行管理系统
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>



</body>
</html>