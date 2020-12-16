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
                <div style="text-align: center;line-height: 200%;height: 50px;font-size: 30px;">新增客户</div>
                <div class="row " style="text-align: left;background-color: lightgray;line-height: 250%">
                    <div  class="col-md-12 " >
                        <form>
                            <fieldset>
                                <p>
                                    <label for="custname" >姓名:</label>
                                    <input type="text" id="custname" name="custname" align="left"  required="">
                                    <span id = namemsg ></span>
                                </p>
                                <p>
                                    <label for="idnumber">身份证号码:</label>
                                    <input type="text" id="idnumber" name="idnumber" align="left">
                                    <span id = idnumbermsg ></span>
                                </p>
                                <p>
                                    <label for="phonenum">手机号码:</label>
                                    <input type="text" id="phonenum" name="phonenum" align="left">
                                    <span id = phonenummsg ></span>
                                </p>
                                <p>
                                    <label for="email">邮箱:</label>
                                    <input type="text" id="email" name="email" align="left">
                                    <span id = emailmsg ></span>
                                </p>
<%--                                <p>--%>
<%--                                    <label for="gender1">--%>
<%--                                        <input type="radio" id="gender1" name="gender" align="left" value="m" checked>男--%>
<%--                                    </label>--%>
<%--                                    <label for="gender2">--%>
<%--                                        <input type="radio" id="gender2" name="gender" align="left" value="w">女--%>
<%--                                    </label>--%>
<%--                                </p>--%>
                                <div>
                                    <label>性别:
                                    </label>
                                    <span>男</span>
                                    <input type="radio" name="gender" align="left" checked value="m">

                                    <span>&nbsp;&nbsp;&nbsp;女</span>
                                    <input type="radio" name="gender" align="left" value="w">
                                </div>
                                <p>
                                    <button  class="btn btn-info " id="addCustbtn" type="button">添加</button>
                                    <span id="addmsg" style="font-size: 35px;line-height: 150%"></span>
                                </p>
                            </fieldset>
                        </form>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <script>

        // $("#custname").blur(function (){
        //     var custname = $("#custname").val();
        //     if (custname==null || custname==""){
        //         $("#namemsg").addClass("error");
        //         $("#namemsg").text("用户名不能为空");
        //
        //     }else {
        //         $("#namemsg").addClass("success");
        //         $("#namemsg").text("");
        //     }
        // });

        $("#idnumber").blur(function (){
            $("#idnumbermsg").empty();
            $("#idnumbermsg").removeClass();
            var idnumber = $("#idnumber").val();
            var pattern = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
            if (!pattern.test(idnumber)){
                $("#idnumbermsg").removeClass();
                $("#idnumbermsg").addClass("error");
                $("#idnumbermsg").text("身份证号码有误");
                return false;
            }else {
                $("#idnumbermsg").removeClass();
                $("#idnumbermsg").addClass("success");
                $("#idnumbermsg").text("");
            }
            $.ajax({
                url:"${APP_PATH}/checkIdnumber",
                data:"idnumber=" + idnumber,
                success:function (data){
                    if (data.code == 200){
                        $("#idnumbermsg").addClass("error");
                        $("#idnumbermsg").text("身份证已存在");
                    }else {
                        $("#idnumbermsg").addClass("success");
                        $("#idnumbermsg").text("身份证号码可用");
                    }
                }
            });
        });

        $("#phonenum").blur(function (){
            var msgtag = $(this).next();
            msgtag.empty();
            msgtag.removeClass();
            var phonenum = $(this).val();
            var pattern = /^[1](([3][0-9])|([4][5-9])|([5][0-3,5-9])|([6][5,6])|([7][0-8])|([8][0-9])|([9][1,8,9]))[0-9]{8}$/;
            if (!pattern.test(phonenum)){
                msgtag.addClass("error");
                msgtag.text("手机号码输入有误");
                return false;
            }
            $.ajax({
                url:"${APP_PATH}/checkPhonenum",
                data:"phonenum=" + phonenum,
                success:function (data){
                    if (data.code == 200){
                        msgtag.addClass("error");
                        msgtag.text("手机号码已注册");
                    }else {
                        msgtag.addClass("success");
                        msgtag.text("手机号码可用");
                    }
                }
            });
        });

        $("#email").blur(function (){
            var msgtag = $(this).next();
            msgtag.empty();
            msgtag.removeClass();
            var email = $(this).val();
            var pattern = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!pattern.test(email)){
                msgtag.addClass("error");
                msgtag.text("邮箱格式不正确");
                return false;
            }
            $.ajax({
                url:"${APP_PATH}/checkEmail",
                data:"email=" + email,
                success:function (data){
                    if (data.code == 200){
                        msgtag.addClass("error");
                        msgtag.text("邮箱已注册");
                    }else {
                        msgtag.addClass("success");
                        msgtag.text("邮箱可用");
                    }
                }
            });
        });

        $("#addCustbtn").click(function (){
            if ($("#namemsg").hasClass("error")){
                return false;
            }
            if ($("#idnumbermsg").hasClass("error")){
                return false;
            }
            if ($("#phonenummsg").hasClass("error")){
                return false;
            }
            if ($("#emailmsg").hasClass("error")){
                return false;
            }
            if(!confirm("确认是否提交客户"+$("#custname").val())) {
                return false;
            }
            $.ajax({
                type:"POST",
                url:"${APP_PATH}/addCustomer",
                data:$("form").serialize(),
                success:function (data,status){
                    if (data.code == 100){
                        $("#addmsg").text("提交成功");
                        $("#addmsg").addClass("success")
                    }else {
                        $("#addmsg").text("提交失败");
                        $("#addmsg").addClass("error")
                    }

                },
                error: function (XMLHttpResponse, textStatus, errorThrown) {
                    console.log("1 异步调用返回失败,XMLHttpResponse.readyState:"+XMLHttpResponse.readyState);

                    console.log("2 异步调用返回失败,XMLHttpResponse.status:"+XMLHttpResponse.status);

                    console.log("3 异步调用返回失败,textStatus:"+textStatus);
                    console.log("4 异步调用返回失败,errorThrown:"+errorThrown);
                    if (textStatus == "error"){
                        $("#addmsg").text("提交失败");
                        $("#addmsg").addClass("error")
                    }
                }
            });
        });

    </script>
</body>
</html>