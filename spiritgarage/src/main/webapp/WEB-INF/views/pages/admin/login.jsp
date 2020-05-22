<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SPIRIT GARAGE ADMIN</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script src="/js/library/jquery/jquery.min.js"></script>
<script src="/js/library/jquery/jquery.tmpl.min.js"></script>
<script src="/js/admin/login.js"></script>
<link href="/layout/styles/login.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
	<form>
		<h1>SPIRIT ADMIN</h1>
		<div class="inset">
			<p>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" />
			</p>
			<p>
				<label for="password">비밀번호</label>
				<input type="password" name="password" id="password" />
			</p>
		</div>
		<p class="p-container">
			<span>신규등록은 관리자에게</span>
			<input type="button" name="loginBtn" id="loginBtn" value="Log in"/>
		</p>
	</form>
</body>
</html>