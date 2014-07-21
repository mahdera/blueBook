<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String fieldName = request.getParameter("fieldName");	
	List<AdminField> adminFieldList = AdminField.getAllOptionValuesForThisFieldName(fieldName);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(!adminFieldList.isEmpty()){
		Iterator<AdminField> adminFieldItr = adminFieldList.iterator();
		%>
		<table border="0" width="100%">
		<tr style="background:#eee;font-weight:bolder">
			<td><label id="lblserialnumber">
				<%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
					out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
				%>
				</label></td>
			<td><label id="lbloptionname">
				<%
					String lblOptionName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbloptionname");
					label = Label.getLabelUsingLabelId("lbloptionname");
					out.print(lblOptionName != null ? lblOptionName : label.getLabelCaption());
				%>
				</label></td>	
			<td><label id="lbldescription">
				<%
					String lblDescription = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldescription");
					label = Label.getLabelUsingLabelId("lbldescription");
					out.print(lblDescription != null ? lblDescription : label.getLabelCaption());
				%>
				</label></td>
			<td><label id="lbledit">
				<%
					String lblEdit = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbledit");
					label = Label.getLabelUsingLabelId("lbledit");
					out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
				%>
				</label></td>
				<td><label id="lbltranslate">
				<%
					String lblTranslate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltranslate");
					label = Label.getLabelUsingLabelId("lbltranslate");
					out.print(lblTranslate != null ? lblTranslate : label.getLabelCaption());
				%>
				</label></td>		
		</tr>
		<%
		int ctr=1;
		while(adminFieldItr.hasNext()){
			AdminField adminField = adminFieldItr.next();
			%>
			<tr>
				<td><%=ctr++ %></td>
				<td><%=adminField.getOptionValue() %></td>
				<td><%=adminField.getDescription() %></td>
				<td>
					<a href="#.jsp" onclick="showEditFieldsOfThisAdminFieldOption(<%=adminField.getId() %>);">Edit</a>
					|
					<a href="#.jsp" onclick="hideDiv(<%=adminField.getId() %>);">Hide</a>					
				</td>				
				<td>
					<a href="#.jsp" onclick="showTranslateFormForThisField(<%=adminField.getId() %>);">Translate</a>
				</td>
			</tr>
			<%
				String divId = "adminFieldOptionEditDiv" + adminField.getId();
			%>
			<tr>
				<td colspan="5">
					<div id="<%=divId %>"></div>
				</td>
			</tr>
			<%
		}//end while loop
		%>
		</table>
		<%
	}else{
		%>
		<p class="msg warning">This admin field does not have options defined under it!</p>
		<%
	}
%>
<div id="adminFieldOptionDetailDiv"></div>
<script type="text/javascript">
	function showEditFieldsOfThisAdminFieldOption(id){
		var divId = "adminFieldOptionEditDiv" + id;
		$('#'+divId).load('showeditfieldsofthisadminfieldoption.jsp?id='+id);		
	}
	
	function showTranslateFormForThisField(id){
		var divId = "adminFieldOptionEditDiv" + id;
		$('#'+divId).load('showtranslateformforthisfield.jsp?id='+id);
	}
	
	function hideDiv(id){
		var divId = "adminFieldOptionEditDiv" + id;
		$('#'+divId).html('');
	}
</script>