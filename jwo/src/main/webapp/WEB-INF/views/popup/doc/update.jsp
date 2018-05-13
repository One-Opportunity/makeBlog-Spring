<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:import url="/WEB-INF/views/inc/head.jsp" />
<script>

$(function() {
	var popYn = $("#popYn").val();
	if(popYn == 'Y') {
		$("#popY").attr('checked', true);
	} else {
		$("#popN").attr('checked', true);
	}
	$("#btnPopSave").click(function() {
		if ($("#frmWrite").valid()) {
			$("#frmWrite").submit();
		}
	});
});

function addFile() {
	var appendingFileHtml = "<input type='file' name='files' style='width:90%' accept='image/gif, image/jpeg, image/png'/> <img src=${_ctx}/res/images/del.jpg style='width:25px; cursor:pointer;' onclick='delFile(this)'/>";	var size = $("td#tdFile > input[type=file]").length;
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
		<input type="hidden" id="popYn" value="${popupDTO.popupYn}"/>
			<div class="rightBlock">
				<div class="page_top">
					<h1></h1>
				</div>

				<div class="boardWrap">
					
					<form id="frmWrite" name="frmWrite" action="${_ctx}/popup/doc/update.god" method="post" enctype="multipart/form-data">
						
						<input type="hidden" name="popId" value="${popupDTO.popId}"/>
						<table class="base_tbl tbl_write">
							<tbody>
								<tr>
									<th width="20%" class="t_color">제목입력</th>
									<td><input type="text" id="title" name="popTitle" required="required" value="${popupDTO.popTitle}"/></td>
								</tr>

								<tr>
									<th width="8%" class="t_color">활성화여부</th>
									<td>YES <input type="radio" id="popY" name="popupYn" value="Y" style="width:15px;height:15px;border:1px;"/> &nbsp;&nbsp;&nbsp;&nbsp;
										NO <input type="radio" id="popN" name="popupYn" value="N" style="width:15px;height:15px;border:1px;"/></td>
								</tr>
								<tr>
									<th class="t_color">이미지 등록 <a href="javascript:addFile();" style="padding: 5px;" id="btnFile" class="disPB btnBase">추가</a>
									</th>
									<td id="tdFile"></td>

								</tr>
								<c:forEach items="${popupDTO.fileList}" var="item">
									<tr>
									<th class="t_color">첨부파일 삭제</th>

									<td>
									<input type="checkbox" name="delFiles" value="${item.popImgId}" style="display: inline-block; width:15px;height:15px;" />
									<img src="${_ctx}/${item.imgPath}/${item.newImgName}.${item.imgExt}" style="width: 100px" />
									
									</td>
								</tr>

								</c:forEach>
							</tbody>
						</table>

						<div class="btnSet alignCenter">
							<a href="javascript:;" id="btnPopSave" class="disPB btnBase">저장</a> 
							<a href="${_ctx}/popup/doc/list.god" class="disPB btnBase">취소</a>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

</body>

</html>
