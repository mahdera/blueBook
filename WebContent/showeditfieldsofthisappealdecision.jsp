<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long id = Long.parseLong(request.getParameter("id"));
	AppealDecision appealDecision = AppealDecision.getAppealDecision(id);
	//now define the control names in here...
	String appealDecisionControlName = "slctappealdecision" + id;
	String buttonId = "btnupdate" + id;
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td>
						<font color="red">*</font>
						<label id="lblappealdecision">
							<strong>
							<%
								String lblAppealDecision = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealdecision");
								label = Label.getLabelUsingLabelId("lblappealdecision");
				 				out.print(lblAppealDecision != null ? lblAppealDecision : label.getLabelCaption());
				 			%>
				 			</strong>
						</label>						
					</td>
					<td>
							<select name="<%=appealDecisionControlName %>" id="<%=appealDecisionControlName %>" style="width:100%">
								<option value="" selected="selected">--Select--</option>
								<%
									List<AdminField> adminFieldList = AdminField.getAllOptionValuesForThisFieldName("Appeal Decision");
									if(!adminFieldList.isEmpty()){
										Iterator<AdminField> adminFieldItr = adminFieldList.iterator();
										while(adminFieldItr.hasNext()){
											AdminField adminField = adminFieldItr.next();
											AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
											
											if(adminFieldTranslation != null){
												if(adminFieldTranslation.getAdminFieldId() == appealDecision.getAppealDecisionId()){
													%>
														<option value="<%=adminFieldTranslation.getAdminFieldId() %>" selected="selected"><%=adminFieldTranslation.getTranslatedValue() %></option>
													<%
												}else{
													%>
														<option value="<%=adminFieldTranslation.getAdminFieldId() %>"><%=adminFieldTranslation.getTranslatedValue() %></option>
													<%
												}
											}else{
												if(adminField.getId() == appealDecision.getAppealDecisionId()){													
													%>
														<option value="<%=adminField.getId() %>" selected="selected"><%=adminField.getOptionValue() %></option>
													<%
												}else{
													%>
														<option value="<%=adminField.getId() %>"><%=adminField.getOptionValue() %></option>
													<%
												}	
											}										
										}//end while loop
									}
								%>
							</select>					
					</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<%
					String lblUpdateButtonLabel = "lblupdatebutton";
					String updateButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblupdateallbutton");
					label = Label.getLabelUsingLabelId("lblupdatebutton");
					String updateButtonCaption = updateButtonLabel != null ? updateButtonLabel : label.getLabelCaption();
					
					String lblUndoButtonLabel = "lblundobutton";
					String undoButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblundobutton");
					label = Label.getLabelUsingLabelId("lblupdatebutton");
					String undoButtonCaption = undoButtonLabel != null ? undoButtonLabel : label.getLabelCaption();
				%>
				<input type="button" value="<%=updateButtonCaption %>" class="input-submit" id="<%=buttonId %>"/>
				<input type="reset" value="<%=undoButtonCaption %>" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var id = "<%=id%>";
		var appealDecisionControlName = "slctappealdecision" + id;
		var buttonId = "btnupdate" + id;
		
		$('#'+buttonId).click(function(){
			var appealDecisionId = $('#'+appealDecisionControlName).val();
			if(appealDecisionId != ""){
				var dataString = "id="+id+"&appealDecisionId="+appealDecisionId;
				var divId = "subTabDetailDiv";
				$.ajax({
				    url: 'updateappealdecision.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){		    		
				    		$('#'+divId).html(response);					
				    },
				    error:function(error){
						alert(error);
				    }
				 });
			}
		});
	});
</script>