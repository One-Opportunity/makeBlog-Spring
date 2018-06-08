<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pagetag" uri="/WEB-INF/tlds/pagetag.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:import url="/WEB-INF/views/inc/head.jsp" />
        <link rel="stylesheet" type="text/css" href="${_ctx}/res/tabmenu/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="${_ctx}/res/tabmenu/css/style2.css" />
		<script type="text/javascript" src="${_ctx}/res/tabmenu/js/modernizr.custom.04022.js"></script>
<style>
</style>
<script>
	$(document).ready(function() {
		$("#header ul li").children().eq(5).addClass("on");
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
					<h1>나의 좋아요 한 글</h1>
					
				</div>
			</div>
<div class="container">

<!-- 			<header> -->
<!-- 				<nav class="codrops-demos"> -->
<!-- 					<a href="/SRC2/anitab2/index.html">Demo 1</a> -->
<!-- 					<a class="current-demo" href="/SRC2/anitab2/index2.html">Demo 2</a> -->
<!-- 					<a href="/SRC2/anitab2/index3.html">Demo 3</a> -->
<!-- 					<a href="/SRC2/anitab2/index4.html">Demo 4</a> -->
<!-- 				</nav> -->
<!-- 			</header> -->
			<section class="tabs">
	            <input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked" />
		        <label for="tab-1" class="tab-label-1">보낸쪽지함</label>
		
	            <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
		        <label for="tab-2" class="tab-label-2">받은쪽지함</label>
		
			    <div class="clear-shadow"></div>
			
		        <div class="content">
			        <div class="content-1">
			        <table class="base_tbl">
						<thead>
							<tr>
								<th width="8%">메뉴</th>
								<th width="8%">번호</th>
								<th>제목</th>
								<th width="8%">작성자</th>
								<th width="15%">등록일자</th>
								<th width="10%">첨부파일</th>
								<th width="10%">조회수</th>
							</tr>
						</thead>
						<tbody>
			        
			        <c:forEach items="${listY}" var="item">
						<tr>
									<td>${item.mapName}</td>
									<td>${item.docId}</td>
									<td class="txtCut alignLeft">
									
									<a href="javascript:goView('${item.docId}', '${item.mapId}');">${item.title}  <c:if test="${item.cntComment > 0}">(${item.cntComment})</c:if></a>
									
<%-- 									<a href="${_ctx}/board/doc/view.god?docId=${item.docId}&${search.params}"></a> --%>
									</td>
									<td>${item.name}</td>
									<td><fmt:formatDate value="${item.regDt}" pattern="yyyy.MM.dd. HH시 mm분 " /></td>
									
									<td class="cnt" ><c:forEach items="${item.fileList}" var="file">
									<a href="${_ctx}/file/downloadFile.god?docId=${file.docId}&fileSno=${file.fileSno}">
									<img src="${_ctx}/res/images/clips.png" style="width: 10%;"  />${file.orgFileName}</a><br/> 
									</c:forEach>
									</td>
									
									<td><fmt:formatNumber value="${item.cntRead}"/></td>
								</tr>					</c:forEach>
								</tbody>
								</table>
				    </div>
			        <div class="content-2">
			        <table class="base_tbl">
						<thead>
							<tr>
								<th width="8%">메뉴</th>
								<th width="8%">번호</th>
								<th>제목</th>
								<th width="8%">작성자</th>
								<th width="15%">등록일자</th>
								<th width="10%">첨부파일</th>
								<th width="10%">조회수</th>
							</tr>
						</thead>
						<tbody>
			        <c:forEach items="${listN}" var="item">
			        <tr>
									<td>${item.mapName}</td>
									<td>${item.docId}</td>
									<td class="txtCut alignLeft">
									
									<a href="javascript:goView('${item.docId}', '${item.mapId}');">${item.title}  <c:if test="${item.cntComment > 0}">(${item.cntComment})</c:if></a>
									
<%-- 									<a href="${_ctx}/board/doc/view.god?docId=${item.docId}&${search.params}"></a> --%>
									</td>
									<td>${item.name}</td>
									<td><fmt:formatDate value="${item.regDt}" pattern="yyyy.MM.dd. HH시 mm분 " /></td>
									
									<td class="cnt" ><c:forEach items="${item.fileList}" var="file">
									<a href="${_ctx}/file/downloadFile.god?docId=${file.docId}&fileSno=${file.fileSno}">
									<img src="${_ctx}/res/images/clips.png" style="width: 10%;"  />${file.orgFileName}</a><br/> 
									</c:forEach>
									</td>
									
									<td><fmt:formatNumber value="${item.cntRead}"/></td>
								</tr>
			        </c:forEach>
			        </tbody>
			        </table>
				    </div>
		        </div>
			</section>
        </div>

		</div>
	</div>
</body>
</html>
