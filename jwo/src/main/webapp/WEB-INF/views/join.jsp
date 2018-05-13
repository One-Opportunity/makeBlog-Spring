<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:import url="/WEB-INF/views/inc/head.jsp" />

<script>
	$(document).ready(function() {
		$("#phone").setMask();
		$("input").focus(function() {
			$(this).css("background-color", "#DDDDDD");
		});
		$("input").blur(function() {
			$(this).css("background-color", "#ffffff");
		});
		$("#imgCaptcha").click(function() {
			$(this).attr("src", "${_ctx}/captcha/index");
		});
		$("#loginId").focus();
		//id 포커스 시 
		$("#loginId").focus(function() {
			$("#checkedId").val("N");
		})
		//phone 포커스 시 
		$("#phone").focus(function() {
			$("#checkedPhone").val("N");
		})
		//email 포커스 시 
		$("#email").focus(function() {
			$("#checkedEmail").val("N");
		})

		$("#btnCheckId").click(function() {
			var loginId = $("#loginId").val();
			if (loginId == "") {
				alert("Id를 입력하세요");
			} else {
				var url = "${_ctx}/check/id.god?loginId=" + loginId;
				$.get(url, function(data) {
					// 아이디 사용 가능
					if (data.code > 0) {
						alert(data.msg);

						// 아이디 중복 체크를 했음.
						$("#checkedId").val("Y");

						// 아이디 사용 불가능
					} else {
						alert(data.msg);

						// 아이디 중복 체크 안했음.
						$("#checkedId").val("N");
					}

				});
			}
		});

		// phone 중복체크
		$("#btnCheckPhone").click(function() {

			var checkPhone = $("#phone").val();
			if (checkPhone == "") {
				alert("휴대폰을 입력해주세요");
			} else {
				var url = "${_ctx}/check/phone.god?phone=" + checkPhone;
				$.get(url, function(data) {
					//사용가능
					if (data.code > 0) {
						alert(data.msg);

						//phone 중복체크 됨
						$("#checkedPhone").val("Y");
					} else {
						alert(data.msg);

						//phone 중복체크 안됨
						$("#checkedPhone").val("N");
					}
				})
			}
		});

		//email 중복체크
		$("#btnCheckEmail").click(function() {
			var email = $("#email").val();
			if (email == "") {
				alert("이메일을 입력하세요");
			} else {
				var url = "${_ctx}/check/email.god?email=" + email;
				$.get(url, function(data) {
					if (data.code > 0) {
						alert(data.msg);
						$("#checkedEmail").val("Y");
					} else {
						alert(data.msg);
						$("#checkedEmail").val("N");
					}
				});
			}
		});

		// "저장" 버튼을 클릭 했을때
		$("#btnSave").click(function() {
			// javascript로 form 전송
			// frmJoin.submit();

			// * 캡챠 새로고침 *
			$("#imgCaptcha").attr("src", "${_ctx}/captcha/index");

			// 1. 아이디 중복 체크 검사
			var checkedId = $("#checkedId").val();
			if (checkedId == "N") {
				alert("아이디 중복체크를 먼저 해주세요.");
				return;
			}

			// 2. 아이디 중복 체크 검사
			var checkedPhone = $("#checkedPhone").val();
			if (checkedPhone == "N") {
				alert("휴대폰 중복체크를 해주세요.");
				return;
			}

			// 3. 아이디 중복 체크 검사
			var checkedEmail = $("#checkedEmail").val();
			if (checkedEmail == "N") {
				alert("이메일 중복체크를 해주세요.");
				return;
			}

			// 검증에 통과하면	
			if ($("#frmJoin").valid()) {
				$.get("${_ctx}/captcha/isRight", {
					captcha : $("#captcha").val()
				}, function(data) {
					if (data == 1) {
						//서버에 데이터 전송	
						var url = "${_ctx}/join.god";
						$.post(url, $("#frmJoin").serialize(), function(data) {

							if (data == "s") {
								alert("회원가입 성공");
								document.location.href = "/jwo/index.god"
							} else {
								alert("회원가입 실패!!");

								//화면 새로고침
								document.location.reload();
							}
						});
					} else {
						alert("문자가 다릅니다.");
					}
				});
			}
		});
	});
</script>
</head>

<body style="overflow-y: hidden;">
	<div id="loginWrap">
		<div id="join" class="login">
			<h1>회원가입</h1>
			<form id="frmJoin" name="frmJoin">
				<input type="hidden" id="checkedId" value="N" />
				<dl>
					<dd>
						<input type="text" id="loginId" name="loginId" placeholder="아이디"
							maxlength="15" minlength="6" style="width: 60%;" required /> 
							<a href="javascript:;" id="btnCheckId" class="btn btn-primary btn-block btn-large" style="width: 35%; display: inline-block; text-decoration:none;">중복확인</a>
					</dd>
					<dd>
						<input type="password" id="loginPw" name="loginPw"
							placeholder="비밀번호" maxlength="15" minlength="8" required />
					</dd>
					<dd>
						<input type="password" name="reLoginPw" placeholder="비밀번호확인"
							maxlength="15" minlength="8" equalTo="#loginPw" required />
					</dd>
					<dd>
						<input type="text" name="name" placeholder="이름" maxlength="30"
							required />
					</dd>
					<dd>
						<input type="text" id="phone" name="phone" placeholder="핸드폰번호"
							alt="mobile" maxlength="13" style="width: 60%; text-decoration:none;" required /> <a
							href="javascript:;" id="btnCheckPhone" class="btn btn-primary btn-block btn-large" style="width: 35%; display: inline-block; text-decoration:none;">중복확인</a>

					</dd>
					<dd>
						<input type="email" id="email" name="email" placeholder="이메일"
							maxlength="20" style="width: 60%;" required /> <a
							href="javascript:;" id="btnCheckEmail" class="btn btn-primary btn-block btn-large" style="width: 35%; display: inline-block; text-decoration:none;">중복확인</a>

					</dd>
					<dd>
						<img src="${_ctx}/captcha/index" id="imgCaptcha"
							style="cursor: pointer; background-color: white; margin-left: 5px; border-radius: 10px; " /> 
							<input type="text" name="captcha" id="captcha" placeholder="문자를 입력하세요" style="width: 44.2%;"
							required />
					</dd>
				</dl>
				<input type="hidden" id="checkedPhone" value="N" /> <input
					type="hidden" id="checkedEmail" value="N" /> 
					<a href="javascript:;"class="btn btn-primary btn-block btn-large" style=" text-decoration:none; width: 48.4%; display: inline-block;" id="btnSave">저장</a> 
					<a href="${_ctx}/index.god" class="btn btn-primary btn-block btn-large" style="text-decoration:none; width: 48.4%; display: inline-block;">취소</a>
			</form>
		</div>
	</div>
</body>
</html>
