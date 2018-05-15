<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <script>

 var dialog;

 $(function() {
	 dialog = $( ".dialog-form" ).dialog({
	       autoOpen: false,
	       height: 700,
	       width: 900,
	       modal: false,
	       close: function() {
	       }
	        
	     });	
	    dialog.dialog( "open" );

})
 
 </script>

       <c:forEach items="${list}" var="popupDTO">
 	<c:if test="${popupDTO.popupYn == 'Y'}">
 <div class="dialog-form" title="${popupDTO.popTitle}" >
  
     <c:forEach items="${popupDTO.fileList}" var="file">
       <img src="${_ctx}/${file.imgPath}/${file.newImgName}.${file.imgExt}" style="width:850px"/><br/>

       </c:forEach>
 </div>
 </c:if>
        </c:forEach>
