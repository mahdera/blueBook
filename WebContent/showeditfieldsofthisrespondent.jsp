<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	int respondentId = Integer.parseInt(request.getParameter("respondentId"));
	Respondent r = Respondent.getRespondent(respondentId);
	RespondentAddress rAddress = RespondentAddress.getRespondentAddressForThisRespondent(r.getId());
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	//now define the control names in here...
	String nameControlName = "txtname" + respondentId;
	String structureControlName = "txtstructure" + respondentId;
	String sectorControlName = "txtsector" + respondentId;
	String regionControlName = "slctregion" + respondentId;
	String woredaControlName = "slctworeda" + respondentId;
	String kebeleControlName = "txtkebele" + respondentId;
	String telephoneControlName = "txttelephone" + respondentId;
	String mobileControlName = "txtmobile" + respondentId;
	String faxControlName = "txtfax" + respondentId;
	String poboxControlName = "txtpobox" + respondentId;
	String emailControlName = "txtemail" + respondentId;
%>
<form>
<table border="0" width="100%" style="background:lightyellow">	
	<tr>
		<td><label id="lblname"><%
					String lblName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblname");
					label = Label.getLabelUsingLabelId("lblname");
	 				out.print(lblName != null ? lblName : label.getLabelCaption());
	 			%></label></td>
		<td>
			<input type="text" name="<%=nameControlName %>" id="<%=nameControlName %>" style="width:40%" value="<%=r.getName() %>"/>
		</td>
	</tr>
	<tr>
		<td><label id="lblstructure"><%
					String lblStructure = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblstructure");
					label = Label.getLabelUsingLabelId("lblstructure");
	 				out.print(lblStructure != null ? lblStructure : label.getLabelCaption());
	 			%></label></td>
		<td>
			<input type="text" name="<%=structureControlName %>" id="<%=structureControlName %>" style="width:40%" value="<%=r.getStructure() %>"/>
		</td>
	</tr>	
	<tr>
		<td><label id="lblsector"><%
					String lblSector = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsector");
					label = Label.getLabelUsingLabelId("lblsector");
	 				out.print(lblSector != null ? lblSector : label.getLabelCaption());
	 			%></label></td>
		<td>
			<input type="text" name="<%=sectorControlName %>" id="<%=sectorControlName %>" style="width:40%" value="<%=r.getSector() %>"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<fieldset>
			<legend><label id="lblrespondentaddress"><%
					String lblRespondentAddress = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentaddress");
					label = Label.getLabelUsingLabelId("lblrespondentaddress");
	 				out.print(lblRespondentAddress != null ? lblRespondentAddress : label.getLabelCaption());
	 			%></label></legend>
			<table border="0" width="100%">
				<tr>
					<td width="30%"><label id="lblregion"><%
					String lblRegion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregion");
					label = Label.getLabelUsingLabelId("lblregion");
	 				out.print(lblRegion != null ? lblRegion : label.getLabelCaption());
	 			%></label></td>
					<td>
						<select name="<%=regionControlName %>" id="<%=regionControlName %>" style="width:50%">
							<option value="" selected="selected">--Select--</option>
							<%
								List<AdminField> regionList = AdminField.getAllOptionValuesForThisFieldName("Region");
								if(!regionList.isEmpty()){
									Iterator<AdminField> regionItr = regionList.iterator();
									while(regionItr.hasNext()){
										AdminField adminField = regionItr.next();
										AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
										if(adminFieldTranslation != null){
											if(adminFieldTranslation.getAdminFieldId() == rAddress.getRegionId()){
											%>
												<option value="<%=adminFieldTranslation.getAdminFieldId() %>" selected="selected"><%=adminFieldTranslation.getTranslatedValue() %></option>
											<%
											}else{
											%>
												<option value="<%=adminFieldTranslation.getAdminFieldId() %>"><%=adminFieldTranslation.getTranslatedValue() %></option>
											<%	
											}
										}else{
											if(adminField.getId() == rAddress.getRegionId()){
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
					<td><label id="lblworeda"><%
					String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
					label = Label.getLabelUsingLabelId("lblworeda");
	 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
	 			%></label></td>
					<td>
						<select name="<%=woredaControlName %>" id="<%=woredaControlName %>" style="width:50%">
							<option value="" selected="selected">--Select--</option>
							<%
								List<AdminField> woredaList = AdminField.getAllOptionValuesForThisFieldName("Woreda");
								if(!woredaList.isEmpty()){
									Iterator<AdminField> woredaItr = woredaList.iterator();
									while(woredaItr.hasNext()){
										AdminField adminField = woredaItr.next();
										AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
										if(adminFieldTranslation != null){
											if(adminFieldTranslation.getAdminFieldId() == rAddress.getWoredaId()){
											%>
												<option value="<%=adminFieldTranslation.getAdminFieldId() %>" selected="selected"><%=adminFieldTranslation.getTranslatedValue() %></option>
											<%
											}else{
											%>
												<option value="<%=adminFieldTranslation.getAdminFieldId() %>"><%=adminFieldTranslation.getTranslatedValue() %></option>
											<%	
											}
										}else{
											if(adminField.getId() == rAddress.getWoredaId()){
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
					<td><label id="lblkebele"><%
					String lblKebele = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblkebele");
					label = Label.getLabelUsingLabelId("lblkebele");
	 				out.print(lblKebele != null ? lblKebele : label.getLabelCaption());
	 			%></label></td>
					<td>
						<input type="text" name="<%=kebeleControlName %>" id="<%=kebeleControlName %>" value="<%=rAddress.getKebele() %>"/>
					</td>
				</tr>
				<tr>
					<td><label id="lbltelephone"><%
					String lblTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltelephone");
					label = Label.getLabelUsingLabelId("lbltelephone");
	 				out.print(lblTelephone != null ? lblTelephone : label.getLabelCaption());
	 			%></label></td>
					<td>
						<input type="text" name="<%=telephoneControlName %>" id="<%=telephoneControlName %>" value="<%=rAddress.getTelephone() %>"/>
					</td>
				</tr>
				<tr>
					<td><label id="lblmobile"><%
					String lblMobile = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmobile");
					label = Label.getLabelUsingLabelId("lblmobile");
	 				out.print(lblMobile != null ? lblMobile : label.getLabelCaption());
	 			%></label></td>
					<td>
						<input type="text" name="<%=mobileControlName %>" id="<%=mobileControlName %>" value="<%=rAddress.getMobile() %>"/>
					</td>
				</tr>
				<tr>
					<td><label id="lblfax"><%
					String lblFax = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfax");
					label = Label.getLabelUsingLabelId("lblfax");
	 				out.print(lblFax != null ? lblFax : label.getLabelCaption());
	 			%></label></td>
					<td>
						<input type="text" name="<%=faxControlName %>" id="<%=faxControlName %>" value="<%=rAddress.getFax() %>"/>
					</td>
				</tr>
				<tr>
					<td><label id="lblpobox"><%
					String lblPobox = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpobox");
					label = Label.getLabelUsingLabelId("lblpobox");
	 				out.print(lblPobox != null ? lblPobox : label.getLabelCaption());
	 			%></label></td>
					<td>
						<input type="text" name="<%=poboxControlName %>" id="<%=poboxControlName %>" value="<%=rAddress.getPobox() %>"/>
					</td>
				</tr>
				<tr>
					<td><label id="lblemail"><%
					String lblEmail = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblemail");
					label = Label.getLabelUsingLabelId("lblemail");
	 				out.print(lblEmail != null ? lblEmail : label.getLabelCaption());
	 			%></label></td>
					<td>
						<input type="text" name="<%=emailControlName %>" id="<%=emailControlName %>" value="<%=rAddress.getEmail() %>"/>
					</td>
				</tr>
			</table>
			</fieldset>
		</td>
	</tr>	
	<tr>		
		<td colspan="2" align="right">
			<%
				String buttonId = "btnupdate" + respondentId;
				String lblUpdateButtonLabel = "lblupdatebutton";
				String updateButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblupdateallbutton");
				label = Label.getLabelUsingLabelId("lblupdatebutton");
				String updateButtonCaption = updateButtonLabel != null ? updateButtonLabel : label.getLabelCaption();
				
				String lblUndoButtonLabel = "lblundobutton";
				String undoButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblundobutton");
				label = Label.getLabelUsingLabelId("lblupdatebutton");
				String undoButtonCaption = undoButtonLabel != null ? undoButtonLabel : label.getLabelCaption();
			%>
			<input type="button" value = "<%=updateButtonCaption %>" class="input-submit" id="<%=buttonId %>"/>
			<input type="reset" value="<%=undoButtonCaption %>" class="input-submit"/>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var respondentId = "<%=respondentId%>";
		
		var buttonId = "btnupdate" + respondentId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var nameControlName = "txtname" + respondentId;
			var structureControlName = "txtstructure" + respondentId;
			var sectorControlName = "txtsector" + respondentId;
			var regionControlName = "slctregion" + respondentId;
			var woredaControlName = "slctworeda" + respondentId;
			var kebeleControlName = "txtkebele" + respondentId;
			var telephoneControlName = "txttelephone" + respondentId;
			var mobileControlName = "txtmobile" + respondentId;
			var faxControlName = "txtfax" + respondentId;
			var poboxControlName = "txtpobox" + respondentId;
			var emailControlName = "txtemail" + respondentId;
			//now get the values...
			var name = $('#'+nameControlName).val();
			var structure = $('#'+structureControlName).val();
			var sector = $('#'+sectorControlName).val();
			var region = $('#'+regionControlName).val();
			var woreda = $('#'+woredaControlName).val();
			var kebele = $('#'+kebeleControlName).val();
			var telephone = $('#'+telephoneControlName).val();
			var mobile = $('#'+mobileControlName).val();
			var fax = $('#'+faxControlName).val();
			var pobox = $('#'+poboxControlName).val();
			var email = $('#'+emailControlName).val();
			//now build the dataString variable...
			var dataString = "respondentId="+respondentId+"&name="+name+"&structure="+
			 structure+"&sector="+sector+"&region="+region+"&woreda="+woreda+"&kebele="+kebele+
			 "&telephone="+telephone+"&mobile="+mobile+"&fax="+fax+"&pobox="+pobox+"&email="+email;
			$.ajax({					
			    url: 'updaterespondent.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){   
			    		var divId = "respondentEditDiv"+respondentId;			    		
			    		$('#'+divId).html(response);			    		
			    },
			    error:function(error){
					alert(error);
			    }
			});
		});//end button.update click
	});//end document.ready function
</script>