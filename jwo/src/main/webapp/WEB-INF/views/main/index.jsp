<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<c:import url="/WEB-INF/views/inc/head.jsp" />

	<script>
	$(document).ready(function(){
		$("#header ul li").children().eq(0).addClass("on");
		var url = "${_ctx}/board/dialog/popupdialog.god";
		$.get(url, function (html) {
			$("#popupdialog").html(html);

		});
	});
	</script>
</head>

<body>
<div id="popupdialog"></div>
<div id="wrap">

<c:import url="/WEB-INF/views/inc/header.jsp" />
<c:import url="/WEB-INF/views/inc/left.jsp" />

	<div id="rightWrap">
		<div class="rightBlock">
			<div class="page_top">
				<h1>메인 페이지</h1>
			</div>
		</div>
	</div>
</div>

</body>
</html>
