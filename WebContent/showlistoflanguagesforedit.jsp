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
		<td><label id="lbledit"><%
					String lblEdit = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbledit");
					label = Label.getLabelUsingLabelId("lbledit");
					out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
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
					<a href="#.jsp" onclick="showEditFieldsOfThisLanguage(<%=language.getId() %>)">Edit</a>
					|
					<a href="#.jsp" onclick="hideEditFieldsOfThisLanguage(<%=language.getId() %>)">Hide</a>
				</td>
			</tr>
			<%
				String divId = "languageEditDiv" + language.getId();
			%>
			<tr>
				<td colspan="3">
					<div id="<%=divId%>"></div>
				</td>
			</tr>
			<%
		}//end while loop
	%>
</table>
<script type="text/javascript">
	function showEditFieldsOfThisLanguage(languageId){
		var divId = "languageEditDiv" + languageId;
		$('#'+divId).load("showeditfieldsofthislanguage.jsp?languageId="+languageId);
	}
	
	function hideEditFieldsOfThisLanguage(languageId){
		var divId = "languageEditDiv" + languageId;
		$('#'+divId).html('');
	}
</script>