<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>银行管理系统登录页面</title>
	<%
		pageContext.setAttribute("APP_PATH", request.getContextPath());
	%>

	<link type="text/css" rel="stylesheet" href="${APP_PATH}/static/loginregist1/css/style.css" >
	<script src="${APP_PATH}/static/loginregist1/script/jquery-1.7.2.js"></script>

</head>
<body>
		<div id="login_header">

		</div>
		<div class="login_banner">

			<div id="l_content">
				<span class="login_word">欢迎登录</span>
			</div>

			<div id="content">
				<div class="login_form">
					<div class="login_box">
						<div class="tit">
							<h1>银行</h1>
							<a href="${APP_PATH}/regist">立即注册</a>
						</div>
						<div class="msg_cont">
							<b></b>
							<span class="errorMsg">
								<%=request.getAttribute("msg")==null?"请输入用户名和密码":request.getAttribute("msg")%>
							</span>
						</div>
						<div class="form">
							<form action="${APP_PATH}/login" method="post">
								<input type="hidden" name="action" value="login">
								<label>用户名称：</label>
								<input class="itxt" type="text" placeholder="请输入用户名"
									   autocomplete="off" tabindex="1" name="username" />
								<br />
								<br />
								<label>用户密码：</label>
								<input class="itxt" type="password" placeholder="请输入密码"
									   autocomplete="off" tabindex="1" name="password" />
								<br />
								<br />
								<div id="flushimg">
									<label>验证码:</label>
									<input type="text" name="tryCode" style="width: 100px;vertical-align:middle">
									<img alt="验证码" onclick="this.src='/banksystem/defaultKaptcha?d=' + new Date()*1" src="${APP_PATH}/defaultKaptcha"  style="height: 35px;vertical-align:middle"/>
									<br>
									<input type="submit" value="登录" id="sub_btn" />
								</div>

							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div id="bottom">
			<span>
				银行.Copyright &copy;2020
			</span>
		</div>
</body>
</html>