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
                    <input type="text" placeholder="请输入银行卡号码" name="cardid" id="inputcardnum">
                    <span id="msg" style="color: red"></span>
                    <button class="btn btn-success searcher">
                        查询
                    </button>



                </div>
                <div class="row" style="text-align: center">
                    <h1>银行卡详细信息</h1>
                </div>
                <div class="row " style="background-color: white;width: 100%">
                    <div  class="col-md-12 " >
                        <table class="table table-bordered table-striped table-hover" hidden="hidden">

                            <tr>
                                <th width="150">卡号：</th>
                                <td id="cardnumtd"></td>
                            </tr>
                            <tr>
                                <th>卡主姓名：</th>
                                <td id="customernametd"></td>
                            </tr>
                            <tr>
                                <th>卡主身份证号码：</th>
                                <td id="idnumbertd"></td>
                            </tr>
                            <tr>
                                <th>账户余额：</th>
                                <td id="balancetd"></td>
                            </tr>

                        </table>

                    </div>
                    <div hidden="" id="btngroup">
                        <a class="btn btn-info apply" style="margin: 5px" id="deposit">存款</a>
                        <a class="btn btn-info apply" style="margin: 5px" id="withdraw">取款</a>
                        <a class="btn btn-info apply" style="margin: 5px" id="transation">转账</a>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <script>

        $(".searcher").click(function(){
            $.ajax({
                url:"${APP_PATH}/cardSearcher",
                type:"GET",
                data:$("#inputcardnum").serialize(),
                success:function (result){
                    if(result.code === 200 ){
                        $("table").hide();
                        $("#msg").text("查无此卡")
                        return  false;
                    }
                    $("#cardnumtd").text(result.extend.card[0].cardid);
                    $("#idnumbertd").text(result.extend.card[0].custidnum);
                    $("#balancetd").text(result.extend.card[0].balance);
                    $("#customernametd").text(result.extend.card[0].customername);
                    $("table").show();
                    $("#btngroup").show();
                }
            });
        });

        $("#inputcardnum").change(function(){
            $("#msg").empty();
            var reg = /^\d{19}$/;
            var cardid = $("#inputcardnum").val();
            if(reg.test(cardid) === false)
            {
                $("#msg").html("输入有误");
                return false;
            }
        });



        $(document).on("click","#deposit",function (){
            var cardid = $("#cardnumtd").text();
            var custidnum = $("#idnumbertd").text();
            var balance = $("#balancetd").text();
            var customername = $("#customernametd").text();
            // $(this).href("https://www.hao123.com/");
            window.location.href = "${APP_PATH}/deposit1?cardid=" + cardid +"&custidnum=" + custidnum + "&balance="
                + balance + "&customername=" + customername;
        });

        $(document).on("click","#withdraw",function (){
            var cardid = $("#cardnumtd").text();
            var custidnum = $("#idnumbertd").text();
            var balance = $("#balancetd").text();
            var customername = $("#customernametd").text();
            // $(this).href("https://www.hao123.com/");
            window.location.href = "${APP_PATH}/withdraw1?cardid=" + cardid +"&custidnum=" + custidnum + "&balance=" + balance
                + "&customername=" + customername;
        });

        $(document).on("click","#transation",function (){
            var cardid = $("#cardnumtd").text();
            var custidnum = $("#idnumbertd").text();
            var balance = $("#balancetd").text();
            var customername = $("#customernametd").text();
            // $(this).href("https://www.hao123.com/");
            window.location.href = "${APP_PATH}/transation1?cardid=" + cardid +"&custidnum=" + custidnum + "&balance=" + balance
                + "&customername=" + customername;
        });

    <%--$(document).on("click",".carddetail",function(){--%>
    <%--    var cardid = $(this).parent().prev().html();--%>
    <%--    window.location.href= "${APP_PATH}"+ cardid;--%>
    <%--});--%>
    </script>

</body>
</html>