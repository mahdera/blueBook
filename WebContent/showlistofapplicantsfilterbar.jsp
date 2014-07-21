<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "applicantManagement";
	//Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	//Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true){
		int langId = Integer.parseInt(session.getAttribute("langId").toString());
		Label label = null;
%>
<form style="background: #eee">
	<table border="0" width="100%">
		<tr>
			<td><label id="lblregion">
				<%
					String lblRegion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregion");
					label = Label.getLabelUsingLabelId("lblregion");
	 				out.print(lblRegion != null ? lblRegion : label.getLabelCaption());
	 			%>
			</label></td>
			<td>
				<select name="slctregion" id="slctregion" style="width: 90%">
					<option value="" selected="selected">--Select--</option>					
					<%
						List<AdminField> regionList = AdminField.getAllOptionValuesForThisFieldName("Region");
						if (!regionList.isEmpty()) {
							Iterator<AdminField> regionItr = regionList.iterator();
							while (regionItr.hasNext()) {
								AdminField region = regionItr.next();
								AdminFieldTranslation regionTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, region.getId());
								if(regionTranslation != null){
								%>
									<option value="<%=regionTranslation.getAdminFieldId() %>"><%=regionTranslation.getTranslatedValue() %></option>
								<%
								}else{
								%>
									<option value="<%=region.getId() %>"><%=region.getOptionValue()%></option>
								<%
								}
						}//end while looop
					}
					%>
				</select>
			</td>
			<td><label id="lblzone">
				<%
					String lblZone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblzone");
					label = Label.getLabelUsingLabelId("lblzone");
	 				out.print(lblZone != null ? lblZone : label.getLabelCaption());
	 			%>
			</label></td>
			<td>
				<select name="slctzone" id="slctzone" style="width: 90%">
					<option value="" selected="selected">--Select--</option>
					<option value="all">All/ሁሉም</option>
					<%
						List<AdminField> zoneList = AdminField.getAllOptionValuesForThisFieldName("Zone");
						if (!zoneList.isEmpty()) {
							Iterator<AdminField> zoneItr = zoneList.iterator();
							while (zoneItr.hasNext()) {
								AdminField zone = zoneItr.next();
								AdminFieldTranslation zoneTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, zone.getId());
								if(zoneTranslation != null){
								%>
									<option value="<%=zoneTranslation.getAdminFieldId() %>"><%=zoneTranslation.getTranslatedValue() %></option>
								<%	
								}else{
								%>
									<option value="<%=zone.getId() %>"><%=zone.getOptionValue()%></option>
								<%
								}
							}//end while looop
						}
					%>
				</select>
			</td>
			<td><label id="lblworeda">
				<%
					String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
					label = Label.getLabelUsingLabelId("lblworeda");
	 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
	 			%>
			</label></td>
			<td>
				<select name="slctworeda" id="slctworeda" style="width: 90%">
					<option value="" selected="selected">--Select--</option>
					<option value="all">All/ሁሉም</option>
					<%
						List<AdminField> woredaList = AdminField.getAllOptionValuesForThisFieldName("Woreda");
						if (!woredaList.isEmpty()) {
							Iterator<AdminField> woredaItr = woredaList.iterator();
							while (woredaItr.hasNext()) {
								AdminField woreda = woredaItr.next();
								AdminFieldTranslation woredaTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, woreda.getId());
								if(woredaTranslation != null){
								%>
									<option value="<%=woredaTranslation.getAdminFieldId() %>"><%=woredaTranslation.getTranslatedValue() %></option>
								<%
								}else{
								%>
									<option value="<%=woreda.getId() %>"><%=woreda.getOptionValue()%></option>
								<%
								}
							}//end while looop
						}
					%>
			</select>
		</td>
		</tr>
		<tr>
			<td colspan="6" align="right">
				<%
					String lblShowButtonLabel = "lblshowbutton";
					String showButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblshowbutton");
					label = Label.getLabelUsingLabelId("lblshowbutton");
					String showButtonCaption = showButtonLabel != null ? showButtonLabel : label.getLabelCaption();
					//////
					String lblResetButtonLabel = "lblresetbutton";
					String resetButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId, "lblresetbutton");
					label = Label.getLabelUsingLabelId("lblresetbutton");
					String resetButtonCaption = resetButtonLabel != null ? resetButtonLabel : label.getLabelCaption();
				%>
				<input type="button" id="btnshow" value="<%=showButtonCaption %>" class="input-submit"/>
				<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<div id="applicantListDiv"></div>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnshow').click(function(){
			var region = $('#slctregion').val();
			var zone = $('#slctzone').val();
			var woreda = $('#slctworeda').val();			
			var dataString = "region="+region+"&zone="+zone+"&woreda="+woreda;
			
			$.ajax({
			    url: 'showlistofapplicantsfromthisregionzoneandworeda.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){			    		
			    		$('#applicantListDiv').html(response);					
			    },
			    error:function(error){
					alert(error);
			    }
			});			
		});//end button.click function
	});//end document.ready function
</script>