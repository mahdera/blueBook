<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%@page import="java.util.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<table border="0" width="100%">
	<tr>
		<td width="30%">
			<label id="lblrejectionreason">
				<%
					String lblRejectionReason = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrejectionreason");
					label = Label.getLabelUsingLabelId("lblrejectionreason");
	 				out.print(lblRejectionReason != null ? lblRejectionReason : label.getLabelCaption());
				%>
			</label>
		</td>
		<td>			
			<select name="slctrejectionreason" id="slctrejectionreason" style="width:100%">
			<option value="" selected="selected">--Select--</option>
			<%
				List<AdminField> rejectionReasonList = AdminField.getAllOptionValuesForThisFieldName("Rejection Reason");
				if(!rejectionReasonList.isEmpty()){
					Iterator<AdminField> rejectionReasonItr = rejectionReasonList.iterator();
					while(rejectionReasonItr.hasNext()){
						AdminField adminField = rejectionReasonItr.next();
						AdminFieldTranslation rejectionReasonAdminField = AdminFieldTranslation.
								getAdminFieldTranslationForThisLanguageAndAdminField(langId,adminField.getId());
						if(rejectionReasonAdminField != null){
						%>
							<option value="<%=rejectionReasonAdminField.getAdminFieldId() %>"><%=rejectionReasonAdminField.getTranslatedValue() %></option>
						<%
						}else{
						%>
							<option value="<%=adminField.getId() %>"><%=adminField.getOptionValue() %></option>
						<%
						}
					}//end while loop
				}
			%>
		</select>
		</td>
	</tr>
</table>