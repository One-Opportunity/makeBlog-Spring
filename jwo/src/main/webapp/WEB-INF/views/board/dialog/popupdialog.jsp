<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <script>

 var dialog;

 $(function() {
	 dialog = $( ".dialog-form" ).dialog({
	       autoOpen: false,
	       height: 700,
	       width: 550,
	       modal: false,
	       close: function() {
	       }, 
	        show: {                // 애니메이션 효과 - 보여줄때
	            effect: "blind",
	            duration: 1000
	        }
	        , hide: {                // 애니메이션 효과 - 감출때
	            effect: "explode",
	            duration: 1000
	        }
	     });	
	    dialog.dialog( "open" );
			
})
 
 </script>

       <c:forEach items="${list}" var="popupDTO">
 	<c:if test="${popupDTO.popupYn == 'Y'}">
 <div class="dialog-form" title="${popupDTO.popTitle}" >
  
     <c:forEach items="${popupDTO.fileList}" var="file">
       <img src="${_ctx}/${file.imgPath}/${file.newImgName}.${file.imgExt}" id="img" style="width:500px"/><br/>

       </c:forEach>
 </div>
 </c:if>
        </c:forEach>
