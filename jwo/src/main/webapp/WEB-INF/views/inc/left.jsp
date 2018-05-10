<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	$(function() {

		loadTreeMap();
	});
	
	// 통합맵 가져오기
	function loadTreeMap() {
		d = new dTree('d');
		var url = "${_ctx}/board/map/list.god";
		$.get(url, function(json) {
			if ($.isArray(json)) {
				$(json).each(
						function(index) {
							console.log(this);
							if (this.parMapId == null) {
								d.add(this.mapId, -1, this.mapName, "javascript:;");
							} else {
								d.add(this.mapId, this.parMapId, this.mapName, "${_ctx}/board/doc/list.god?mapId=" + this.mapId);
							}
						});
								d.add(100000, 1, "팝업관리", "${_ctx}/popup/doc/list.god");
// 				console.log(d.toString());
				$("#dtree").html(d.toString());
			}
		});
	}
// 	function listInLeft(mapId) {
// 		document.location.href = "${_ctx}/board/doc/list.god?mapId" + mapId;
// 	}
</script>

<div id="leftWrap">

	<div id="infoWrap">
		<div class="info_txt">
			<p class="info_name">${_user.loginId}</p>
			<p class="info_name">${_user.name}</p>
			<p class="info_date"><fmt:formatDate value="${_user.regDt}" pattern="yyyy.MM.dd HH시 mm분"/> </p>
			<p class="info_pic">
				<img src="${_ctx}/res/images/thum_img.jpg" alt="thum">
			</p>
		</div>
		<span>
		<a href="${_ctx}/board/doc/myupdate.god" style="width: 45%; display: inline-block;">정보수정</a>
		<a href="${_ctx}/logout.god" style="width: 45%; display: inline-block;">Logout</a>
		</span>

	</div>

	<div id="category">

		<!-- dtree 시작 -->
		<div class="dtree" id="dtree"></div>
		<!-- dtree 끝 -->

	</div>

</div>