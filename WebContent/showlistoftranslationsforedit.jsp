<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%@page import="java.util.*"%>
<%
	List<Language> languageList = Language.getAllLanguages();
	Iterator<Language> languageItr = languageList.iterator();
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td><label id="lbllanguage"><%
					String lblLanguage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllanguage");
					label = Label.getLabelUsingLabelId("lbllanguage");
					out.print(lblLanguage != null ? lblLanguage : label.getLabelCaption());
				%></label></td>
			<td>
				<select name="slctlanguage" id="slctlanguage" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						while(languageItr.hasNext()){
							Language language = languageItr.next();
							%>
							<option value="<%=language.getId() %>"><%=language.getLanguage() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
		</tr>
	</table>
</form>
<div id="translationOfThisLanguageDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#slctlanguage').change(function(){
			var languageId = $('#slctlanguage').val();
			if(languageId != ""){
				$('#translationOfThisLanguageDiv').load("showlistoftranslationsforthislanguageforedit.jsp?languageId="+languageId);
			}
		});
	});//end document.ready function
</script>