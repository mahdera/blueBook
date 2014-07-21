<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%@page import="java.util.*" %>
<form name="frmchangeusername" id="frmchangeusername">
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "accountManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	Applicant editApplicant = Applicant.getApplicant(applicantId);
	ApplicantAddress editApplicantAddress = ApplicantAddress.getAddressOfThisApplicant(applicantId);
	//now define the control names in here...
	String applicantIdNumberControlName = "txtapplicantidnumber" + applicantId;
	String fullNameControlName = "txtfullname" + applicantId;
	String sexControlName = "slctsex" + applicantId;
	String ageCategoryControlName = "slctagecategory" + applicantId;
	String maleApplicantsNumberControlName = "txtnumberofapplicantsmale" + applicantId;
	String femaleApplicantsNumberControlName = "txtnumberofapplicantsfemale" + applicantId;
	String occupationControlName = "txtoccupation" + applicantId;
	String disabilityControlName = "txtdisability" + applicantId;
	String regionControlName = "slctregion" + applicantId;
	String zoneControlName = "slctzone" + applicantId;
	String woredaControlName = "slctworeda" + applicantId;
	String kebeleControlName = "txtkebele" + applicantId;
	String officeTelephoneControlName = "txtofficetelephone" + applicantId;
	String homeTelephoneControlName = "txthometelephone" + applicantId;
	String emailControlName = "txtemail" + applicantId;
	String mobilePhoneControlName = "txtmobiletelephone" + applicantId;
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	String buttonId = "btnupdate" + applicantId;
	
	if(true)
	{		
%>
<div id="errorMsgDiv"></div>
<table border="0" width="100%" style="background:lightyellow">
	<tr>
		<td colspan="3">
			<div id="usernameErrorDiv"></div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<fieldset>
				<legend>
					<label id="lbleditapplicantbasicinformation">
						<%														
							String lblEditApplicantBasicInformation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditapplicantbasicinformation");
							label = Label.getLabelUsingLabelId("lbleditapplicantbasicinformation");
			 				out.print(lblEditApplicantBasicInformation != null ? lblEditApplicantBasicInformation : label.getLabelCaption());		 			
						%>
					</label>					
				</legend>
				<table border="0" width="100%">
				<tr>
					<td align="left" width="33%">
						<label id="lblapplicantidnumber">
							<%
								String lblApplicantIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantidnumber");
								label = Label.getLabelUsingLabelId("lblapplicantidnumber");
				 				out.print(lblApplicantIdNumber != null ? lblApplicantIdNumber : label.getLabelCaption());
				 			%>:<br/>
						</label>
						<input type="text" name="<%=applicantIdNumberControlName %>" id="<%=applicantIdNumberControlName %>" style="width:90%" value="<%=editApplicant.getApplicantIdNumber() %>" disabled="disabled"/>						
					</td>
					<td>
						<label id="lblfullname">
							<%
								String lblFullName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfullname");
								label = Label.getLabelUsingLabelId("lblfullname");
				 				out.print(lblFullName != null ? lblFullName : label.getLabelCaption());
				 			%>:<br/>
						</label>
						<input type="text" name="<%=fullNameControlName %>" id="<%=fullNameControlName %>" style="width:90%" value="<%=editApplicant.getFullName() %>"/>
					</td>
					<td>
						<label id="lblsex">
							<%
						String lblSex = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsex");
						label = Label.getLabelUsingLabelId("lblsex");
		 				out.print(lblSex != null ? lblSex : label.getLabelCaption());
		 			%>:<br/>
						</label>
						<select name="<%=sexControlName %>" id="<%=sexControlName %>" style="width:90%">
							<%
							if(editApplicant.getSex().equalsIgnoreCase("male")){
								%>
								<option value="Male" selected="selected">Male/ወንድ</option>
								<option value="Female">Female/ሴት</option>	
								<%
							}else if(editApplicant.getSex().equalsIgnoreCase("female")){
								%>
								<option value="Male">Male/ወንድ</option>
								<option value="Female" selected="selected">Female/ሴት</option>
								<%
							}else{
								%>
								<option value="" selected="selected">--Select--</option>
								<%
							}
							%>							
						</select>
					</td>		
				</tr>
				<tr>
					<td align="left">
						<label id="lblagecategory">
							<%
						String lblAgeCategory = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblagecategory");
						label = Label.getLabelUsingLabelId("lblagecategory");
		 				out.print(lblAgeCategory != null ? lblAgeCategory : label.getLabelCaption());
		 			%>:<br/>
						</label>
						<select name="<%=ageCategoryControlName %>" id="<%=ageCategoryControlName %>" style="width:90%">
							<%
								if(editApplicant.getAgeCategory().equalsIgnoreCase("18-25")){
									%>
										<option value="18-25" selected="selected">18-25</option>
										<option value="26-35">26-35</option>
										<option value="36-55">36-55</option>
										<option value="56-70">56-70</option>
										<option value="Above 70">Above 70</option>
									<%
								}else if(editApplicant.getAgeCategory().equalsIgnoreCase("26-35")){
									%>
									<option value="18-25">18-25</option>
									<option value="26-35" selected="selected">26-35</option>
									<option value="36-55">36-55</option>
									<option value="56-70">56-70</option>
									<option value="Above 70">Above 70</option>
									<%
								}else if(editApplicant.getAgeCategory().equalsIgnoreCase("36-55")){
									%>
									<option value="18-25">18-25</option>
									<option value="26-35">26-35</option>
									<option value="36-55" selected="selected">36-55</option>
									<option value="56-70">56-70</option>
									<option value="Above 70">Above 70</option>
									<%
								}else if(editApplicant.getAgeCategory().equalsIgnoreCase("56-70")){
									%>
									<option value="18-25">18-25</option>
									<option value="26-35">26-35</option>
									<option value="36-55">36-55</option>
									<option value="56-70" selected="selected">56-70</option>
									<option value="Above 70">Above 70</option>
									<%
								}else if(editApplicant.getAgeCategory().equalsIgnoreCase("Above 70")){
									%>
									<option value="18-25">18-25</option>
									<option value="26-35">26-35</option>
									<option value="36-55">36-55</option>
									<option value="56-70">56-70</option>
									<option value="Above 70" selected="selected">Above 70</option>
									<%
								}else{
									%>
									<option value="" selected="selected">--Select--</option>
									<option value="18-25">18-25</option>
									<option value="26-35">26-35</option>
									<option value="36-55">36-55</option>
									<option value="56-70">56-70</option>
									<option value="Above 70">Above 70</option>
									<%
								}
							%>							
						</select>
					</td>
					<td>
						<label id="lblnumberofmaleapplicants">
							<%
						String lblNumberOfMaleApplicants = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnumberofmaleapplicants");
						label = Label.getLabelUsingLabelId("lblnumberofmaleapplicants");
		 				out.print(lblNumberOfMaleApplicants != null ? lblNumberOfMaleApplicants : label.getLabelCaption());
		 			%>:<br/>
						</label>
						<input type="text" name="<%=maleApplicantsNumberControlName %>" id="<%=maleApplicantsNumberControlName %>" style="width:90%" value="<%=editApplicant.getNumberOfApplicantsMale() %>"/>
					</td>
					<td>
						<label id="lblnumberoffemaleapplicants">
							<%
						String lblNumberOfFemaleApplicants = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnumberoffemaleapplicants");
						label = Label.getLabelUsingLabelId("lblnumberoffemaleapplicants");
		 				out.print(lblNumberOfFemaleApplicants != null ? lblNumberOfFemaleApplicants : label.getLabelCaption());
		 			%>:<br/>
						</label>
						<input type="text" name="<%=femaleApplicantsNumberControlName %>" id="<%=femaleApplicantsNumberControlName %>" style="width:90%" value="<%=editApplicant.getNumberOfApplicantsFemale() %>"/>
					</td>		
				</tr>
				<tr>
					<td align="left">
						<label id="lbloccupation">
							<%
						String lblOccupation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbloccupation");
						label = Label.getLabelUsingLabelId("lbloccupation");
		 				out.print(lblOccupation != null ? lblOccupation : label.getLabelCaption());
		 			%>:<br/>
						</label>
						<input type="text" name="<%=occupationControlName %>" id="<%=occupationControlName %>" style="width:90%" value="<%=editApplicant.getOccupation() %>"/>
					</td>
					<td>
						<label id="lbldisability">
							<%
						String lblDisability = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldisability");
						label = Label.getLabelUsingLabelId("lbldisability");
		 				out.print(lblDisability != null ? lblDisability : label.getLabelCaption());
		 			%>:<br/>
						</label>
						<input type="text" name="<%=disabilityControlName %>" id="<%=disabilityControlName %>" style="width:90%" value="<%=editApplicant.getDisability() %>"/>
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
				<legend>
					<label id="lbleditapplicantaddress">
						<%
						String lblEditApplicantAddress = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditapplicantaddress");
						label = Label.getLabelUsingLabelId("lbleditapplicantaddress");
		 				out.print(lblEditApplicantAddress != null ? lblEditApplicantAddress : label.getLabelCaption());
		 			%>
					</label>
				</legend>				
				<table border="0" width="100%" style="background:lightyellow">
					<tr>
						<td align="left" width="33%">
							<label id="lblregion">
								<%
						String lblRegion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregion");
						label = Label.getLabelUsingLabelId("lblregion");
		 				out.print(lblRegion != null ? lblRegion : label.getLabelCaption());
		 			%>:<br/>
							</label>
							<select name="<%=regionControlName %>" id="<%=regionControlName %>" style="width:90%">								
								<%
									List<AdminField> regionList = AdminField.getAllOptionValuesForThisFieldName("Region");
									if(!regionList.isEmpty()){
										Iterator<AdminField> regionItr = regionList.iterator();
										while(regionItr.hasNext()){
											AdminField region = regionItr.next();
											AdminFieldTranslation regionTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, region.getId());
											if(regionTranslation != null){
												if(regionTranslation.getAdminFieldId() == editApplicantAddress.getRegion()){
													%>
														<option value="<%=regionTranslation.getAdminFieldId() %>" selected="selected"><%=regionTranslation.getTranslatedValue() %></option>
													<%
												}else{
													%>
														<option value="<%=regionTranslation.getAdminFieldId() %>"><%=regionTranslation.getTranslatedValue() %></option>
													<%
												}
											}else{
												if(region.getId() == editApplicantAddress.getRegion()){
													%>
													<option value="<%=region.getId() %>" selected="selected"><%=region.getOptionValue() %></option>
													<%
												}else{
													%>
													<option value="<%=region.getId() %>"><%=region.getOptionValue() %></option>
													<%
												}
											}
										}//end while looop
									}
								%>
							</select>
						</td>
						<td width="33%">
							<label id="lblzone">
								<%
						String lblZone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblzone");
						label = Label.getLabelUsingLabelId("lblzone");
		 				out.print(lblZone != null ? lblZone : label.getLabelCaption());
		 			%>:<br/>
							</label>
							<select name="<%=zoneControlName %>" id="<%=zoneControlName %>" style="width:90%">
								<option value="">--Select--</option>
								<%
									List<AdminField> zoneList = AdminField.getAllOptionValuesForThisFieldName("Zone");
									if(!zoneList.isEmpty()){
										Iterator<AdminField> zoneItr = zoneList.iterator();
										while(zoneItr.hasNext()){
											AdminField zone = zoneItr.next();
											AdminFieldTranslation zoneTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, zone.getId());
											if(zoneTranslation != null){
												if(zoneTranslation.getAdminFieldId() == editApplicantAddress.getApplicantZone()){
													%>
														<option value="<%=zoneTranslation.getAdminFieldId() %>" selected="selected"><%=zoneTranslation.getTranslatedValue() %></option>
													<%
												}else{
													%>
														<option value="<%=zoneTranslation.getAdminFieldId() %>"><%=zoneTranslation.getTranslatedValue() %></option>
													<%
												}
											}else{
												if(zone.getId() == editApplicantAddress.getApplicantZone()){
												%>
												<option value="<%=zone.getId() %>" selected="selected"><%=zone.getOptionValue() %></option>
												<%
												}else{
												%>
												<option value="<%=zone.getId() %>"><%=zone.getOptionValue() %></option>
												<%
												}
											}
										}//end while looop
									}
								%>
							</select>
						</td>
						<td>
							<label id="lblworeda">
								<%
						String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
						label = Label.getLabelUsingLabelId("lblworeda");
		 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
		 			%>:
							</label><br/>
							<select name="<%=woredaControlName %>" id="<%=woredaControlName %>" style="width:90%">
								<option value="">--Select--</option>
								<%
									List<AdminField> woredaList = AdminField.getAllOptionValuesForThisFieldName("Woreda");
									if(!woredaList.isEmpty()){
										Iterator<AdminField> woredaItr = woredaList.iterator();
										while(woredaItr.hasNext()){
											AdminField woreda = woredaItr.next();
											AdminFieldTranslation woredaTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, woreda.getId());
											if(woredaTranslation != null){
												if(woredaTranslation.getAdminFieldId() == editApplicantAddress.getWoreda()){
													%>
														<option value="<%=woredaTranslation.getAdminFieldId() %>" selected="selected"><%=woredaTranslation.getTranslatedValue() %></option>
													<%
												}else{
													%>
														<option value="<%=woredaTranslation.getAdminFieldId()%>"><%=woredaTranslation.getTranslatedValue() %></option>
													<%
												}
											}else{
												if(woreda.getId() == editApplicantAddress.getWoreda()){
												%>
													<option value="<%=woreda.getId() %>" selected="selected"><%=woreda.getOptionValue() %></option>
												<%
												}else{
												%>
													<option value="<%=woreda.getId() %>"><%=woreda.getOptionValue() %></option>
												<%	
												}
											}
										}//end while looop
									}
								%>
							</select>
						</td>		
					</tr>
					<tr>
						<td align="left" width="33%">
							<label id="lblkebele">
								<%
						String lblKebele = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblkebele");
						label = Label.getLabelUsingLabelId("lblkebele");
		 				out.print(lblKebele != null ? lblKebele : label.getLabelCaption());
		 			%>:<br/>
							</label>
							<input type="text" name="<%=kebeleControlName %>" id="<%=kebeleControlName %>"  style="width:90%" value="<%=editApplicantAddress.getKebele() %>"/>
						</td>
						<td>
							<label id="lblofficetelephone">
								<%
						String lblOfficeTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblofficetelephone");
						label = Label.getLabelUsingLabelId("lblofficetelephone");
		 				out.print(lblOfficeTelephone != null ? lblOfficeTelephone : label.getLabelCaption());
		 			%>:<br/>
							</label>
							<input type="text" name="<%=officeTelephoneControlName %>" id="<%=officeTelephoneControlName %>" style="width:90%" value="<%=editApplicantAddress.getOfficeTelephone() %>"/>
						</td>
						<td>
							<label id="lblhometelephone">
								<%
						String lblHomeTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblhometelephone");
						label = Label.getLabelUsingLabelId("lblhometelephone");
		 				out.print(lblHomeTelephone != null ? lblHomeTelephone : label.getLabelCaption());
		 			%>:
							</label><br/>
							<input type="text" name="<%=homeTelephoneControlName %>" id="<%=homeTelephoneControlName %>" style="width:90%" value="<%=editApplicantAddress.getHomeTelephone() %>"/>
						</td>		
					</tr>
					<tr>
						<td align="left" width="33%">
							<label id="lblemail">
								<%
						String lblEmail = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblemail");
						label = Label.getLabelUsingLabelId("lblemail");
		 				out.print(lblEmail != null ? lblEmail : label.getLabelCaption());
		 			%>:<br/>
							</label>
							<input type="text" name="<%=emailControlName %>" id="<%=emailControlName %>"  style="width:90%" value="<%=editApplicantAddress.getEmail() %>"/>
						</td>
						<td>
							<label id="lblmobilephone">
								<%
						String lblMobilePhone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmobilephone");
						label = Label.getLabelUsingLabelId("lblmobilephone");
		 				out.print(lblMobilePhone != null ? lblMobilePhone : label.getLabelCaption());
		 			%>:<br/>
							</label>
							<input type="text" name="<%=mobilePhoneControlName %>" id="<%=mobilePhoneControlName %>"  style="width:90%" value="<%=editApplicantAddress.getMobileTelephone() %>"/>
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
				String lblUpdateButtonLabel = "lblupdatebutton";
				String updateButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblupdateallbutton");
				label = Label.getLabelUsingLabelId("lblupdatebutton");
				String updateButtonCaption = updateButtonLabel != null ? updateButtonLabel : label.getLabelCaption();
				
				String lblUndoButtonLabel = "lblundobutton";
				String undoButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblundobutton");
				label = Label.getLabelUsingLabelId("lblupdatebutton");
				String undoButtonCaption = undoButtonLabel != null ? undoButtonLabel : label.getLabelCaption();
			%>
			<input type="button" id="<%=buttonId %>" value = "<%=updateButtonCaption %>" class="input-submit"/>
			<input type="reset" value="<%=undoButtonCaption %>" class="input-submit"/>
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
		var applicantId = "<%=applicantId%>";
		var buttonId = "btnupdate" + applicantId;
		
		$('#'+buttonId).click(function(){			
			//now define the control names...
			var applicantIdNumberControlName = "txtapplicantidnumber" + applicantId;
			var fullNameControlName = "txtfullname" + applicantId;
			var sexControlName = "slctsex" + applicantId;
			var ageCategoryControlName = "slctagecategory" + applicantId;
			var maleApplicantsNumberControlName = "txtnumberofapplicantsmale" + applicantId;
			var femaleApplicantsNumberControlName = "txtnumberofapplicantsfemale" + applicantId;
			var occupationControlName = "txtoccupation" + applicantId;
			var disabilityControlName = "txtdisability" + applicantId;
			var regionControlName = "slctregion" + applicantId;
			var zoneControlName = "slctzone" + applicantId;
			var woredaControlName = "slctworeda" + applicantId;
			var kebeleControlName = "txtkebele" + applicantId;
			var officeTelephoneControlName = "txtofficetelephone" + applicantId;
			var homeTelephoneControlName = "txthometelephone" + applicantId;
			var emailControlName = "txtemail" + applicantId;
			var mobilePhoneControlName = "txtmobiletelephone" + applicantId;
			
			var applicantIdNumber = $('#'+applicantIdNumberControlName).val();
			var fullName = $('#'+fullNameControlName).val();
			var sex = $('#'+sexControlName).val();
			var ageCategory = $('#'+ageCategoryControlName).val();
			var numberOfMaleApplicants = $('#'+maleApplicantsNumberControlName).val();
			var numberOfFemaleApplicants = $('#'+femaleApplicantsNumberControlName).val();
			var occupation = $('#'+occupationControlName).val();
			var disability = $('#'+disabilityControlName).val();
			var region = $('#'+regionControlName).val();
			var zone = $('#'+zoneControlName).val();
			var woreda = $('#'+woredaControlName).val();
			var kebele = $('#'+kebeleControlName).val();
			var officeTelephone = $('#'+officeTelephoneControlName).val();
			var homeTelephone = $('#'+homeTelephoneControlName).val();
			var email = $('#'+emailControlName).val();
			var mobilePhone = $('#'+mobilePhoneControlName).val();
			
			var dataString = "&applicantId="+applicantId+"&applicantIdNumber="+applicantIdNumber+
			"&fullName="+fullName+"&sex="+sex+"&ageCategory="+ageCategory+"&numberOfMaleApplicants="+
			numberOfMaleApplicants+"&numberOfFemaleApplicants="+numberOfFemaleApplicants+"&occupation="+
			occupation+"&disability="+disability+"&region="+region+"&zone="+zone+"&woreda="+woreda+
			"&kebele="+kebele+"&officeTelephone="+officeTelephone+"&homeTelephone="+homeTelephone+
			"&email="+email+"&mobilePhone="+mobilePhone;
			
			$.ajax({
			    url: 'updateapplicant.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		var divId = "applicantEditDiv"+applicantId;
			    		$('#'+divId).html(response);			    							
			    },
			    error:function(error){
					alert(error);
			    }
			});
		});//end button.update click
	});//end document.ready function
</script>