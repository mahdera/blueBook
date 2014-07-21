<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String fieldName = request.getParameter("fieldName");
	//out.print(fieldName);
	List<AdminField> adminFieldList = AdminField.getAllOptionValuesForThisFieldName(fieldName);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(!adminFieldList.isEmpty()){
		Iterator<AdminField> adminFieldItr = adminFieldList.iterator();
		%>
		<table border="0" width="100%">
		<tr style="background:#eee">
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
			<td><labe id="lbldelete">
				<%
					String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
					label = Label.getLabelUsingLabelId("lbldelete");
					out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
				%>
			</labe></td>		
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
					<a href="#.jsp" onclick="deleteThisAdminFieldOption(<%=adminField.getId() %>);">Delete</a>
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
	function deleteThisAdminFieldOption(id){
		if(window.confirm('Are you sure you want to delete this admin field option?')){
			var dataString = "id="+id;
			$.ajax({
			    url: 'deletethisadminfieldoption.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){		    		
			    		$('#fieldDetailDiv').html(response);					
			    },
			    error:function(error){
					alert(error);
			    }
			 });			
		}
	}
</script>