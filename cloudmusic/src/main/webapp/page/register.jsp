<%@ page  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<base href="/cloudmusic/">
	<title>注册 - 知乎 - Thousands Find</title>
	<meta author="zrong.me 曾荣">
	<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
	<link type="text/css" rel="stylesheet" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/register-login.css">
</head>
<body>
<div id="box"></div>
<div class="cent-box register-box">
	<div class="cent-box-header">
		<h1 class="main-title hide">知乎</h1>
		<h2 class="sub-title">生活热爱音乐 - Thousands Find</h2>
	</div>

	<div class="cont-main clearfix">
		<div class="index-tab">
			<div class="index-slide-nav">
				<a href="page/login.jsp">登录</a>
				<a href="page/register.jsp" class="active">注册</a>
				<div class="slide-bar slide-bar1"></div>				
			</div>
		</div>

		<div class="login form">
			<div class="group">
				<form id="registerForm" method="post">
					<div class="group-ipt email">
						<input type="email" name="email" id="email" class="ipt" placeholder="邮箱地址" required>
					</div>
					<div class="group-ipt user">
						<input type="text" name="user" id="user" class="ipt" placeholder="选择一个用户名" required>
					</div>
					<div class="group-ipt password">
						<input type="password" name="password" id="password" class="ipt" placeholder="设置登录密码" required>
					</div>
					<div class="group-ipt password1">
						<input type="password" name="password1" id="password1" class="ipt" placeholder="重复密码" required>
					</div>
					</form>
				<div class="group-ipt verify">
					<input type="text" name="verify" id="verify" class="ipt" placeholder="输入验证码" required>
					<img src="http://zrong.me/home/index/imgcode?id=" class="imgcode">
				</div>
			</div>
		</div>

		<div class="button">
			<button type="submit" class="login-btn register-btn" id="button">注册</button>
		</div>
	</div>
</div>

<div class="footer">
	<p>音乐台- Thousands Find</p>
	<p>Designed By ZengRong & <a href="zrong.me">mycodes.net</a> 2016</p>
</div>

	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/register.js"></script>
</body>
</html>