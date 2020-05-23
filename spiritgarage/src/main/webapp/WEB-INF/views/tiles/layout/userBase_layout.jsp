<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>SPIRIT GARAGE</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=0.8, user-scalable=no">
	<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
	<link href="layout/styles/jquery.datetimepicker.min.css" rel="stylesheet" type="text/css" media="all">
	<script src="/js/library/jquery/jquery.min.js"></script>
	<script src="/js/library/jquery/jquery.tmpl.min.js"></script>
	<script src="/js/library/jquery.datetimepicker.full.min.js"></script>
</head>
<body id="top">

	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
	
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
	<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>