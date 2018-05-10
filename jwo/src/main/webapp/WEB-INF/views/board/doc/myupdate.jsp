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
		$("#header ul li").children().eq(3).addClass("on");
		$("#phone").setMask();
		
		// 이름 선택 시 이메일 자동 전체선택
		$("#name").click(function(){
			$(this).select();
		});
		
		// 이메일 선택 시 이메일 자동 전체선택
		$("#email").click(function(){
			$(this).select();
		});
		
		$("input").focus(function() {
			$(this).css("background-color", "#DDDDDD");
		});
		$("input").blur(function() {
			$(this).css("background-color", "#ffffff");
		});
		
		// "저장" 버튼을 클릭 했을때
		$("#btnSave").click(function() {
			// javascript로 form 전송
			// frmJoin.submit();

			// 검증에 통과하면	
			if ($("#frmMyUpdate").valid()) {
				//서버에 데이터 전송	
				var url = "${_ctx}/board/doc/myupdate.god";
				$.post(url, $("#frmMyUpdate").serialize(), function(data) {

					if (data == "s") {
						alert("수정되었습니다. 다시 로그인해주세요~");
						document.location.href = "/jwo/index.god"
					} else {
						alert("수정 실패!!!");

						//화면 새로고침
						document.location.reload();
					}
				});
			}
		});
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
					<h1>나의 정보 수정</h1>
				</div>
			</div>
		</div>

		<div id="join" style=" left:50%; padding:200px; border: 1px solid #DFDFDF">
			
			<form id="frmMyUpdate" name="frmMyUpdate">
					<input type="hidden" id="userId" name="userId" value="${userDTO.userId}"></input>
				<dl>
					<dd style="margin-bottom: 10px;">
						<input type="text" id="loginId" name="loginId" value="${userDTO.loginId}" readonly/>
						
					</dd>
					<dd>
						<input type="password" id="loginPw" name="loginPw" placeholder="수정할 비밀번호를 입력하시오" maxlength="15" minlength="8" required />
					</dd>
					<dd>
						<input type="password" name="reLoginPw" placeholder="수정할 비밀번호를 다시 입력하시오" maxlength="15" minlength="8" equalTo="#loginPw" required />
					</dd>
					<dd>
						<input type="text" id="name" name="name" placeholder="${userDTO.name}" value="${userDTO.name}" maxlength="30" required />
					</dd>
					<dd>
						<input type="text" id="phone" name="phone" placeholder="${userDTO.phone}" value="${userDTO.phone}" alt="mobile" maxlength="13" required /> 
					</dd>
					<dd>
						<input type="email" id="email" name="email" placeholder="${userDTO.email}" value="${userDTO.email}" maxlength="20"  required />
					</dd>
				</dl>
				<input type="hidden" id="checkedPhone" value="N" /> <input type="hidden" id="checkedEmail" value="N" /> <a href="javascript:;" class="loginBtn"
					id="btnSave">저장</a> <a href="${_ctx}/main/index.god" class="joinBtn">취소</a>
			</form>
		</div>
	</div>
</body>
</html>
