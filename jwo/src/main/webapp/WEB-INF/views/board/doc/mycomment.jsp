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
		
		$("#header ul li").children().eq(4).addClass("on");
		//검색유지
		$("#searchType > option[value='${search.searchType}']").attr("selected", true);
		var mapId = $("#mapId").val();
	});
	
	// 조회페이지 이동
	function goView(docId, mapId){
		$("#docId").val(docId);
		$("#mapId").val(mapId);
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
					<h1>전체 글 보기</h1>
				</div>
			
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
							<c:forEach items="${list}" var="item">
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

		</div>
	</div>
	<form id="frmView" method="get" name="frmView" action="${_ctx}/board/doc/view.god" class="search_area">
	<input type="hidden" name="mapId" id="mapId" />
	<input type="hidden" name="docId" id="docId"/>
	<input type="hidden" name="page" id="page" value="${search.page}" />
	<input type="hidden" name="searchType" id="searchType" value="${search.searchType}" />
	<input type="hidden" name="searchText" id="searchText" value="${search.searchText}" />
</form>
</body>
</html>
