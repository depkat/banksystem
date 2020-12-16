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
        pageContext.setAttribute("custidnum", request.getParameter("custidnum"));
        pageContext.setAttribute("cardid", request.getParameter("cardid"));
        pageContext.setAttribute("balance", request.getParameter("balance"));
        pageContext.setAttribute("customername", request.getParameter("customername"));

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
        fieldset{
            background-color: #f1f1f1;
            border: none;
            border-radius: 2px;
            margin-top: 12px;
            margin-bottom: 12px;
            overflow: hidden;
            padding: 0 .625em;
        }

        label{
            cursor: pointer;
            display: inline-block;
            padding: 3px 6px;
            text-align: right;
            width: 150px;
            vertical-align: top;
        }

        input{
            font-size: inherit;
        }
        .success{
            color: #3e8f3e;
        }
        .error{
            color: red;
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
                <div style="text-align: center;line-height: 200%;height: 50px;font-size: 30px;">
                    <h1>转出方详情</h1>
                </div>
                <div class="row " style="text-align: left;background-color: lightgray;line-height: 250%">
                    <div  class="col-md-12 " >
                        <form>
                            <fieldset>
                                <p>
                                    <label for="customername">姓名:</label>
                                    <span type="text" id="customername" align="left">${customername}</span>
                                </p>
                                <p>
                                    <label for="custidnum">身份证号码:</label>
                                    <span type="text" id="custidnum" align="left">${custidnum}</span>
                                </p>
                                <p>
                                    <label for="cardid">卡号:</label>
                                    <span type="text" id="cardid" align="left">${cardid}</span>&nbsp;
                                </p>
<%--                                <p>--%>
<%--                                    <label for="amount">取出金额:</label>--%>
<%--                                    <input type="text" id="amount" name="amount" align="left">--%>
<%--                                </p>--%>
                                <p>
                                    &nbsp;
                                </p>
                                <h1 style="text-align: center">接收转账方详情</h1>
                                <p>
                                    <label for="customernameaccept">姓名:</label>
                                    <input type="text" id="customernameaccept"  name="customername"  align="left">
                                </p>
                                <p>
                                    <label for="cardidaccept">卡号:</label>
                                    <input type="text" id="cardidaccept"  name="cardid" align="left">
                                </p>
                                <p>
                                    <label for="amountaccept">转入金额:</label>
                                    <input type="text" id="amountaccept" name="amount" align="left">
                                </p>
                                <p>
                                    <button  class="btn btn-info " id="transationbtn" type="button">转账</button>
                                    <span id="msg" style="font-size: 35px;line-height: 150%"></span>
                                </p>
                            </fieldset>
                        </form>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <script>
        $(function (){
            <%--$("#transationbtn").attr("cardid","${cardid}");--%>
            $("#transationbtn").attr("balance","${balance}");

            $("#transationbtn").click(function (){
                $("#msg").text("");
                var customername = $("#customernametd").val();
                if (customername == ""){
                    $("#msg").text("姓名不能为空");
                    return false;
                }

                var cardidaccept = $("#cardidaccept").val();
                var pattern = /^\d{19}/;
                if (!pattern.test(cardidaccept)){
                    $("#msg").text("银行卡号有误");
                    return false;
                }


                var amount = $("#amountaccept").val();
                var pattern = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]{1,2}$)/;
                if (!pattern.test(amount)){
                    $("#msg").text("转账金额输入不合法,请重新输入");
                    return false;
                }
                if (parseFloat(amount)>parseFloat($("#amountaccept").attr("balance"))){
                    $("#msg").text("余额不足");
                    return false;
                }

                if (!confirm("确认客户${customername}转账" + $("#amount").val() + "元")){
                    return false;
                }
                $.ajax({
                    url:"${APP_PATH}/transation/" + "${cardid}",
                    type:"POST",
                    data:$("form").serialize() + "&rolloutname=${customername}",
                    success:function (data){
                      $("#msg").text(data.extend.msg);
                    }
                });
            });
        })





    </script>
</body>
</html>