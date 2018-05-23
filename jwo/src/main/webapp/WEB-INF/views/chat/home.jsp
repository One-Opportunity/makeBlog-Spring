<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pagetag" uri="/WEB-INF/tlds/pagetag.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:import url="/WEB-INF/views/inc/head.jsp" />
	<script src="${_ctx}/res/socket/sockjs.min.js"></script>
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
					<h1>채팅하기</h1>
				</div>
				
							<form id="chatForm">
				<input type="text" id="message" />
				<button>send</button>
			</form>
			<div id="chat"></div>
			</div>
		</div>

	</div>
	
	<script>
		$(document).ready(function(){
			$("#chatForm").submit(function(event){
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus();
			});
		});
		
		var sock = new SockJS("/jwo/echo");
		sock.onmessage = function(e){
			console.log(e);
			$("#chat").append(e.data + "<br/>");
		}
		
		sock.onclose = function(){
			$("#chat").append("연결 종료");
		}
		
	</script>
</body>
</html>
