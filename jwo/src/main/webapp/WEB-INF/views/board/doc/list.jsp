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
	
	function goSecretPwDialog(pw, docId, mapId) {
		var url = "${_ctx}/board/dialog/secretpw.god?secretWritePw=" + pw + "&docId=" + docId + "&mapId=" + mapId;
		console.log(pw + ", " + docId);
		$.get(url, function (html) {
			$("#secretPwDialog").html(html);
		});
	}
	
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
	<div id="secretPwDialog"></div>

	<div id="wrap">

		<c:import url="/WEB-INF/views/inc/header.jsp" />
		<c:import url="/WEB-INF/views/inc/left.jsp" />

		<div id="rightWrap">

			<div class="rightBlock">
				<div class="page_top">
					<h1>${mapDTO.mapName}</h1>
				</div>
				
				
				<!-- 검색 시작 -->
				<form id="frmSearch" method="get" name="frmSearch" action="${_ctx}/board/doc/list.god" class="search_area">
					<input type="hidden" name="mapId" id="mapId" value="${mapDTO.mapId}" />
					<input type="hidden" name="page" id="page" value="${search.page}" />
					<dl>
						<dd>
							
							<select name="searchType" id="searchType" style="height: 23px;">
								<option value="">:: 검색조건 ::</option>
								<option value="T">제목</option>
								<option value="C">내용</option>
								<option value="TC">제목+내용</option>
								<option value="U">작성자</option>
							</select>
						</dd>
						<dd>
						<div class="d7">
							  <input type="text" name="searchText" placeholder="검색어 입력" value="${search.searchText}" />
<%-- 							<input type="text" name="searchText" placeholder="검색어" style="height: 20px;" value="${search.searchText}"/> --%>
						</div>
						</dd>
						<dd>
						<div>
							<a href="javascript:goPage('1');" class="disPB btnBase" style="padding: 5px">검색</a>
						</div>
						</dd>
					</dl>
				</form>
						</div>
				<!-- 검색 끝 -->

				<div class="boardWrap">

					<table class="base_tbl">
						<thead>
							<tr>
								<th width="8%">번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th width="15%">등록일자</th>
								<th width="10%">첨부파일</th>
								<th width="10%">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="item">
								<tr>
									<td>${item.docId}</td>
									<td class="txtCut alignLeft">
									
									<c:choose>
									<c:when test="${item.secretWriteYn=='Y'}">
									<a href="javascript:goSecretPwDialog('${item.secretWritePw}', '${item.docId}', '${item.mapId}');">비밀글 입니다.
									<img src="${_ctx}/res/images/rock.png" style="width: 15px;"  />
									 
									<c:if test="${item.cntComment > 0}">(${item.cntComment})</c:if></a>
									</c:when>
									<c:otherwise>
									<a href="javascript:goView('${item.docId}');">${item.title}  <c:if test="${item.cntComment > 0}">(${item.cntComment})</c:if></a>
									</c:otherwise>
									</c:choose>
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

					<div class="btnSet">
						<a href="javascript:;" id="btnWrite" class="disPB btnBase">글쓰기</a>
					</div>
					<pagetag:paging page="${search}" />
<!-- 					<div id="paging"> -->
<!-- 						<p> -->
<!-- 							<span class="numPN"><a href="#">«</a></span>  -->
<!-- 							<span class="numPN over left"><a href="#">&lt;</a></span>  -->
<!-- 							<span class="Present"><a href="#">1</a></span> -->
<!-- 							<span><a href="#">2</a></span>  -->
<!-- 							<span><a href="#">3</a></span>  -->
<!-- 							<span><a href="#">4</a></span>  -->
<!-- 							<span><a href="#">5</a></span>  -->
<!-- 							<span><a href="#">6</a></span>  -->
<!-- 							<span><a href="#">7</a></span>  -->
<!-- 							<span><a href="#">8</a></span>  -->
<!-- 							<span><a href="#">9</a></span>  -->
<!-- 							<span class="dubble"><a href="#">10</a></span>  -->
<!-- 							<span class="numPN over right"><a href="#">&gt;</a></span>  -->
<!-- 							<span class="numPN"><a href="#">»</a></span> -->

<!-- 						</p> -->
<!-- 					</div> -->


				</div>
			</div>

		</div>
	</div>
<form id="frmView" method="get" name="frmView" action="${_ctx}/board/doc/view.god" class="search_area">
	<input type="hidden" name="docId" id="docId"/>
	<input type="hidden" name="mapId" id="mapId" value="${search.mapId}" />
	<input type="hidden" name="page" id="page" value="${search.page}" />
	<input type="hidden" name="searchType" id="searchType" value="${search.searchType}" />
	<input type="hidden" name="searchText" id="searchText" value="${search.searchText}" />
</form>
</body>
</html>
