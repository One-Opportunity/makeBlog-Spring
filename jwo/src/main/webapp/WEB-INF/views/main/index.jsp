<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<c:import url="/WEB-INF/views/inc/head.jsp" />
	<style>
  body {
   font-family: Arial, Helvetica, sans-serif;
  }
  
  table {
   font-size: 1em;
  }
  
  .ui-draggable, .ui-droppable {
   background-position: top;
  }
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
  </style>
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
