<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <script>

 var dialog;

 $(function() {
	 dialog = $( ".dialog-form" ).dialog({
	       autoOpen: false,
	       height: 300,
	       width: 400,
	       modal: false,
	       close: function() {
	       }
	        
	     });	
	    dialog.dialog( "open" );
	$("#btnSecret").click(function(){
		var secretPwC = $("#secretWritePwC").val();
		var secretPw = $("#secretWritePw").val();
		if(secretPw == secretPwC) {
			document.location.href = "${_ctx}/board/doc/view.god?docId=${docId}&mapId=${mapId}"
		}
		
	})
	
});
 
 </script>

 <div class="dialog-form" title="잠겨있습니다, 비밀번호를 입력하세요." >
 <input type="hidden" id="secretWritePw" value="${secretWritePw}"/>
  <input type="password" id="secretWritePwC"/>
  <a id="btnSecret" href="javascript:;"> 확인</a>
 </div>
