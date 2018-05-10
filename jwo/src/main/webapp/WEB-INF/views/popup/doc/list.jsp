<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pagetag" uri="/WEB-INF/tlds/pagetag.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:import url="/WEB-INF/views/inc/head.jsp" />
<script>
	$(function() {
		
		//검색유지
		$("#searchType > option[value='${search.searchType}']").attr("selected", true);
		var mapId = $("#mapId").val();
		
		
		$("#btnWrite")
				.click(function() {
							console.log(mapId);
							document.location.href = "${_ctx}/board/doc/write.god?mapId="
									+ mapId;
						});
	});
	
	// 페이지 이동
	function goPage(page){
	$("#page").val(page);
	$("#frmSearch").submit();
	}
	
	// 조회페이지 이동
	function goView(docId){
		$("#docId").val(docId);
		$("#frmView").submit();
	}
	
	

	
</script>
</head>

<body>


	<div id="wrap">

		<c:import url="/WEB-INF/views/inc/header.jsp" />
		<c:import url="/WEB-INF/views/inc/left.jsp" />

		<div id="rightWrap">

			<div class="rightBlock">
				<div class="page_top">
					<h1>팝업관리</h1>
				</div>
				
				<div class="boardWrap">

					<table class="base_tbl">
						<thead>
							<tr>
								<th width="8%">번호</th>
								<th>제목</th>
								<th width="10%">활성화</th>
								<th width="15%">등록일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="item">
								<tr>
									<td>${item.popId}</td>
									<td class="txtCut alignLeft">
									<a href="${_ctx}/popup/doc/view.god?popId=${item.popId}">${item.popTitle}</a>
									</td>
									<td>${item.popupYn}</td>
									<td><fmt:formatDate value="${item.regDt}" pattern="yyyy.MM.dd. HH시 mm분 " /></td>
									
								</tr>
							</c:forEach>
						</tbody>

					</table>

					<div class="btnSet">
						<a href="${_ctx}/popup/doc/write.god" id="btnWrite" class="disPB btnBase">팝업만들기</a>
					</div>

				</div>
			</div>

		</div>
	</div>

</body>
</html>
