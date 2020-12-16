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
                    <input type="text" placeholder="请输入身份证号码" name="idnumber" id="inputidnum">
                    <span id="msg"></span>
                    <button class="btn btn-success searcher">
                        查询
                    </button>



                </div>
                <div class="row" style="text-align: center">
                    <h1>客户详细信息</h1>
                </div>
                <div class="row " style="background-color: white;width: 100%">
                    <div  class="col-md-12 " >
                        <table class="table table-bordered table-striped table-hover" hidden="hidden">

                            <tr>
                                <th width="150">姓名：</th>
                                <td id="tdname"></td>
                            </tr>
                            <tr>
                                <th>身份证号码：</th>
                                <td id="tdidnumber"></td>
                            </tr>
                            <tr>
                                <th>电话号码：</th>
                                <td id="tdphonenum"></td>
                            </tr>
                            <tr>
                                <th>邮箱：</th>
                                <td id="tdemail"></td>
                            </tr>
                            <tr>
                                <th>性别：</th>
                                <td id="tdgender"></td>
                            </tr>
                        </table>

                    </div>
                </div>

            </div>
        </div>

    </div>
    <script>

        $(".searcher").click(function(){
            $.ajax({
                url:"${APP_PATH}/custSearcher",
                type:"GET",
                data:$("#inputidnum").serialize(),
                success:function (result){
                    if(result.code === 200 ){
                        $("table").hide();
                        $("#msg").text("查无此人")
                        return  false;
                    }
                    $(".cardtr").empty();
                    $("#tdname").html(result.extend.customer.custname);
                    $("#tdidnumber").html(result.extend.customer.idnumber);
                    $("#tdphonenum").html(result.extend.customer.phonenum);
                    $("#tdemail").html(result.extend.customer.email);
                    $("#tdgender").html(result.extend.customer.gender === "m"?"男性":"女性");
                    $.each(result.extend.customer.cards,function(){

                        var option = $("<th>卡号</th>");
                        var a = $("<span></span>").append(this.cardid);
                        var optionEle = $("<td></td>").append(a);
                        var abc = $("<span>222&nbsp;&nbsp;</span>").append("<button class='carddetail btn btn-info' >查询详情</button>");
                        abc.appendTo(option);
                        abc.appendTo(optionEle);
                        var tr = $("<tr class='cardtr'></tr>").append(option).append(optionEle);
                        tr.appendTo("table");

                    });
                    $("table").show();
                }
            });
        });

        $("#inputidnum").change(function(){
            $("#msg").empty();
            var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
            var idnum = $("#inputidnum").val();
            if(reg.test(idnum) === false)
            {
                $("#msg").html("输入有误");
                return false;
            }
        });


    $(document).on("click",".carddetail",function(){
        var cardid = $(this).parent().prev().html();
        window.location.href= "${APP_PATH}/cardSearcher?cardid="+ cardid;
    });
    </script>

</body>
</html>