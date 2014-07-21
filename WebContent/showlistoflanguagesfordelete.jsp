<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<Language> languageList = Language.getAllLanguages();
	Iterator<Language> languageItr = languageList.iterator();
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<table border="0" width="100%">
	<tr style="background:#eee;font-weight:bolder;font-size:12pt">
		<td><label id="lblserialnumber"><%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
					out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
				%></label></td>
		<td><label id="lbllanguagename"><%
					String lblLanguageName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllanguagename");
					label = Label.getLabelUsingLabelId("lbllanguagename");
					out.print(lblLanguageName != null ? lblLanguageName : label.getLabelCaption());
				%></label></td>
		<td><label id="lbldelete"><%
					String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
					label = Label.getLabelUsingLabelId("lbldelete");
					out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
				%></label></td>		
	</tr>
	<%
		int ctr=1;
		while(languageItr.hasNext()){
			Language language = languageItr.next();
			%>
			<tr>
				<td><%=ctr++ %></td>
				<td><%=language.getLanguage() %></td>
				<td>
					<a href="#.jsp" onclick="deleteThisLanguage(<%=language.getId() %>)">Delete</a>					
				</td>
			</tr>			
			<%
		}//end while loop
	%>
</table>
<script type="text/javascript">
	function deleteThisLanguage(languageId){
		if(window.confirm('Are you sure you want to delete this language?')){
			var dataString = "id="+languageId;
			$.ajax({					
			    url: 'deletelanguage.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){			    		
			    		$('#languageManagementDiv').load("showlistoflanguagesfordelete.jsp");				    		
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}//end confirmation if...condition.
	}
</script>