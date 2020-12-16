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
        pageContext.setAttribute("data", request.getAttribute("data"));
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
        th,td{
            text-align: center;
            vertical-align: middle;
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

            <div class="col-md-10" style="background-color: white;height: 690px">
                <div class="row">
                    <div  class="col-md-12 left-component" style="line-height: 400%;">
                        <div style="color: #999999;font-size: 25px">
                            <a href="${APP_PATH}">
                                银行管理系统
                            </a>
                        </div>

                    </div>
                </div>
                <div class="row" style="height: 35px;background-color: #2aabd2;">
<%--                    <input type="text" placeholder="请输入身份证号码" name="idnumber" id="inputidnum">--%>
<%--                    <span id="msg"></span>--%>
<%--                    <button class="btn btn-success searcher">--%>
<%--                        查询--%>
<%--                    </button>--%>
                </div>
                <div class="row" style="text-align: center">
                    <h1>取款记录信息</h1>
                </div>
                <div class="row " style="background-color: white;width: 100%">
                    <div  class="col-md-12 " >
                        <table class="table table-bordered table-striped table-hover">

                            <tr>
                                <th>序号</th>
                                <th>卡号</th>
                                <th>操作员工编号</th>
                                <th>客户姓名</th>
                                <th>交易类型</th>
                                <th>交易金额</th>
                                <th>卡内余额</th>
                            </tr>

                            <c:forEach items="${data.list}" var="item">
                                <tr>
                                    <td>${item.id}</td>
                                    <td>${item.carid}</td>
                                    <td>${item.clerkid}</td>
                                    <td>${item.custname}</td>
                                    <td>${item.type}</td>
                                    <td>${item.amount}</td>
                                    <td>${item.balance}</td>
                                </tr>
                            </c:forEach>

                        </table>

                    </div>
                </div>

                <!-- 显示分页信息 -->
                <div class="row">
                    <!--分页文字信息  -->
                    <div class="col-md-6" id="page_info_area">
                    </div>
                    <!-- 分页条信息 -->
                    <div class="col-md-6" id="page_nav_area">

                        <nav>
                            <ul class="pagination">
                                <li id="firstPageLi"><a href="${APP_PATH}/withdrawDecord">首页</a></li>
                                <li id="prePageLi"><a href="${APP_PATH}/withdrawDecord?pn=${data.pageNum - 1}">«</a></li>
                                <li id="li1"><a href="${APP_PATH}/withdrawDecord?pn=${data.pageNum - 2}">${data.pageNum - 2} </a></li>
                                <li id="li2"><a href="${APP_PATH}/withdrawDecord?pn=${data.pageNum - 1}">${data.pageNum - 1} </a></li>
                                <li id="li3" class="active"><a>${data.pageNum}</a></li>
                                <li id="li4"><a href="${APP_PATH}/withdrawDecord?pn=${data.pageNum + 1}">${data.pageNum + 1} </a></li>
                                <li id="li5"><a href="${APP_PATH}/withdrawDecord?pn=${data.pageNum + 2}">${data.pageNum + 2 }</a></li>
                                <li id="nextPageLi"><a href="${APP_PATH}/withdrawDecord?pn=${data.pageNum + 1}">»</a></li>
                                <li id="lastPageLi"><a href="${APP_PATH}/withdrawDecord?pn=${data.pages}">末页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script>
        $(function (){
            //显示分页详细信息
            var page_info_area = "当前" + "${data.pageNum}" + "页,总" + "${data.pages}" + "页,总" + "${data.total}" + "条记录";
            $("#page_info_area").text(page_info_area);

            if("${data.hasPreviousPage}" == "false"){
                $("#firstPageLi").addClass("disabled");
                $("#prePageLi").addClass("disabled");
            }
            if("${data.hasNextPage}" == "false"){
                $("#nextPageLi").addClass("disabled");
                $("#lastPageLi").addClass("disabled");
            }


            if ("${data.pageNum}"-2<1){
                // $("#li1").hide();
                $("#li1").empty();
            }
            if ("${data.pageNum}" -1 <1){
                // $("#li2").hide();
                $("#li2").empty();
            }
            if ("${data.pageNum}"  > "${data.pages}"-1){
                // $("#li4").hide();
                $("#li4").empty();
            }
            if ("${data.pageNum}" > "${data.pages}"-2){
                // $("#li5").hide();
                $("#li5").empty();
            }



        })
    </script>

</body>
</html>