<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SPIRIT GARAGE ADMIN</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/layout/styles/all.min.css">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="/layout/styles/adminlte.min.css">
<link rel="stylesheet" href="/layout/styles/OverlayScrollbars.min.css">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<script src="/js/library/jquery/jquery.min.js"></script>
<script src="/js/library/jquery/jquery.tmpl.min.js"></script>
<script src="/js/library/jquery-validation-1.19.1/dist/jquery.validate.min.js"></script>
<script type="text/javascript">
var mngrInfo = {
		mngrSeq : '${mngrSeq}',
		id : '${id}',
		name : '${name}'
}
</script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="left"/>
		<tiles:insertAttribute name="body"/>
		<tiles:insertAttribute name="footer"/>
		
	</div>

	<script src="/js/library/jquery/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<script src="/js/library/bootstrap.bundle.min.js"></script>
	<script src="/js/library/sparkline.js"></script>
	<script src="/js/library/moment.min.js"></script>
	<script src="/js/library/jquery.overlayScrollbars.min.js"></script>
	<script src="/js/library/adminlte.js"></script>
	<script src="/js/library/dashboard.js"></script>
	<script src="/js/library/demo.js"></script>
</body>
</html>
