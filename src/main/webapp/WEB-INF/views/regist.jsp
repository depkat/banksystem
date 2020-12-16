<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>银行管理系统注册页面</title>
	<%
		pageContext.setAttribute("APP_PATH", request.getContextPath());
	%>

	<link type="text/css" rel="stylesheet" href="${APP_PATH}/static/loginregist1/css/style.css" >
	<script src="${APP_PATH}/static/loginregist1/script/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		// 页面加载完成之后
		$(function () {

			$("#username").blur(function () {
				//1 获取用户名
				var username = this.value;
/*				// 前端验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
				//1 获取用户名输入框里的内容
				// var usernameText = $("#username").val();
				//2 创建正则表达式对象
				var usernamePatt = /^\w{6,12}$/;
				//3 使用test方法验证
				if (!usernamePatt.test(username)) {
					//4 提示用户结果
					$("span.errorMsg").text("用户名必须由字母，数字下划线组成，并且长度为6到12位");
					return false;
				}*/
				$.getJSON("${APP_PATH}/checkUsername","username=" + username,function (data) {
					if (data.code === 200) {
						if ("undefined" != data.extend.checkout.username){
							$("span.errorMsg").text("用户名必须是6-16位数字和字母的组合或者2-5位中文");
							return false;
						}
						$("span.errorMsg").text("用户名已存在！");
					} else {
						$("span.errorMsg").text("用户名可用！");
					}
				});
			});

			$("#password").blur(function () {
				// 验证密码：必须由字母，数字下划线组成，并且长度为6到12位
				//1 获取用户名输入框里的内容
				var passwordText = $("#password").val();
				//2 创建正则表达式对象
				var passwordPatt = /^\w{6,12}$/;
				//3 使用test方法验证
				if (!passwordPatt.test(passwordText)) {
					//4 提示用户结果
					$("span.errorMsg").text("密码不合法！");
					return false;
				}
			});

			$("#repwd").blur(function (){
				// 验证确认密码：和密码相同
				//1 获取确认密码内容
				var repwdText = $("#repwd").val();
				//2 和密码相比较
				if (repwdText != $("#password").val()) {
					//3 提示用户
					$("span.errorMsg").text("确认密码和密码不一致！");

					return false;
				}
			});


/*			// 给验证码的图片，绑定单击事件
			$("#code_img").click(function () {
				// 在事件响应的function函数中有一个this对象。这个this对象，是当前正在响应事件的dom对象
				// src属性表示验证码img标签的 图片路径。它可读，可写
				// alert(this.src);
				this.src = "${APP_PATH}/kaptcha.jpg?d=" + new Date();
			});*/

			//前端校验用户名是否合法
			function checkUsername(){
				// 验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
				//1 获取用户名输入框里的内容
				var usernameText = $("#username").val();
				//2 创建正则表达式对象
				var usernamePatt = /^\w{5,12}$/;
				//3 使用test方法验证
				if (!usernamePatt.test(usernameText)) {
					//4 提示用户结果
					$("span.errorMsg").text("用户名必须由字母，数字下划线组成，并且长度为6到12位");
					alert("不可以用")
					return false;
				}
			}
			// 给注册绑定单击事件
			$("#sub_btn").click(function () {
				// 验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
				//1 获取用户名输入框里的内容
				var usernameText = $("#username").val();
				//2 创建正则表达式对象
				var usernamePatt = /^\w{6,12}$/;
				//3 使用test方法验证
				if (!usernamePatt.test(usernameText)) {
					//4 提示用户结果
					$("span.errorMsg").text("用户名必须由字母，数字下划线组成，并且长度为6到12位");

					return false;
				}
				// 验证密码：必须由字母，数字下划线组成，并且长度为6到12位
				//1 获取用户名输入框里的内容
				var passwordText = $("#password").val();
				//2 创建正则表达式对象
				var passwordPatt = /^\w{6,12}$/;
				//3 使用test方法验证
				if (!passwordPatt.test(passwordText)) {
					//4 提示用户结果
					$("span.errorMsg").text("密码不合法！");

					return false;
				}

				// 验证确认密码：和密码相同
				//1 获取确认密码内容
				var repwdText = $("#repwd").val();
				//2 和密码相比较
				if (repwdText != passwordText) {
					//3 提示用户
					$("span.errorMsg").text("确认密码和密码不一致！");

					return false;
				}

				// // 邮箱验证：xxxxx@xxx.com
				// //1 获取邮箱里的内容
				// var emailText = $("#email").val();
				// //2 创建正则表达式对象
				// var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
				// //3 使用test方法验证是否合法
				// if (!emailPatt.test(emailText)) {
				// 	//4 提示用户
				// 	$("span.errorMsg").text("邮箱格式不合法！");
				//
				// 	return false;
				// }

				// 验证码校验
				var codeText = $("#code").val();

				//去掉验证码前后空格
				// alert("去空格前：["+codeText+"]")
				codeText = $.trim(codeText);
				// alert("去空格后：["+codeText+"]")

				if (codeText == null || codeText == "") {
					//4 提示用户
					$("span.errorMsg").text("验证码不能为空！");
					return false;
				}
				// 去掉错误信息
				$("span.errorMsg").text("");

			});

		});

	</script>
	<style type="text/css">
		.login_form{
			height:420px;
			margin-top: 25px;
		}

	</style>
