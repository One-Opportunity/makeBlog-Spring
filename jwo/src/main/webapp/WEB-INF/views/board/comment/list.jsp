<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id ="deleteComment" class="replyWrap">

	<dl>
		<dt>작성자</dt>
		<dd>
			<input type="text" id="comments" placeholder="내용을 작성하세요" title="replyName" style="width: 85%; display: inline-block;"> 
			<a href="javascript:;" id="btnComment" class="disPB btnBase">댓글등록</a>
		</dd>
	</dl>
	<table class="replyList">
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr>
					<th class="name">${item.name}</th>
					<td class="cont">${item.comments}<a href="javascript:deleteComment(${item.commentId});" id="btnDelete" class="disPB btnS">삭제</a></td>
					<td class="date" style="width: 500px;"><fmt:formatDate value="${item.regDt}" pattern="yy년 MM월 dd일 a hh시 mm분" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>