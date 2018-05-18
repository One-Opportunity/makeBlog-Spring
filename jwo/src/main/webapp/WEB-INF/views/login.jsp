<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:import url="/WEB-INF/views/inc/head.jsp" />

<script>
	$(function() {
		var url = "${_ctx}/board/dialog/popupdialog.god";
		$.get(url, function (html) {
			$("#popupdialog").html(html);

		});
// 		$("input").focus(function() {
// 			$(this).css("background-color", "#DDDDDD");
// 		});
// 		$("input").blur(function() {
// 			$(this).css("background-color", "#ffffff");
// 		});
		$("#loginId").focus();
		// "로그인" 버튼 클릭 시
		$("#btnLogin").click(function() {

			if ($("#frmLogin").valid()) {
				// jQuery와 자바스크립트 소스 
				$("#frmLogin").submit();
				//  frmLogin.submit();
			}
		});
		$("input").keydown(function(key) {
// 			key 값 확인
// 			console.log(key.keyCode); 
			if (key.keyCode == 13) {
				$("#btnLogin").click();
			}
		});

	});
	
</script>

</head>

<body style="overflow-y: hidden;">
	
	<div id="loginWrap" >
		<div id="login" class="login">
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				<font color="red"> Your login attempt was not successful due to <br /> <br /> <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
				</font>
				<!-- 새로고침 시 글 사라지게 하는 것 -->
				<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />

				<script>
					// query string 제거
					history.replaceState({}, null, location.pathname);
				</script>
			</c:if>
			<h1>로그인</h1>
			<form id="frmLogin" name="frmLogin" action="${_ctx}/security/login" method="post">

				<dl>
					<dt>id</dt>
					<dd>

						<input type="text" id="loginId" name="loginId" placeholder="User ID" data-msg-required="필수입니다. 알겠습니까?" required="required" />
						<!-- data-msg-minlength : 야 자리수는 {0}이다. -->

					</dd>
					<dt>pw</dt>
					<dd>
						<input type="password" name="loginPw" placeholder="Password" required="required">
					</dd>
				</dl>
				<a href="javascript:;" class="btn btn-primary btn-block btn-large" id="btnLogin" style="width: 48.4%; margin-right: 5px;display: inline-block; text-decoration:none;">로그인</a> 
				<a href="${_ctx}/join.god" class="btn btn-primary btn-block btn-large" style="width: 48.4%; display: inline-block; text-decoration:none;">회원가입</a>
				 <a href="${_ctx}/find.god" class="btn btn-primary btn-block btn-large" style="margin-top: 10px; text-decoration:none;" >아이디/비밀번호 찾기</a> 
<!-- 				 <a href="">비밀번호찾기</a> -->
			</form>
		</div>
	</div>
		<div id="popupdialog"></div>
	
</body>
</html>
