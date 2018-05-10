<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <script>

 var dialog

 $(function() {
	 dialog = $( "#dialog-form" ).dialog({
	       autoOpen: false,
	       height: 400,
	       width: 350,
	       modal: true,
	       buttons: {
	         "닫기": function() {
	           dialog.dialog( "close" );
	         }
	       },
	       close: function() {
	       }
	     });
	    dialog.dialog( "open" );

})
 
 </script>
 
 <div id="dialog-form" title="View User">
   <p class="ui-dialog-content">사용자 조회</p>
  
   <form>
     <fieldset>
       <label for="name">ID</label>
       <input type="text" name="loginId" id="loginId" value="${userDTO.loginId}" class="text ui-widget-content ui-corner-all" readonly>
       <label for="email">Email</label>
       <input type="text" name="email" id="email" value="${userDTO.email}" class="text ui-widget-content ui-corner-all" readonly>
       <label for="password">Phone</label>
       <input type="text" name="phone" id="phone" value="${userDTO.phone}" class="text ui-widget-content ui-corner-all" readonly>
  
       <!-- Allow form submission with keyboard without duplicating the dialog button -->
       <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
     </fieldset>
   </form>
 </div>