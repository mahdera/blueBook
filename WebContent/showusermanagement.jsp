<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<form>
	<table border="0" width="100%" style="background:#eee">
		<tr>
			<td><label id="lblfullname"><%
					String lblFullName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfullname");
					label = Label.getLabelUsingLabelId("lblfullname");
					out.print(lblFullName != null ? lblFullName : label.getLabelCaption());
				%></label></td>
			<td>
				<input type="text" name="txtfullname" id="txtfullname" size="80"/>
			</td>
		</tr>
		<tr>
			<td><label id="lblusertype"><%
					String lblUserType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblusertype");
					label = Label.getLabelUsingLabelId("lblusertype");
					out.print(lblUserType != null ? lblUserType : label.getLabelCaption());
				%></label></td>
			<td>
				<select name="slctusertype" id="slctusertype" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<AdminField> adminFieldList = AdminField.getAllOptionValuesForThisFieldName("User Type");
						if(!adminFieldList.isEmpty()){
							Iterator<AdminField> adminFieldItr = adminFieldList.iterator();
							while(adminFieldItr.hasNext()){
								AdminField adminField = adminFieldItr.next();
								%>
								<option value="<%=adminField.getOptionValue() %>"><%=adminField.getOptionValue() %></option>
								<%
							}//end while loop
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<fieldset>
					<legend><label id="lbluseraccountinformation"><%
					String lblUserAccountInformation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbluseraccountinformation");
					label = Label.getLabelUsingLabelId("lbluseraccountinformation");
					out.print(lblUserAccountInformation != null ? lblUserAccountInformation : label.getLabelCaption());
				%></label></legend>
					<table border="0" width="100%">
						<tr>
							<td><label id="lblusername"><%
					String lblUsername = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblusername");
					label = Label.getLabelUsingLabelId("lblusername");
					out.print(lblUsername != null ? lblUsername : label.getLabelCaption());
				%></label></td>
							<td>
								<input type="text" name="txtusername" id="txtusername"/>
							</td>
						</tr>
						<tr>
							<td><label id="lblpassword"><%
					String lblPassword = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpassword");
					label = Label.getLabelUsingLabelId("lblpassword");
					out.print(lblPassword != null ? lblPassword : label.getLabelCaption());
				%></label></td>
							<td>
								<input type="password" name="txtpassword" id="txtpassword"/>
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
				<input type="button" value="<%=saveButtonCaption%>" id="btncreate" class="input-submit" onclick="createNewUser(
						document.getElementById('').value,document.getElementById('').value,
						document.getElementById('').value,document.getElementById('').value);"/>
				<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<fieldset>
					<legend><label id="lbluseraccountlist">
						<%
							String lblUserAccountList = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbluseraccountlist");
							label = Label.getLabelUsingLabelId("lbluseraccountlist");
							out.print(lblUserAccountList != null ? lblUserAccountList : label.getLabelCaption());
						%>
					</label></legend>
					<table border="0" width="100%" style="background:lightyellow">
						<tr style="background:#eee;font-weight:bolder;font-size:11pt">
							<td><label id="lblserialnumber"><%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
					out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
				%></label></td>
							<td><label id="lblfullname"><%
					lblFullName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfullname");
					label = Label.getLabelUsingLabelId("lblfullname");
					out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
				%></label></td>
							<td><label id="lblusertype"><%
					lblUserType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblusertype");
					label = Label.getLabelUsingLabelId("lblusertype");
					out.print(lblUserType != null ? lblUserType : label.getLabelCaption());
				%></label></td>
							<td><label id="lbledit"><%
					String lblEdit = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbledit");
					label = Label.getLabelUsingLabelId("lbledit");
					out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
				%></label></td>
							<td><label id="lbldelete"><%
					String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
					label = Label.getLabelUsingLabelId("lbldelete");
					out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
				%></label></td>
						</tr>
						<%
							List<User> userList = User.getAllUsers();
							if(!userList.isEmpty()){
								Iterator<User> userItr = userList.iterator();
								int ctr=1;
								while(userItr.hasNext()){
									User u = userItr.next();
									%>
									<tr>
										<td><%=ctr++ %></td>
										<td><%=u.getFullName() %></td>
										<td><%=u.getUserType() %></td>
										<td>
											<a href="#.jsp" onclick="showEditFieldsOfThisUser(<%=u.getId() %>);">Edit</a>
										</td>
										<td>
											<a href="#.jsp" onclick="deleteThisUser(<%=u.getId() %>);">Delete</a>
										</td>
									</tr>
									<%
										String divId = "userEditDiv"+u.getId();
									%>
									<tr>
										<td colspan="5">
											<div id="<%=divId %>"></div>
										</td>
									</tr>
									<%
								}//end while loop
							}else{
								%>
								<p class="msg info"><label id="lblnoinformationfound"><%
					String lblNoInformationFound = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnoinformationfound");
					label = Label.getLabelUsingLabelId("lblnoinformationfound");
					out.print(lblNoInformationFound != null ? lblNoInformationFound : label.getLabelCaption());
				%></label></p>
								<%
							}
						%>
					</table>
				</fieldset>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#txtfullname').focus();
		$('#btncreate').click(function(){
			var fullName = $('#txtfullname').val();
			var userType = $('#slctusertype').val();
			var username = $('#txtusername').val();
			var password = $('#txtpassword').val();
			var dataString = "fullName="+fullName+"&userType="+userType+"&username="+username+"&password="+password;
			$.ajax({
			    url: 'createnewuser.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){		    		
			    		$('#subTabDetailDiv').load('showusermanagement.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			 });	
		});	
	});//end document.ready function
	
	function showEditFieldsOfThisUser(userId){		
		var divId = "userEditDiv"+userId;
		$('#'+divId).load('showeditfieldsofthisuser.jsp?userId='+userId);			
	}
	
	function deleteThisUser(userId){
		if(window.confirm("Are you sure you want to delete this user?")){
			var dataString = "userId="+userId;
			$.ajax({
			    url: 'deletethisuser.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){		    		
			    		$('#subTabDetailDiv').load('showusermanagement.jsp');				
			    },
			    error:function(error){
					alert(error);
			    }
			 });		
		}
	}
</script>