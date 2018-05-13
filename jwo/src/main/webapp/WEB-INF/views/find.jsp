<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<c:import url="/WEB-INF/views/inc/head.jsp" />
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
</head>
<body style="overflow-y: hidden;">
<div id="tabs" style="width:410px; height:310px; padding:20px 45px 20px 45px; background-color:#fff; box-shadow:0 5px 0px rgba(0, 0, 0, .1); border-radius:10px; position:absolute; top:30%; left:50%; margin-left:-250px;">
  <ul>
    <li><a href="#tabs-1">아이디 찾기</a></li>
    <li><a href="#tabs-2">비밀번호 찾기</a></li>
  </ul>
  <div id="tabs-1">
  	
  	<input type="email" id="email" name="email" placeholder="이메일" maxlength="20" style="width: 100%; margin-bottom: 15px; height: 40px; padding: 0 9px 0 9px; border: 1px solid #B4B4B4; border-radius: 5px;" required /> <br/>
  	<a href="#" id="findLogin" class="btn btn-primary btn-block btn-large" style="width: 48.4%; display: inline-block; text-decoration:none;">아이디 찾기</a> 
	<a href="${_ctx}/index.god" id="findLogin_x" class="btn btn-primary btn-block btn-large" style="width: 48.4%; display: inline-block; text-decoration:none;">취소하기</a>
  </div>
  <div id="tabs-2">
  	<input type="text" id="loginId" name="loginId" placeholder="아이디" maxlength="15" minlength="6" style="width: 100%; height: 40px; margin-bottom: 15px; padding: 0 9px 0 9px; border: 1px solid #B4B4B4; border-radius: 5px;" required /> <br/>
  	<input type="email" id="email" name="email" placeholder="이메일" maxlength="20" style="width: 100%; height: 40px; padding: 0 9px 0 9px; margin-bottom: 15px; border: 1px solid #B4B4B4; border-radius: 5px;" required /> <br />
  	<a href="#" id="findLogin" class="btn btn-primary btn-block btn-large"  style="width: 48.4%; display: inline-block; text-decoration:none;">비밀번호 찾기</a> 
	<a href="${_ctx}/index.god" id="findLogin_x" class="btn btn-primary btn-block btn-large" style=" width: 48.4%; display: inline-block; text-decoration:none;">취소하기</a>
  </div>
</div>
</body>
</html>