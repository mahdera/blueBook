<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%@page import="java.util.*" %>
<form name="frmchangeusername" id="frmchangeusername">
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "applicantManagement";
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(true)	{		
%>
<div id="errorDiv"></div>
<table border="0" width="100%" style="background:#eee">
	<tr>
		<td colspan="3">
			<div id="usernameErrorDiv"></div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<fieldset>
				<legend><label id="lblapplicantbasicinformation">					
					<%
						String lblApplicantBasicInformation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantbasicinformation");
						label = Label.getLabelUsingLabelId("lblapplicantbasicinformation");
		 				out.print(lblApplicantBasicInformation != null ? lblApplicantBasicInformation : label.getLabelCaption());
		 			%>
				</label></legend>
				<table border="0" width="100%">
				<tr>
					<td align="left" width="33%">
						<font color="red">*</font>
						<label id="lblapplicantidnumber">
							<%
								String lblApplicantIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantidnumber");
								label = Label.getLabelUsingLabelId("lblapplicantidnumber");
				 				out.print(lblApplicantIdNumber != null ? lblApplicantIdNumber : label.getLabelCaption());
				 			%>
						</label><br/>
						<input type="text" name="txtapplicantidnumber" id="txtapplicantidnumber" style="width:90%" readonly="readonly"/>						
					</td>
					<td>
						<font color="red">*</font>
						<label id="lblfullname">							
							<%
								String lblFullName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfullname");
								label = Label.getLabelUsingLabelId("lblfullname");
				 				out.print(lblFullName != null ? lblFullName : label.getLabelCaption());
				 			%>
						</label><br/>
						<input type="text" name="txtfullname" id="txtfullname" style="width:90%"/>
					</td>
					<td>
						<font color="red">*</font>
						<label id="lblsex">
							<%
								String lblSex = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsex");
								label = Label.getLabelUsingLabelId("lblsex");
				 				out.print(lblSex != null ? lblSex : label.getLabelCaption());
				 			%>							
						</label><br/>
						<select name="slctsex" id="slctsex" style="width:90%">
							<option value="" selected="selected">--Select--</option>
							<option value="Male">Male/ወንድ</option>
							<option value="Female">Female/ሴት</option>
							<option value="NI">Not Identified/ያልተለየ</option>
						</select>
					</td>		
				</tr>
				<tr>
					<td align="left">
						<font color="red">*</font>
						<label id="lblagecategory">
							<%
								String lblAgeCategory = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblagecategory");
								label = Label.getLabelUsingLabelId("lblagecategory");
				 				out.print(lblAgeCategory != null ? lblAgeCategory : label.getLabelCaption());
				 			%>
						</label><br/>
						<select name="slctagecategory" id="slctagecategory" style="width:90%">
							<option value="" selected="selected">--Select--</option>
							<option value="18-25">18-25</option>
							<option value="26-35">26-35</option>
							<option value="35-55">35-55</option>
							<option value="55-70">55-70</option>
							<option value="Above 70">Above 70</option>
						</select>
					</td>
					<td>
						<label id="lblmaleapplicants">
							<%
								String lblMaleApplicants = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmaleapplicants");
								label = Label.getLabelUsingLabelId("lblmaleapplicants");
				 				out.print(lblMaleApplicants != null ? lblMaleApplicants : label.getLabelCaption());
				 			%>
						</label><br/>
						<input type="text" name="txtnumberofapplicantsmale" id="txtnumberofapplicantsmale" style="width:90%" value="0"/>
					</td>
					<td>
						<label id="lblfemaleapplicants">
							<%
								String lblFemaleApplicants = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfemaleapplicants");
								label = Label.getLabelUsingLabelId("lblfemaleapplicants");
				 				out.print(lblFemaleApplicants != null ? lblFemaleApplicants : label.getLabelCaption());
				 			%>
						</label><br/>
						<input type="text" name="txtnumberofapplicantsfemale" id="txtnumberofapplicantsfemale" style="width:90%" value="0"/>
					</td>		
				</tr>
				<tr>
					<td align="left">
						<label id="lbloccupation">
							<%
								String lblOccupation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbloccupation");
								label = Label.getLabelUsingLabelId("lbloccupation");
				 				out.print(lblOccupation != null ? lblOccupation : label.getLabelCaption());
				 			%>
						</label><br/>
						<input type="text" name="txtoccupation" id="txtoccupation" style="width:90%"/>
					</td>
					<td>
						<label id="lbldisability">
							<%
								String lblDisability = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldisability");
								label = Label.getLabelUsingLabelId("lbldisability");
				 				out.print(lblDisability != null ? lblDisability : label.getLabelCaption());
				 			%>
						</label><br/>
						<input type="text" name="txtdisability" id="txtdisability" style="width:90%"/>
					</td>
					<td>
						
					</td>		
				</tr>	
				</table>
				</fieldset>
			</td>
	</tr>
	<tr>
		<td colspan="3">
			<fieldset>
				<legend><label id="lblapplicantaddress">
					<%
						String lblApplicantAddress = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantaddress");
						label = Label.getLabelUsingLabelId("lblapplicantaddress");
		 				out.print(lblApplicantAddress != null ? lblApplicantAddress : label.getLabelCaption());
		 			%>
				</label></legend>
				<table border="0" width="100%">
					<tr>
						<td align="left" width="33%">
							<font color="red">*</font>
							<label id="lblregion">
								<%
									String lblRegion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregion");
									label = Label.getLabelUsingLabelId("lblregion");
					 				out.print(lblRegion != null ? lblRegion : label.getLabelCaption());
					 			%>
							</label><br/>
							<select name="slctregion" id="slctregion" style="width:90%">
								<option value="">--Select--</option>
								<%
									List<AdminField> regionList = AdminField.getAllOptionValuesForThisFieldName("Region");
									if(!regionList.isEmpty()){
										Iterator<AdminField> regionItr = regionList.iterator();
										while(regionItr.hasNext()){
											AdminField region = regionItr.next();
											AdminFieldTranslation regionTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, region.getId());
											if(regionTranslation != null){
											%>
												<option value="<%=regionTranslation.getAdminFieldId() %>"><%=regionTranslation.getTranslatedValue() %></option>
											<%
											}else{
											%>
												<option value="<%=region.getId() %>"><%=region.getOptionValue() %></option>
											<%
											}
										}//end while looop
									}
								%>
							</select>
						</td>
						<td width="33%">
							<font color="red">*</font>
							<label id="lblzone">
								<%
									String lblZone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblzone");
									label = Label.getLabelUsingLabelId("lblzone");
					 				out.print(lblZone != null ? lblZone : label.getLabelCaption());
					 			%>
							</label><br/>
							<select name="slctzone" id="slctzone" style="width:90%">
								<option value="">--Select--</option>
								<%
									List<AdminField> zoneList = AdminField.getAllOptionValuesForThisFieldName("Zone");
									if(!zoneList.isEmpty()){
										Iterator<AdminField> zoneItr = zoneList.iterator();
										while(zoneItr.hasNext()){
											AdminField zone = zoneItr.next();
											AdminFieldTranslation zoneTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, zone.getId());
											if(zoneTranslation != null){
											%>
												<option value="<%=zoneTranslation.getAdminFieldId() %>"><%=zoneTranslation.getTranslatedValue() %></option>
											<%
											}else{
											%>
												<option value="<%=zone.getId() %>"><%=zone.getOptionValue() %></option>
											<%
											}
										}//end while looop
									}
								%>
							</select>
						</td>
						<td>
							<font color="red">*</font>
							<label id="lblworeda">
								<%
									String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
									label = Label.getLabelUsingLabelId("lblworeda");
					 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
					 			%>
							</label>
							<br/>
							<select name="slctworeda" id="slctworeda" style="width:90%">
								<option value="">--Select--</option>
								<%
									List<AdminField> woredaList = AdminField.getAllOptionValuesForThisFieldName("Woreda");
									if(!woredaList.isEmpty()){
										Iterator<AdminField> woredaItr = woredaList.iterator();
										while(woredaItr.hasNext()){
											AdminField woreda = woredaItr.next();
											AdminFieldTranslation woredaTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, woreda.getId());
											if(woredaTranslation != null){
											%>
												<option value="<%=woredaTranslation.getAdminFieldId() %>"><%=woredaTranslation.getTranslatedValue() %></option>
											<%
											}else{
											%>
												<option value="<%=woreda.getId() %>"><%=woreda.getOptionValue() %></option>
											<%
											}
										}//end while looop
									}
								%>
							</select>
						</td>		
					</tr>
					<tr>
						<td align="left" width="33%">	
							<font color="red">*</font>
							<label id="lblkebele">
								<%
									String lblKebele = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblkebele");
									label = Label.getLabelUsingLabelId("lblkebele");
					 				out.print(lblKebele != null ? lblKebele : label.getLabelCaption());
					 			%>
							</label><br/>
							<input type="text" name="txtkebele" id="txtkebele"  style="width:90%"/>
						</td>
						<td>
							<label id="lblofficetelephone">
								<%
									String lblOfficeTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblofficetelephone");
									label = Label.getLabelUsingLabelId("lblofficetelephone");
					 				out.print(lblOfficeTelephone != null ? lblOfficeTelephone : label.getLabelCaption());
					 			%>
							</label><br/>
							<input type="text" name="txtofficetelephone" id="txtofficetelephone" style="width:90%"/>
						</td>
						<td>
							<label id="lblhometelephone">
								<%
									String lblHomeTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblhometelephone");
									label = Label.getLabelUsingLabelId("lblhometelephone");
					 				out.print(lblHomeTelephone != null ? lblHomeTelephone : label.getLabelCaption());
					 			%>
							</label><br/>
							<input type="text" name="txthometelephone" id="txthometelephone" style="width:90%"/>
						</td>		
					</tr>
					<tr>
						<td align="left" width="33%">
							<label id="lblemail">
								<%
									String lblEmail = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblemail");
									label = Label.getLabelUsingLabelId("lblemail");
					 				out.print(lblEmail != null ? lblEmail : label.getLabelCaption());
					 			%>
							</label><br/>
							<input type="text" name="txtemail" id="txtemail"  style="width:90%"/>
						</td>
						<td>
							<label id="lblmobilephone">
								<%
									String lblMobilePhone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmobilephone");
									label = Label.getLabelUsingLabelId("lblmobilephone");
					 				out.print(lblMobilePhone != null ? lblMobilePhone : label.getLabelCaption());
					 			%>
							</label><br/>
							<input type="text" name="txtmobiletelephone" id="txtmobiletelephone"  style="width:90%"/>
						</td>
						<td>
							
						</td>		
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
	<tr>
		<td align="right" colspan="3">
				<%
					String lblSaveButtonLabel = "lblsavebutton";
					String saveButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsavebutton");
					label = Label.getLabelUsingLabelId("lblsavebutton");
					String saveButtonCaption = saveButtonLabel != null ? saveButtonLabel : label.getLabelCaption();
					//////
					String lblResetButtonLabel = "lblresetbutton";
					String resetButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId, "lblresetbutton");
					label = Label.getLabelUsingLabelId("lblresetbutton");
					String resetButtonCaption = resetButtonLabel != null ? resetButtonLabel : label.getLabelCaption();
				%>
			<input type="button" value = "<%=saveButtonCaption %>" class="input-submit" id="btnsave"/>
			<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
		</td>		
	</tr>
	<tr>
		<td colspan="3">
			<p class="msg info"><label id="lblrequiredfieldsdescription"><%
						String lblRequiredFiledDescription = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrequiredfieldsdescription");
						label = Label.getLabelUsingLabelId("lblrequiredfieldsdescription");
		 				out.print(lblRequiredFiledDescription != null ? lblRequiredFiledDescription : label.getLabelCaption());
		 			%></label>
		 	</p>
		</td>
	</tr>
