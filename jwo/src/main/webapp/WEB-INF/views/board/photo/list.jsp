<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pagetag" uri="/WEB-INF/tlds/pagetag.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:import url="/WEB-INF/views/inc/head.jsp" />


	<style type="text/css">
	body {
	  background: #fff;
	  font-family: sans-serif;
	}

	.demo-wrap {
	  max-width: 960px;
	  margin: 0 auto;
	  padding: 15px;
	}

	.button {
	  text-decoration: none;
	  color: #F0353A;
	  border: 2px solid #F0353A;
	  padding: 6px 10px;
	  display: inline-block;
	  font-size: 18px;
	}

	.button:hover {
	  background: #F0353A;
	  color: #fff;
	}
	</style>
<script>
	$(function() {
		    // use default options
		    $(document).smoothGallery({
		        animSpeed:300, 
		        delaySpeed:50,
		        visibleRows: 2,
		        animEasing: 'easeOutQuart'
		});
		//검색유지
		$("#searchType > option[value='${search.searchType}']").attr("selected", true);
		var mapId = $("#mapId").val();
		
		
		$("#btnWrite")
				.click(function() {
							console.log(mapId);
							document.location.href = "${_ctx}/board/photo/write.god?mapId="
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

			

	<div id="popupdialog"></div>

	<div id="wrap">

		<c:import url="/WEB-INF/views/inc/header.jsp" />
		<c:import url="/WEB-INF/views/inc/left.jsp" />




		<div id="rightWrap">

			<div class="rightBlock">
				<div class="page_top">
					<h1>${mapDTO.mapName}</h1>
				</div>
				
				
				<!-- 검색 시작 -->
				<form id="frmSearch" method="get" name="frmSearch" action="${_ctx}/board/photo/list.god" class="search_area">
					<dl>
						<dd>
					<input type="hidden" name="mapId" id="mapId" value="${mapDTO.mapId}" />
					<input type="hidden" name="page" id="page" value="${search.page}" />
							
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
							<form>
							  <input type="text" name="searchText" placeholder="검색어 입력" value="${search.searchText}" />
							</form>
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
			<%-- 검색 끝 --%>	

				<div class="boardWrap">

			<br/><br/><br/>
<div class="sg">
							<c:forEach items="${list}" var="item">
  <div class="sg-item"> 
  <%-- 사진 --%>
<%--   <c:forEach items="${item.fileList}" var="file"> --%>
  <a href="javascript:goView('${item.docId}');"> <img src="${_ctx}/${item.fileList.get(0).filePath}/${item.fileList.get(0).newFileName}.${item.fileList.get(0).fileExt}" style="width: 200px; height: 200px; margin-bottom: 10px; " /> </a>
  
   <br/>
<%--    </c:forEach> --%>
   <%-- 제목 --%>
    <a href="javascript:goView('${item.docId}');" style="color:black; font-size:20px; text-decoration:none; padding: 5px;">${item.title}  <c:if test="${item.cntComment > 0}">(${item.cntComment})</c:if></a>
    
    <br />
    
    <%-- 조회수 | 등록일 --%>
    <fmt:formatNumber value="${item.cntRead}"/> | <fmt:formatDate value="${item.regDt}" pattern="yy. MM. dd. " /> 
    
    <br />
    
    <%-- 이름 --%>                         
    <p style="color: black; font-size: 15px;">
    <img src="${_ctx}/res/images/thum_img.jpg" style=" margin-top: 3px; width:13px; border: 1px solid #0a6dab; border-radius: 35px;" /> ${item.name}
    </p>
  </div>

							</c:forEach>
</div>
<br/>
<div class="sg-paginate"> <a href="#" class="sg-up">▲</a><a href="#" class="sg-down">▼</a> </div>
<br/>
<br/>
						


					<div class="btnSet">
						<a href="javascript:;" id="btnWrite" class="disPB btnBase">글쓰기</a>
					</div>
				</div>
			</div>

		</div>
	</div>
<form id="frmView" method="get" name="frmView" action="${_ctx}/board/photo/view.god" class="search_area">
	<input type="hidden" name="docId" id="docId"/>
	<input type="hidden" name="mapId" id="mapId" value="${search.mapId}" />
	<input type="hidden" name="page" id="page" value="${search.page}" />
	<input type="hidden" name="searchType" id="searchType" value="${search.searchType}" />
	<input type="hidden" name="searchText" id="searchText" value="${search.searchText}" />
</form>
</body>

</html>
