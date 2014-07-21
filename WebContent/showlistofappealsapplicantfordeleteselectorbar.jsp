<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "investigationManagement";	
	if(true){
%>
<table border="0" width="100%">
	<tr>
		<td><label id="lblenterafilenumber"><%
					String lblEnterAFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenterafilenumber");
					label = Label.getLabelUsingLabelId("lblenterafilenumber");
	 				out.print(lblEnterAFileNumber != null ? lblEnterAFileNumber : label.getLabelCaption());
	 			%></label></td>
		<td>
			<%				
				String searchButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsearch");
				label = Label.getLabelUsingLabelId("lblsearch");
				String searchButtonCaption = searchButtonLabel != null ? searchButtonLabel : label.getLabelCaption();				
			%>
			<input type="text" name="txtfilenumber" id="txtfilenumber" size="50"/>
			<input type="button" id="btnsearch" value="<%=searchButtonCaption%>"/>
		</td>
	</tr>
</table>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<div id="newAppealDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#txtfilenumber').focus();
		
		$('#btnsearch').click(function(){			
			var fileNumber = $('#txtfilenumber').val().trim();
			if(fileNumber != ""){
				$('#newAppealDiv').load('searchandshowlistofappealsforfilenumberfordelete.jsp?fileNumber='+fileNumber);
			}
		});
	});//end document.ready function
</script>