</head>
<body>
<div id="login_header">
<%--	<img class="logo_img" alt="" src="static/img/logo.gif" >--%>
</div>

<div class="login_banner">

	<div id="l_content">
		<span class="login_word">欢迎注册</span>
	</div>

	<div id="content">
		<div class="login_form">
			<div class="login_box">
				<div class="tit">
					<h1>注册管理系统</h1>
					<a href="${APP_PATH}/login" style="color: blue">立即登陆</a>
				</div>
				<div>
					<span class="errorMsg" style="color: red">${ requestScope.msg }</span>
				</div>
				<div class="form">
					<form action="${APP_PATH}/regist" method="post">
						<label>用户名称：</label>
						<input class="itxt" type="text" placeholder="请输入用户名"
							   value="${requestScope.username}"
							   autocomplete="off" tabindex="1" name="username" id="username" />
						<br />
						<br />
						<label>用户密码：</label>
						<input class="itxt" type="password" placeholder="请输入密码"
							   autocomplete="off" tabindex="1" name="password" id="password" />
						<br />
						<br />
						<label>确认密码：</label>
						<input class="itxt" type="password" placeholder="确认密码"
							   autocomplete="off" tabindex="1" name="repwd" id="repwd" />
						<br />
						<br />
<%--						<label>电子邮件：</label>--%>
<%--						<input class="itxt" type="text" placeholder="请输入邮箱地址"--%>
<%--							   value="${requestScope.email}"--%>
<%--							   autocomplete="off" tabindex="1" name="email" id="email" />--%>
<%--						<br />--%>
						<br />
						<label>验证码：</label>
						<input class="itxt" type="text" name="trycode" style="width: 80px;" id="code" />
						<img id="code_img" alt="" onclick="this.src='/banksystem/defaultKaptcha?d=' + new Date()*1" src="${APP_PATH}/defaultKaptcha" style="float: right; margin-right: 40px; width: 110px; height: 30px;">
						<br />
						<br />
						<input type="submit" value="注册" id="sub_btn" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>

<form>
	<fieldset>
		<p>
			<label for="custidnum">身份证号码:</label>
			<span type="text" id="custidnum" name="custidnum" align="left">${custidnum}</span>
		</p>
		<p>
			<label for="cardid">卡号:</label>
			<span type="text" id="cardid" name="cardid" align="left">${cardid}</span>
		</p>
		<p>
			<label for="balance">存入金额:</label>
			<input type="text" id="balance" name="balance" align="left">
		</p>
		<p>
			<button  class="btn btn-info " id="addCustbtn" type="button">添加</button>
			<span id="addmsg" style="font-size: 35px;line-height: 150%"></span>
		</p>
	</fieldset>
</form>