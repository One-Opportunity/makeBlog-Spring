<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pagetag" uri="/WEB-INF/tlds/pagetag.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:import url="/WEB-INF/views/inc/head.jsp" />
<script>
	$(document).ready(function() {
		$("#header ul li").children().eq(6).addClass("on");
	});
</script>
</head>

<body id="sc">

	<div id="loginWrap">
		<c:import url="/WEB-INF/views/inc/header.jsp" />
		<c:import url="/WEB-INF/views/inc/left.jsp" />

		<div id="rightWrap">

			<div class="rightBlock">
				<div class="page_top">
					<h1>후원하기</h1>
				</div>
			</div>
		</div>

		<div id="join" style="left: 50%; padding: 200px; border: 1px solid #DFDFDF">

			<dl>
				<dd style="margin-bottom: 10px;">
					<p style="font-size: 25px;">감사합니다 좋은 곳에 쓰겠습니다.</p>
				</dd>
				<dd style="margin-bottom: 30px;">
									<p style="font-size: 25px;">좀 더 질 좋은 게시판 만들겠습니다.</p>
				
				</dd>
				<dd style="margin-bottom: 50px;">
					<input type="text" value="만든이 : 조원오" readonly />
				</dd>
				<dd style="margin-bottom: 10px;">
					<input type="text" value="계좌번호 : 카카오뱅크 3333011538203" readonly />
				</dd>
				<dd style="margin-bottom: 10px;">
					<input type="text" value="계좌번호 : 농협 13003752119621" readonly />
				</dd>
				
			</dl>
		</div>
	</div>
</body>
</html>
