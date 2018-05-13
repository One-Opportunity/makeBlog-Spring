<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pagetag" uri="/WEB-INF/tlds/pagetag.tld"%>

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
	//목록으로 다시 이동
	function goList(mapId) {
		$("#mapId").val(mapId);
		$("#frmList").submit();
	}
	$(function() {
		
		$("#commentWrap").on("click", "#btnComment", function() {
			var comments = $("#comments").val();

			var url = "${_ctx}/board/comment/write.god";
			var params = {
				docId : "${docDTO.docId}",
				comments : comments
			};
			$.post(url, params, function(data) {
				listComment();
			});
		});

		// 댓글 input에 엔터를 치면 댓글 등록
		$("#commentWrap").on("keydown", "#comments", function(e) {
			if (e.keyCode == 13) {
				$("#btnComment").click();
			}
		});

		// 댓글 목록 가져오기
		listComment();
		
	});
	// 댓글 목록 가져오기
	function listComment() {
		var url = "${_ctx}/board/comment/list.god?docId=${docDTO.docId}";
		$.get(url, function(html) {

			$("#commentWrap").html(html);

		});
	}
	function deleteComment(commentId) {
		var url = "${_ctx}/board/comment/list.god";
		$.post(url, {
			commentId : commentId
		}, function() {
			listComment();
		});
	}
	
	function userDialog() {
		var url = "${_ctx}/board/dialog/userinfo.god?userId=${docDTO.userId}";
		$.get(url, function (html) {

			$("#userdialog").html(html);

		});
	}
</script>
</head>

<body>
	<div id="userdialog"></div>

	
	<div id="wrap">

		<c:import url="/WEB-INF/views/inc/header.jsp" />
		<c:import url="/WEB-INF/views/inc/left.jsp" />

		<div id="rightWrap">

			<div class="rightBlock">
				<div class="page_top">
					<h1>${mapDTO.mapName}</h1>
				</div>

				<div class="boardWrap">

					<table class="base_tbl">
						<thead>
							<tr>
								<th colspan="8" class="t_color">${docDTO.title}</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="10%">작성자</td>
								<td width="20%" class="t_color" id="viewUser" style="cursor: pointer;" onclick="userDialog();">${docDTO.name}</td>

								<td width="10%">작성일</td>
								<td width="20%" class="t_color"><fmt:formatDate value="${docDTO.regDt}" pattern="yyyy.MM.dd. HH시 mm분" /></td>
								<td width="10%">조회수</td>
								<td width="20%" class="t_color">${docDTO.cntRead}</td>
							</tr>
							

							<tr>
								<td colspan="6" class="alignLeft"><c:forEach items="${docDTO.fileList}" var="file">
								<img src="${_ctx}/${file.filePath}/${file.newFileName}.${file.fileExt}" style="width: 900px" /> <br/>
							</c:forEach>
							${docDTO.boardContents}</td>
							</tr>
						</tbody>
					</table>

					<div class="btnSet">
						<a href="javascript:goList('${docDTO.mapId}')" class="disPB btnBase">목록</a> <a href="${_ctx}/board/photo/write.god?mapId=${docDTO.mapId}" class="disPB btnBase">글쓰기</a> 
							<a href="${_ctx}/board/photo/edit.god?${search.params}&docId=${docDTO.docId}" id="btnUpdate" class="disPB btnBase">수정</a>
						<c:if test="${userDTO.userId == docDTO.userId}">
							<a href="${_ctx}/board/photo/docremove.god?${search.params}&docId=${docDTO.docId}" class="disPB btnBase">삭제</a>
						</c:if>
					</div>

					<div class="replyWrap" id="commentWrap"></div>
				</div>
			</div>

		</div>
	</div>
	<form id="frmList" method="get" name="frmList" action="${_ctx}/board/photo/list.god" class="search_area">
		<input type="hidden" name="mapId" id="mapId" /> <input type="hidden" name="page" id="page" value="${search.page}" /> <input type="hidden"
			name="searchType" id="searchType" value="${search.searchType}" /> <input type="hidden" name="searchText" id="searchText"
			value="${search.searchText}" />
	</form>

</body>
</html>
