<%@ page language="java" contentType="text/html; charset=UTR-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="_ctx" value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath}" scope="application"/>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta name="keywords" content="한국경영원 인재개발원" />
<meta name="subject" content="한국경영원 인재개발원" />
<meta name="description" content="매뉴얼" />
<meta name="robots" content="길라잡이, 매뉴얼" />
<meta name="copyright" content="COPYRIGHT ⓒ KMS. ALL RIGHTS RESERVED." />
<title>통합게시판|조원오|</title>

<!-- css -->
<link href="${_ctx}/res/css/base.css" rel="stylesheet" type="text/css" />
<link href="${_ctx}/res/css/layout.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${_ctx}/res/js/jqueryui/jquery-ui.structure.min.css"/>
<link rel="stylesheet" href="${_ctx}/res/js/jqueryui/jquery-ui.min.css"/>

<!-- js -->
<script type="text/javascript" src="${_ctx}/res/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${_ctx}/res/js/jqueryui/jquery-ui.min.js"></script>
<script type="text/javascript" src="${_ctx}/res/js/validate/jquery.validate.js"></script>
<script type="text/javascript" src="${_ctx}/res/js/validate/additional-methods.js"></script>
<script type="text/javascript" src="${_ctx}/res/js/validate/localization/messages_ko.min.js"></script>
<script type="text/javascript" src="${_ctx}/res/js/validate/meiomask.js"></script>
<script type="text/javascript" src="${_ctx}/res/js/dtree/dtree.js"></script>
<script type="text/javascript" src="${_ctx}/res/js/jquery.form.js"></script>
<script type="text/javascript" src="${_ctx}/res/js/main.js"></script>
<script type="text/javascript" src="${_ctx}/res/js/snow.js"></script>
<script src="${_ctx}/res/js/snow/jquery.snow.js"></script>
<script src="${_ctx}/res/js/snow/snowstorm-min.js"></script>
<script src="${_ctx}/res/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script>
$(document).ready(function(){
	$(".fn").snow();
	$(".fn").snow({ minSize: 10, maxSize: 40, newOn: 7000, flakeColor: '#0099FF' });
});
</script>

    