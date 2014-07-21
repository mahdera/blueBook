<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "earlyResolutionManagement";
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(true){		
%>
<form>
<div id="errorDiv"></div>
<table border="0" width="100%" style="background:#eee">
	<tr>
		<td><font color="red">*</font><label id="lblfilenumber"><%
					String lblFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilenumber");
					label = Label.getLabelUsingLabelId("lblfilenumber");
	 				out.print(lblFileNumber != null ? lblFileNumber : label.getLabelCaption());
	 			%></label></td>
		<td>
			<%
				String lblSearchButtonLabel = "lblsearchbutton";
				String searchButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsearchbutton");
				label = Label.getLabelUsingLabelId("lblsearchbutton");
				String serachButtonCaption = searchButtonLabel != null ? searchButtonLabel : label.getLabelCaption();
			%>
			<input type="text" name="txtfilenumber" id="txtfilenumber"/>
			<input type="button" id="btnsearch" value="<%=serachButtonCaption%>"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div id="fileDetailDiv"></div>
		</td>
	</tr>
	<tr>
		<td style="vertical-align:middle"><font color="red">*</font><label id="lblofficereffort"><%
					String lblOfficerEffort = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblofficereffort");
					label = Label.getLabelUsingLabelId("lblofficereffort");
	 				out.print(lblOfficerEffort != null ? lblOfficerEffort : label.getLabelCaption());
	 			%></label></td>
		<td>
			<textarea class="jqte-test" name="textareaofficereffort" id="textareaofficereffort" cols="70" rows="4"></textarea>
		</td>
	</tr>
	<tr>
		<td style="vertical-align:middle"><font color="red">*</font><label id="lblrespondentresponse"><%
					String lblRespondentResponse = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentresponse");
					label = Label.getLabelUsingLabelId("lblrespondentresponse");
	 				out.print(lblRespondentResponse != null ? lblRespondentResponse : label.getLabelCaption());
	 			%></label></td>
		<td>
			<textarea class="jqte-test" name="textarearespondentresponse" id="textarearespondentresponse" cols="70" rows="4"></textarea>
		</td>
	</tr>
	<tr>
		<td style="vertical-align:middle"><font color="red">*</font><label id="lblapplicantreaction"><%
					String lblApplicantReaction = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantreaction");
					label = Label.getLabelUsingLabelId("lblapplicantreaction");
	 				out.print(lblApplicantReaction != null ? lblApplicantReaction : label.getLabelCaption());
	 			%></label></td>
		<td>
			<textarea class="jqte-test" name="textareaapplicantreaction" id="textareaapplicantreaction" cols="70" rows="4"></textarea>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font><label id="lblresolutiondate"><%
					String lblResolutionDate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblresolutiondate");
					label = Label.getLabelUsingLabelId("lblresolutiondate");
	 				out.print(lblResolutionDate != null ? lblResolutionDate : label.getLabelCaption());
	 			%></label></td>
		<td>
			<%
				if(langId == 1){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					Calendar cal = Calendar.getInstance();
					String currentDate = dateFormat.format(cal.getTime());
					Date modificationDate = Date.valueOf(currentDate);
					StringTokenizer token = new StringTokenizer(currentDate,"-");
					String strYear = token.nextToken();	
					int year = Integer.parseInt(strYear);
					%>
						<table border="0" width="100%">
        						<tr style="background:#ccc">
        							<td>ቀን</td>
        							<td>ወር</td>
        							<td>ዓመት</td>
        						</tr>
        						<tr>
        							<td>
        								<select name="slctresolutiondate" id="slctresolutiondate" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
        										for(int i=1;i<=30;i++){
        											%>
        												<option value="<%=i %>"><%=i %></option>
        											<%
        										}//end for...loop
        									%>
        								</select>
        							</td>
        							<td>
        								<select name="slctresolutionmonth" id="slctresolutionmonth" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
        										List<EthiopicMonth> ethiopicMonthList = EthiopicMonth.getAllEthiopicMonths();
        										Iterator<EthiopicMonth> ethiopicMonthItr = ethiopicMonthList.iterator();
        										while(ethiopicMonthItr.hasNext()){
        											EthiopicMonth ethiopicMonth = ethiopicMonthItr.next();
        											%>
        												<option value="<%=ethiopicMonth.getMonthIndex() %>"><%=ethiopicMonth.getMonthName() %></option>
        											<%
        										}//end while loop
        									%>
        								</select>
        							</td>
        							<td>
        								<select name="slctresolutionyear" id="slctresolutionyear" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
         									int startYear = year - 5;
         									for(int i=year;i>=startYear;i--){
         										Day ethiopicDay = DateConverter.toEthiopian(1, 1, i);
         										int ethYear = ethiopicDay.getYear();
         										%>
         											<option value="<%=ethYear%>"><%=ethYear %></option>
         										<%
         									}//end for...loop
        									%>
        								</select>
        								<input type="hidden" name="txtresolutiondate" id="txtresolutiondate"/>
        							</td>
        						</tr>
        					</table>
					<%
				}else{
			%>
					<input type="text" name="txtresolutiondate" id="txtresolutiondate"/>					
			<%
				}
			%>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font><label id="lblresult"><%
					String lblResult = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblresult");
					label = Label.getLabelUsingLabelId("lblresult");
	 				out.print(lblResult != null ? lblResult : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="slctresult" id="slctresult" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> adminFieldList = AdminField.getAllOptionValuesForThisFieldName("Result");
					if(!adminFieldList.isEmpty()){
						Iterator<AdminField> adminFieldItr = adminFieldList.iterator();
						while(adminFieldItr.hasNext()){
							AdminField adminField = adminFieldItr.next();
							AdminFieldTranslation resultAdminField = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
							if(resultAdminField != null){
							%>
								<option value="<%=adminField.getOptionValue() %>"><%=resultAdminField.getTranslatedValue() %></option>
							<%
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
		 			%></label>
		 	</p>
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
		
		$('#txtresolutiondate').Zebra_DatePicker();
		
		$('.jqte-test').jqte();			
		// settings of status
		var jqteStatus = true;
		$(".status").click(function()
		{
			jqteStatus = jqteStatus ? false : true;
			$('.jqte-test').jqte({"status" : jqteStatus})
		});
		
		$('#txtfilenumber').focus();
		$('#btnsearch').click(function(){
			var fileNumber = $('#txtfilenumber').val();
			if(fileNumber != ""){
				$('#fileDetailDiv').load('searchandshowdetailsofthisfilenumber.jsp?fileNumber='+fileNumber);
			}
		});
		
		$('#slctresolutionyear').change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#slctresolutiondate').val();
			var ethiopicRegistrationMonth = $('#slctresolutionmonth').val();
			var ethiopicRegistrationYear = $('#slctresolutionyear').val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
								
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#txtresolutiondate').val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#slctresolutionmonth').change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#slctresolutiondate').val();
			var ethiopicRegistrationMonth = $('#slctresolutionmonth').val();
			var ethiopicRegistrationYear = $('#slctresolutionyear').val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
								
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#txtresolutiondate').val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#slctresolutiondate').change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#slctresolutiondate').val();
			var ethiopicRegistrationMonth = $('#slctresolutionmonth').val();
			var ethiopicRegistrationYear = $('#slctresolutionyear').val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
								
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#txtresolutiondate').val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#btnsave').click(function(){
			var fileNumber = $('#txtfilenumber').val();
			var officerEffort = $('#textareaofficereffort').val();
			var respondentResponse = $('#textarearespondentresponse').val();
			var applicantReaction = $('#textareaapplicantreaction').val();
			var resolutionDate = $('#txtresolutiondate').val().trim();
			var result = $('#slctresult').val();
			
			if(fileNumber != "" && officerEffort != "" && respondentResponse != "" && applicantReaction != "" &&
					resolutionDate != "" && result != ""){
				var dataString = "fileNumber="+fileNumber+"&officerEffort="+officerEffort+"&respondentResponse="+
				respondentResponse+"&applicantReaction="+applicantReaction+"&resolutionDate="+resolutionDate+
				"&result="+result;
				
				$.ajax({
				    url: 'saveearlyresolution.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){		    		
				    		$('#subTabDetailDiv').html(response);				
				    },
				    error:function(error){
						alert(error);
				    }
				 });	
			}else{
				$('#errorDiv').html("<p class='msg error'>Please enter all the required data fields!</p>");
			}			
		});
	});//end document.ready function
</script>