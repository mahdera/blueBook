<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	int languageId = Integer.parseInt(request.getParameter("languageId"));
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;

	List<LanguageTranslation> languageTranslationList = LanguageTranslation.getAllLanguageTranslationsForThisLanguage(languageId);
	if(!languageTranslationList.isEmpty()){
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-weight:bolder">
				<td><label id="lblserialnumber"><%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
					out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
				%></label></td>
				<td><label id="lbllabel"><%
					String lblLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllabel");
					label = Label.getLabelUsingLabelId("lbllabel");
					out.print(lblLabel != null ? lblLabel : label.getLabelCaption());
				%></label></td>
				<td><label id="lbltranslatedvalue"><%
					String lblTranslatedValue = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltranslatedvalue");
					label = Label.getLabelUsingLabelId("lbltranslatedvalue");
					out.print(lblTranslatedValue != null ? lblTranslatedValue : label.getLabelCaption());
				%></label></td>	
				<td><label id="lbldelete"><%
					String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
					label = Label.getLabelUsingLabelId("lbldelete");
					out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
				%></label></td>			
			</tr>
		<%
		Iterator<LanguageTranslation> languageTranslationItr = languageTranslationList.iterator();
		int ctr=1;
		while(languageTranslationItr.hasNext()){
			LanguageTranslation languageTranslation = languageTranslationItr.next();
		    label = Label.getLabel(languageTranslation.getLabelId());
			%>
			<tr>
				<td><%=ctr++ %></td>
				<td><%=label.getLabelCaption() %></td>
				<td><%=languageTranslation.getTranslatedValue() %></td>
				<td>
					<a href="#.jsp" onclick="deleteThisLanguageTranslation(<%=languageTranslation.getId() %>);">Delete Translation</a>
				</td>
			</tr>			
			<%
		}//end while loop
	}else{
		out.print("<p class='msg warning'>There is no translation found for the selected language!</p>");
	}
%>
<script type="text/javascript">
	function deleteThisLanguageTranslation(id){
		if(window.confirm("Are you sure you want to delete this language translation?")){
			var dataString = "id="+id;
			$.ajax({					
			    url: 'deletetranslation.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){			    		
			    		$('#translationDiv').load(response);				    		
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}
	}
</script>