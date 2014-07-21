<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	int investigatorId = Integer.parseInt(request.getParameter("investigatorId"));
	Investigator investigator = Investigator.getInvestigator(investigatorId);
	InvestigatorAddress investigatorAddress = InvestigatorAddress.getInvestigatorAddressForThisInvestigator(investigatorId);
	//now define the control names in here...
	String idNumberControlName = "txtinvestigatoridnumber" + investigatorId;
	String fullNameControlName = "txtfullname" + investigatorId;
	String levelControlName = "txtlevel" + investigatorId;
	String regionControlName = "slctregion" + investigatorId;
	String woredaControlName = "slctworeda" + investigatorId;
	String kebeleControlName = "txtkebele" + investigatorId;
	String telephoneControlName = "txttelephone" + investigatorId;
	String mobileControlName = "txtmobile" + investigatorId;
	String faxControlName = "txtfax" + investigatorId;
	String poboxControlName = "txtpobox" + investigatorId;
	String emailControlName = "txtemail" + investigatorId;
	String userAccountControlName = "slctuseraccount" + investigatorId;
%>
<form>
<div id="errorDiv"></div>
<table border="0" width="100%" style="background:#eee">
	<tr>
		<td width="30%"><font color="red">*</font> Investigator Id Number/መለያ ቁጥር:</td>
		<td>
			<input type="text" name="<%=idNumberControlName %>" id="<%=idNumberControlName %>" style="width:40%" readonly="readonly" value="<%=investigator.getInvestigatorIdNumber() %>"/>			
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font> Full Name/ሥም:</td>
		<td>
			<input type="text" name="<%=fullNameControlName %>" id="<%=fullNameControlName %>" style="width:40%" value="<%=investigator.getFullName() %>"/>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font> Level:</td>
		<td>
			<input type="text" name="<%=levelControlName %>" id="<%=levelControlName %>" style="width:40%" value="<%=investigator.getLevel() %>"/>
		</td>
	</tr>	
	<tr>
		<td colspan="2">
			<fieldset>
			<legend>Investigator Address</legend>
			<table border="0" width="100%">
				<tr>
					<td width="30%">
						Region:<br/>
						<select name="<%=regionControlName %>" id="<%=regionControlName %>" style="width:100%">
							<option value="" selected="selected">--Select--</option>
							<%
								List<AdminField> regionList = AdminField.getAllOptionValuesForThisFieldName("Region");
								if(!regionList.isEmpty()){
									Iterator<AdminField> regionItr = regionList.iterator();
									while(regionItr.hasNext()){
										AdminField adminField = regionItr.next();
										if(investigatorAddress != null){
											if(adminField.getOptionValue().equalsIgnoreCase(investigatorAddress.getRegion())){
												%>
													<option value="<%=adminField.getOptionValue() %>" selected="selected"><%=adminField.getOptionValue() %></option>
												<%
											}else{
												%>
													<option value="<%=adminField.getOptionValue() %>"><%=adminField.getOptionValue() %></option>
												<%
											}
										}else{
											%>
												<option value="<%=adminField.getOptionValue() %>"><%=adminField.getOptionValue() %></option>
											<%
										}
									}//end while loop
								}
							%>
						</select>
					</td>
					<td>
						Woreda:<br/>
						<select name="<%=woredaControlName %>" id="<%=woredaControlName %>" style="width:100%">
							<option value="" selected="selected">--Select--</option>
							<%
								List<AdminField> woredaList = AdminField.getAllOptionValuesForThisFieldName("Woreda");
								if(!woredaList.isEmpty()){
									Iterator<AdminField> woredaItr = woredaList.iterator();
									while(woredaItr.hasNext()){
										AdminField adminField = woredaItr.next();
										if(investigatorAddress != null){
											if(adminField.getOptionValue().equalsIgnoreCase(investigatorAddress.getWoreda())){
											%>
												<option value="<%=adminField.getOptionValue() %>" selected="selected"><%=adminField.getOptionValue() %></option>
											<%
											}else{
											%>
												<option value="<%=adminField.getOptionValue() %>"><%=adminField.getOptionValue() %></option>
											<%
											}
										}else{
										%>
											<option value="<%=adminField.getOptionValue() %>"><%=adminField.getOptionValue() %></option>
										<%
										}
									}//end while loop
								}
							%>
						</select>
					</td>
					<td>
						Kebele:<br/>
						<input type="text" name="<%=kebeleControlName %>" id="<%=kebeleControlName %>" value="<%=(investigatorAddress != null ? investigatorAddress.getKebele() : "") %>"/>
					</td>
				</tr>
				<tr>
					<td>
						Telephone:<br/>
						<input type="text" name="<%=telephoneControlName %>" id="<%=telephoneControlName %>" value="<%=(investigatorAddress != null ? investigatorAddress.getTelephone() : "") %>"/>
					</td>
					<td>
						Mobile:<br/>
						<input type="text" name="<%=mobileControlName %>" id="<%=mobileControlName %>" value="<%=(investigatorAddress != null ? investigatorAddress.getMobile() : "")%>"/>
					</td>
					<td>
						Fax:<br/>
						<input type="text" name="<%=faxControlName %>" id="<%=faxControlName %>" value="<%=(investigatorAddress != null ? investigatorAddress.getFax() : "")%>"/>
					</td>
				</tr>
				<tr>
					<td>
						POBox:<br/>
						<input type="text" name="<%=poboxControlName %>" id="<%=poboxControlName %>" value="<%=(investigatorAddress != null ? investigatorAddress.getPobox() : "")%>"/>
					</td>
					<td>
						Email:<br/>
						<input type="text" name="<%=emailControlName %>" id="<%=emailControlName %>" value="<%=(investigatorAddress != null ? investigatorAddress.getEmail() : "")%>"/>
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
				<legend>Map Investigator with User Account</legend>
				<table border="0" width="100%">
					<tr>
						<td width="30%">Please Select Investigator User Account:</td>
						<td>
							<select name="<%=userAccountControlName %>" id="<%=userAccountControlName %>" style="width:100%">
								<option value="" selected="selected">--Select--</option>
								<%
									List<User> userList = User.getAllUsersWithUserType("Investigator");									
									if(!userList.equals(null)){
										Iterator<User> userItr = userList.iterator();
										while(userItr.hasNext()){
											User user = userItr.next();
											InvestigatorUserMap investigatorUserMap = InvestigatorUserMap.getInvestigatorUserMapForInvestigator(investigatorId);
											if(investigatorUserMap != null){
												if(user.getId() == investigatorUserMap.getUserId()){
												%>
													<option value="<%=user.getId()%>" selected="selected"><%=user.getFullName() %></option>
												<%
												}else{
												%>
													<option value="<%=user.getId()%>"><%=user.getFullName() %></option>
												<%
												}
											}else{
											%>
												<option value="<%=user.getId()%>"><%=user.getFullName() %></option>
											<%
											}
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
				String buttonId = "btnupdate" + investigatorId;
			%>
			<input type="button" value = "Update" class="input-submit" id="<%=buttonId %>"/>
			<input type="reset" value="Clear" class="input-submit"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<p class="msg info">N.B. Fileds identified with <font color="red">*</font> are required and can not be left empty!</p>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		 var investigatorId = "<%=investigatorId%>";
		 var buttonId = "btnupdate" + investigatorId;
		 
		 $('#'+buttonId).click(function(){			
			 //now define the control names in here...
			 var idNumberControlName = "txtinvestigatoridnumber" + investigatorId;
			 var fullNameControlName = "txtfullname" + investigatorId;
			 var levelControlName = "txtlevel" + investigatorId;
			 var regionControlName = "slctregion" + investigatorId;
			 var woredaControlName = "slctworeda" + investigatorId;
			 var kebeleControlName = "txtkebele" + investigatorId;
			 var telephoneControlName = "txttelephone" + investigatorId;
			 var mobileControlName = "txtmobile" + investigatorId;
			 var faxControlName = "txtfax" + investigatorId;
			 var poboxControlName = "txtpobox" + investigatorId;
			 var emailControlName = "txtemail" + investigatorId;
			 var userAccountControlName = "slctuseraccount" + investigatorId;
	
			 var investigatorIdNumber = $('#'+idNumberControlName).val();
			 var name = $('#'+fullNameControlName).val();
			 var level = $('#'+levelControlName).val();			 
			 var region = $('#'+regionControlName).val();
			 var woreda = $('#'+woredaControlName).val();
			 var kebele = $('#'+kebeleControlName).val();
			 var telephone = $('#'+telephoneControlName).val();
			 var mobile = $('#'+mobileControlName).val();
			 var fax = $('#'+faxControlName).val();
			 var pobox = $('#'+poboxControlName).val();
			 var email = $('#'+emailControlName).val();
			 var userId = $('#'+userAccountControlName).val();
			 
			 if(investigatorIdNumber != "" && name != "" && level != "" && userId != ""){
				 var dataString = "investigatorIdNumber="+investigatorIdNumber+"&name="+name+"&level="+
				 level+"&region="+region+"&woreda="+woreda+"&kebele="+kebele+
				 "&telephone="+telephone+"&mobile="+mobile+"&fax="+fax+"&pobox="+pobox+"&email="+email+
				 "&investigatorId="+investigatorId+"&userId="+userId;
				 
				 var divId = "investigatorEditDiv" + investigatorId;
				 $.ajax({					
					    url: 'updateinvestigator.jsp',		
					    data: dataString,
					    type:'POST',
					    success:function(response){   		
					    		$('#'+divId).html(response);			    		
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