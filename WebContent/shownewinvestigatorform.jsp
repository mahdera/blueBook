<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "respondentManagement";
	//Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	//Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true){
		int langId = Integer.parseInt(session.getAttribute("langId").toString());
		Label label = null;
%>
<form>
<div id="errorDiv"></div>
<table border="0" width="100%" style="background:#eee">
	<tr>
		<td width="30%"><font color="red">*</font><label id="lblinvestigatoridnumber"><%
						String lblInvestigatorIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigatoridnumber");
						label = Label.getLabelUsingLabelId("lblinvestigatoridnumber");
		 				out.print(lblInvestigatorIdNumber != null ? lblInvestigatorIdNumber : label.getLabelCaption());
		 			%></label></td>
		<td>
			<input type="text" name="txtinvestigatoridnumber" id="txtinvestigatoridnumber" style="width:40%" readonly="readonly"/>			
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font><label id="lblfullname"><%
						String lblFullName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfullname");
						label = Label.getLabelUsingLabelId("lblfullname");
		 				out.print(lblFullName != null ? lblFullName : label.getLabelCaption());
		 			%></label></td>
		<td>
			<input type="text" name="txtfullname" id="txtfullname" style="width:40%"/>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font><label id="lbllevel"><%
						String lblLevel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllevel");
						label = Label.getLabelUsingLabelId("lbllevel");
		 				out.print(lblLevel != null ? lblLevel : label.getLabelCaption());
		 			%></label></td>
		<td>
			<input type="text" name="txtlevel" id="txtlevel" style="width:40%"/>
		</td>
	</tr>	
	<tr>
		<td colspan="2">
			<fieldset>
			<legend><label id="lblinvestigatoraddress"><%
						String lblInvestigatorAddress = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigatoraddress");
						label = Label.getLabelUsingLabelId("lblinvestigatoraddress");
		 				out.print(lblInvestigatorAddress != null ? lblInvestigatorAddress : label.getLabelCaption());
		 			%></label></legend>
			<table border="0" width="100%">
				<tr>
					<td width="30%">
						<label id="lblregion"><%
						String lblRegion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregion");
						label = Label.getLabelUsingLabelId("lblregion");
		 				out.print(lblRegion != null ? lblRegion : label.getLabelCaption());
		 			%></label><br/>
						<select name="slctregion" id="slctregion" style="width:100%">
							<option value="" selected="selected">--Select--</option>
							<%
								List<AdminField> regionList = AdminField.getAllOptionValuesForThisFieldName("Region");
								if(!regionList.isEmpty()){
									Iterator<AdminField> regionItr = regionList.iterator();
									while(regionItr.hasNext()){
										AdminField adminField = regionItr.next();
										%>
										<option value="<%=adminField.getOptionValue() %>"><%=adminField.getOptionValue() %></option>
										<%
									}//end while loop
								}
							%>
						</select>
					</td>
					<td>
						<label id="lblworeda"><%
						String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
						label = Label.getLabelUsingLabelId("lblworeda");
		 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
		 			%></label><br/>
						<select name="slctworeda" id="slctworeda" style="width:100%">
							<option value="" selected="selected">--Select--</option>
							<%
								List<AdminField> woredaList = AdminField.getAllOptionValuesForThisFieldName("Woreda");
								if(!woredaList.isEmpty()){
									Iterator<AdminField> woredaItr = woredaList.iterator();
									while(woredaItr.hasNext()){
										AdminField adminField = woredaItr.next();
										%>
										<option value="<%=adminField.getOptionValue() %>"><%=adminField.getOptionValue() %></option>
										<%
									}//end while loop
								}
							%>
						</select>
					</td>
					<td>
						<label id="lblkebele"><%
						String lblKebele = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblkebele");
						label = Label.getLabelUsingLabelId("lblkebele");
		 				out.print(lblKebele != null ? lblKebele : label.getLabelCaption());
		 			%></label><br/>
						<input type="text" name="txtkebele" id="txtkebele"/>
					</td>
				</tr>
				<tr>
					<td>
						<label id="lbltelephone"><%
						String lblTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltelephone");
						label = Label.getLabelUsingLabelId("lbltelephone");
		 				out.print(lblTelephone != null ? lblTelephone : label.getLabelCaption());
		 			%></label><br/>
						<input type="text" name="txttelephone" id="txttelephone"/>
					</td>
					<td>
						<label id="lblmobile"><%
						String lblMobile = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmobile");
						label = Label.getLabelUsingLabelId("lblmobile");
		 				out.print(lblMobile != null ? lblMobile : label.getLabelCaption());
		 			%></label><br/>
						<input type="text" name="txtmobile" id="txtmobile"/>
					</td>
					<td>
						<label id="lblfax"><%
						String lblFax = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfax");
						label = Label.getLabelUsingLabelId("lblfax");
		 				out.print(lblFax != null ? lblFax : label.getLabelCaption());
		 			%></label><br/>
						<input type="text" name="txtfax" id="txtfax"/>
					</td>
				</tr>
				<tr>
					<td>
						<label id="lblpobox"><%
						String lblPobox = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpobox");
						label = Label.getLabelUsingLabelId("lblpobox");
		 				out.print(lblPobox != null ? lblPobox : label.getLabelCaption());
		 			%></label><br/>
						<input type="text" name="txtpobox" id="txtpobox"/>
					</td>
					<td>
						<label id="lblemail"><%
						String lblEmail = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblemail");
						label = Label.getLabelUsingLabelId("lblemail");
		 				out.print(lblEmail != null ? lblEmail : label.getLabelCaption());
		 			%></label><br/>
						<input type="text" name="txtemail" id="txtemail"/>
					</td>
					<td></td>
				</tr>
			</table>
		   </fieldset>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<fieldset>
				<legend><label id="lblmapinvestigatorwithuseraccount"><%
						String lblMapInvestigatorWithUserAccount = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmapinvestigatorwithuseraccount");
						label = Label.getLabelUsingLabelId("lblmapinvestigatorwithuseraccount");
		 				out.print(lblMapInvestigatorWithUserAccount != null ? lblMapInvestigatorWithUserAccount : label.getLabelCaption());
		 			%></label></legend>
				<table border="0" width="100%">
					<tr>
						<td width="30%"><label id="lblpleaseselectinvestigatoruseraccount"><%
						String lblPleaseSelectInvestigatorUserAccount = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpleaseselectinvestigatoruseraccount");
						label = Label.getLabelUsingLabelId("lblpleaseselectinvestigatoruseraccount");
		 				out.print(lblPleaseSelectInvestigatorUserAccount != null ? lblPleaseSelectInvestigatorUserAccount : label.getLabelCaption());
		 			%></label></td>
						<td>
							<select name="slctuseraccount" id="slctuseraccount" style="width:100%">
								<option value="" selected="selected">--Select--</option>
								<%
									List<User> userList = User.getAllUsersWithUserType("Investigator");									
									if(!userList.equals(null)){
										Iterator<User> userItr = userList.iterator();
										while(userItr.hasNext()){
											User user = userItr.next();
											%>
												<option value="<%=user.getId()%>"><%=user.getFullName() %></option>
											<%
										}//end while loop
									}
								%>
							</select>
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>	
	<tr>		
		<td colspan="2" align="right">
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
		<td colspan="2">
			<p class="msg info"><label id="lblrequiredfieldsdescription"><%
						String lblRequiredFiledDescription = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrequiredfieldsdescription");
						label = Label.getLabelUsingLabelId("lblrequiredfieldsdescription");
		 				out.print(lblRequiredFiledDescription != null ? lblRequiredFiledDescription : label.getLabelCaption());
		 			%></label></p>
		</td>
	</tr>
