<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:import url="/WEB-INF/views/inc/head.jsp" />

<script>
	$(document).ready(function() {
		$("#btnDocSave").click(function() {
			if ($("#frmWrite").valid()) {
			    oEditors.getById["boardContents"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#frmWrite").submit();
				
				// 				$("#frmWrite").ajaxSubmit({
				// 					type: 'POST'
				// 					, url : '${_ctx}/board/doc/list.god?mapId=${mapId}'
				// 					, dataType : 'JSON'
				// 					, beforeSubmit : function(){
				// 					}
				// 					, success : function(data){
				// 						if(data.code == -1){
				// 							alert(data.msg);
				// 						} else {
				// 							goView(data.pk);
				// 						}
				// 					}
				// 				});

				// 				var mapId = $("#mapId").val();
				// 				var url = "${_ctx}/board/doc/write.god?mapId=" + mapId;
				// 				$.post(url, $("#frmWrite").serialize(), function() {
				// 					document.location.href = "${_ctx}/board/doc/list.god?mapId=" + mapId;
				// 				});
			}
		});
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: oEditors,
		    elPlaceHolder: "boardContents",
		    sSkinURI: "${_ctx}/res/editor/SmartEditor2Skin.html",
		    fCreator: "createSEditor2"

		});
	});

	var cnt = 0;
	function addFile() {
		var appendingFileHtml = "<input type='file' name='files' style='width:90%' /> <img src=${_ctx}/res/images/del.jpg style='width:25px; cursor:pointer;' onclick='delFile(this)'/>";
		var size = $("td#tdFile > input[type=file]").length;
		if (size < 5) {
			$("#tdFile").append(appendingFileHtml);
		} else {
			alert("더 이상 추가할 수 없어요~~~");
		}

	}
	function delFile(file) {
		console.log(file);
		$(file).prev().remove();
		$(file).remove();
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
					<h1></h1>
				</div>

				<div class="boardWrap">

					<form id="frmWrite" name="frmWrite" action="${_ctx}/board/doc/write.god" method="post" enctype="multipart/form-data">
						
						<input type="hidden" name="mapId" id="mapId" value="${boardDocDTO.mapId}" /> 
						<input type="hidden" name="page" id="page" value="${search.page}" /> 
						<input type="hidden" name="searchType" id="searchType" value="${search.searchType}" /> 
						<input type="hidden" name="searchText" id="searchText" value="${search.searchText}" />
						<table class="base_tbl tbl_write">
							<tbody>
								<tr>
									<th width="20%" class="t_color">제목입력</th>
									<td><input type="text" id="title" name="title" required="required"  value="${title}" /></td>
								</tr>
								<tr>
									<th class="t_color">내용입력</th>
									<td><textarea name="boardContents" id="boardContents"  required="required"></textarea></td>
								</tr>
								<tr>
									<th class="t_color">첨부파일 <a href="javascript:addFile();" style="padding: 5px;" id="btnFile" class="disPB btnBase">추가</a>
									</th>
									<td id="tdFile"></td>

								</tr>
							</tbody>
						</table>

						<div class="btnSet alignCenter">
							<a href="javascript:;" id="btnDocSave" class="disPB btnBase">저장</a> 
							<a href="${_ctx}/board/doc/list.god?mapId=${boardDocDTO.mapId}" class="disPB btnBase">취소</a>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

</body>

</html>