</table>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}	
%>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		//now generate the auto-id number in here...
		var fieldName = "txtapplicantidnumber";
		$.ajax({
		    url: 'generatenewapplicantidnumber.jsp',		
		    data: null,
		    type:'POST',
		    success:function(response){		    		
		    		$('#'+fieldName).val(response);					
		    },
		    error:function(error){
				alert(error);
		    }
		});	
		$('#txtfullname').focus();
		//end auto-id generation...
		
		
		$('#btnsave').click(function(){
			var applicantIdNumber = $('#txtapplicantidnumber').val();
			var fullName = $('#txtfullname').val();
			var sex = $('#slctsex').val();
			var ageCategory = $('#slctagecategory').val();
			var numberOfMaleApplicants = $('#txtnumberofapplicantsmale').val();
			var numberOfFemaleApplicants = $('#txtnumberofapplicantsfemale').val();
			var occupation = $('#txtoccupation').val();
			var disability = $('#txtdisability').val();
			var region = $('#slctregion').val();
			var zone = $('#slctzone').val();
			var woreda = $('#slctworeda').val();
			var kebele = $('#txtkebele').val();
			var officeTelephone = $('#txtofficetelephone').val();
			var homeTelephone = $('#txthometelephone').val();
			var email = $('#txtemail').val();
			var mobilePhone = $('#txtmobiletelephone').val();
			//now save this information to the database using jQuery ajax....
			
			if(applicantIdNumber != "" && fullName != "" && sex != "" && ageCategory != "" &&
					region != "" && zone != "" && woreda != "" && kebele != "" ){
				$('#errorDiv').html('');
				var dataString = "applicantIdNumber="+applicantIdNumber+"&fullName="+fullName+"&sex="+sex+
				"&ageCategory="+ageCategory+"&numberOfMaleApplicants="+numberOfMaleApplicants+"&numberOfFemaleApplicants="+
				numberOfFemaleApplicants+"&occupation="+occupation+"&disability="+disability+"&region="+region+
				"&zone="+zone+"&woreda="+woreda+"&kebele="+kebele+"&officeTelephone="+officeTelephone+"&homeTelephone="+
				homeTelephone+"&email="+email+"&mobilePhone="+mobilePhone;
				
				$.ajax({
				    url: 'savenewapplicant.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){				    		
				    		$('#tabDetailDiv').load('shownewapplicantentryform.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}else{
				$('#errorDiv').html("<p class='msg error'>Please enter all required data values!</p>");
			}
		});//end button.click function
	});//end document.ready function
</script>