</table>
</form>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		///now genearate the auto-id part in here...
		 var fieldName = "txtinvestigatoridnumber";
		 $.ajax({
		    url: 'generatenewinvestigatoridnumber.jsp',		
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
		 
		 $('#btnsave').click(function(){
			 var investigatorIdNumber = $('#txtinvestigatoridnumber').val();
			 var name = $('#txtfullname').val();
			 var level = $('#txtlevel').val();			 
			 var region = $('#slctregion').val();
			 var woreda = $('#slctworeda').val();
			 var kebele = $('#txtkebele').val();
			 var telephone = $('#txttelephone').val();
			 var mobile = $('#txtmobile').val();
			 var fax = $('#txtfax').val();
			 var pobox = $('#txtpobox').val();
			 var email = $('#txtemail').val();
			 var userId = $('#slctuseraccount').val();
			 
			 if(investigatorIdNumber != "" && name != "" && level != "" && userId != ""){
				 var dataString = "investigatorIdNumber="+investigatorIdNumber+"&name="+name+"&level="+
				 level+"&region="+region+"&woreda="+woreda+"&kebele="+kebele+
				 "&telephone="+telephone+"&mobile="+mobile+"&fax="+fax+"&pobox="+pobox+"&email="+email+
				 "&userId="+userId;
				 
				 $.ajax({					
					    url: 'saveinvestigator.jsp',		
					    data: dataString,
					    type:'POST',
					    success:function(response){   		
					    		$('#subTabDetailDiv').load('shownewinvestigatorform.jsp');			    		
					    },
					    error:function(error){
							alert(error);
					    }
					});	
			 }else{
				 $('#errorDiv').html("<p class='msg error'>Missing data! Please enter all the required data fields!</p>");
			 }
		 });//end save.button click function
	});//end document.ready function
</script>