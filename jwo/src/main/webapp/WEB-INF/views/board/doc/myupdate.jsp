<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pagetag" uri="/WEB-INF/tlds/pagetag.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:import url="/WEB-INF/views/inc/head.jsp" />
<style>
#stylized{
	border:solid 2px #b7ddf2;
	background:#ebf4fb;
}
#stylized h1 {
	font-size:16px;
	font-weight:bold;
	margin-bottom:8px;
	font-family:nanumgothic,dotum;

}
#stylized p{
	font-size:11px;
	color:#666666;
	margin-bottom:20px;
	border-bottom:solid 1px #b7ddf2;
	padding-bottom:10px;
	font-family:dotum;
}
#stylized label{
	display:block;
	font-weight:bold;
	text-align:right;
	width:140px;
	float:left;
	font-family:tahoma;
}
#stylized .small{
	color:#666666;
	display:block;
	font-size:11px;
	font-weight:normal;
	text-align:right;
	width:140px;
	font-family:dotum;
	letter-spacing:-1px;
}
#stylized input{
float:left;
font-size:12px;
padding:4px 2px;
border:solid 1px #aacfe4;
width:200px;
margin:2px 0 20px 10px;
}
#stylized button{
clear:both;
margin-left:150px;
width:125px;
height:31px;
text-align:center;
line-height:31px;
background-color:#000;
color:#FFFFFF;
font-size:11px;
font-weight:bold;
font-family:tahoma;
}
</style>
</style>
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
			<div id="stylized" class="myform"style="width: 40%; padding: 30px; margin: auto; border-radius: 10px;" >
				<form id="frmMyUpdate" name="frmMyUpdate" >
					<input type="hidden" id="userId" name="userId"  value="${userDTO.userId}"></input>
						<input type="text" id="loginId" name="loginId" style="width: 90%;" value="${userDTO.loginId}" readonly/>
						
						<input type="password" id="loginPw" name="loginPw" style="width: 90%;" placeholder="수정할 비밀번호를 입력하시오" maxlength="15" minlength="8" required />
						<input type="password" name="reLoginPw" style="width: 90%;" placeholder="수정할 비밀번호를 다시 입력하시오" maxlength="15" minlength="8" equalTo="#loginPw" required />
						<input type="text" id="name" name="name" style="width: 90%;" placeholder="${userDTO.name}" value="${userDTO.name}" maxlength="30" required />
						<input type="text" id="phone" name="phone" style="width: 90%;" placeholder="${userDTO.phone}" value="${userDTO.phone}" alt="mobile" maxlength="13" required /> 
						<input type="email" id="email" name="email" style="width: 90%;" placeholder="${userDTO.email}" value="${userDTO.email}" maxlength="20"  required />
				<input type="hidden" id="checkedPhone" value="N" /> <input type="hidden" id="checkedEmail" value="N" /> 
				<a href="javascript:;" class="btn btn-primary btn-block btn-large" style=" text-decoration:none; width: 48.4%; display: inline-block;" id="btnSave">저장</a> 
				<a href="${_ctx}/main/index.god" class="btn btn-primary btn-block btn-large" style=" text-decoration:none; width: 48.4%; display: inline-block;">취소</a>
			</form>
			</div>
		
		</div>
	</div>
</body>
</html>
