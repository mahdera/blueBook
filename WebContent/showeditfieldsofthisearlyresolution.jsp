<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long earlyResolutionId = Long.parseLong(request.getParameter("earlyResolutionId"));
	EarlyResolution earlyObj = EarlyResolution.getEarlyResolution(earlyResolutionId);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	//now define the field names in here...	
	String officerEffortControlName = "textareaofficereffort" + earlyResolutionId;
	String respondentResponseControlName = "textarearespondentresponse" + earlyResolutionId;
	String applicantReactionControlName = "textareaapplicantreaction" + earlyResolutionId;
	String resolutionDateControlName = "txtresolutiondate" + earlyResolutionId;
	String resultControlName = "slctresult" + earlyResolutionId;
	String resolutionDateSelectControlName = "slctresolutiondate" + earlyResolutionId;
	String resolutionMonthSelectControlName = "slctresolutionmonth" + earlyResolutionId;
	String resolutionYearSelectControlName = "slctresolutionyear" + earlyResolutionId;
	String resolutionDateControlNameEthiopic = "txtresolutiondateethiopic" + earlyResolutionId;
%>
<form>
<div id="errorDiv"></div>
<table border="0" width="100%" style="background:#eee">
	<tr>
		<td><font color="red">*</font><label id="lblofficereffort"><%
					String lblOfficerEffort = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblofficereffort");
					label = Label.getLabelUsingLabelId("lblofficereffort");
	 				out.print(lblOfficerEffort != null ? lblOfficerEffort : label.getLabelCaption());
	 			%></label></td>
		<td>
			<textarea class="jqte-test" name="<%=officerEffortControlName %>" id="<%=officerEffortControlName %>" cols="70" rows="4"><%=earlyObj.getOfficerEffort() %></textarea>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font><label id="lblrespondentresponse"><%
					String lblRespondentResponse = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentresponse");
					label = Label.getLabelUsingLabelId("lblrespondentresponse");
	 				out.print(lblRespondentResponse != null ? lblRespondentResponse : label.getLabelCaption());
	 			%></label></td>
		<td>
			<textarea class="jqte-test" name="<%=respondentResponseControlName %>" id="<%=respondentResponseControlName %>" cols="70" rows="4"><%=earlyObj.getRespondentResponse() %></textarea>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font><label id="lblapplicantreaction"><%
					String lblApplicantReaction = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantreaction");
					label = Label.getLabelUsingLabelId("lblapplicantreaction");
	 				out.print(lblApplicantReaction != null ? lblApplicantReaction : label.getLabelCaption());
	 			%></label></td>
		<td>
			<textarea class="jqte-test" name="<%=applicantReactionControlName %>" id="<%=applicantReactionControlName %>" cols="70" rows="4"><%=earlyObj.getApplicantReaction() %></textarea>
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
					///now convert the greg date to ethiopic date and show the values in the 
					//drop down controls...
					StringTokenizer tokenD = new StringTokenizer(String.valueOf(earlyObj.getResolutionDate()),"-");
					String gregStrYear = tokenD.nextToken();
					String gregStrMonth = tokenD.nextToken();
					String gregStrDate = tokenD.nextToken();
					//now convert this to Ethiopic date...
					Day day = DateConverter.toEthiopian(Integer.parseInt(gregStrDate), Integer.parseInt(gregStrMonth), 
							Integer.parseInt(gregStrYear));
					if(day != null){
						String ethDblMonth = "";
						String ethDblDate = "";
						if(day.getMonth() < 10){
							ethDblMonth = "0" + day.getMonth();
						}else{
							ethDblMonth = String.valueOf(day.getMonth());
						}
						
						if(day.getDate() < 10){
							ethDblDate = "0" + day.getDate();	
						}else{
							ethDblDate = String.valueOf(day.getDate());
						}
						
						String strEthDate = day.getYear()+"-"+ethDblMonth+"-"+ethDblDate;		
						Date ethDate = Date.valueOf(strEthDate.trim());						
					}
					%>
						<table border="0" width="100%">
        						<tr style="background:#ccc">
        							<td>ቀን</td>
        							<td>ወር</td>
        							<td>ዓመት</td>
        						</tr>
        						<tr>
        							<td>
        								<select name="<%=resolutionDateSelectControlName %>" id="<%=resolutionDateSelectControlName %>" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
        										for(int i=1;i<=30;i++){
        											if(day.getDate() == i){
        											%>
        												<option value="<%=i %>" selected="selected"><%=i %></option>
        											<%
        											}else{
        											%>
        												<option value="<%=i %>"><%=i %></option>
        											<%
        											}
        										}//end for...loop
        									%>
        								</select>
        							</td>
        							<td>
        								<select name="<%=resolutionMonthSelectControlName %>" id="<%=resolutionMonthSelectControlName %>" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
        										List<EthiopicMonth> ethiopicMonthList = EthiopicMonth.getAllEthiopicMonths();
        										Iterator<EthiopicMonth> ethiopicMonthItr = ethiopicMonthList.iterator();
        										while(ethiopicMonthItr.hasNext()){
        											EthiopicMonth ethiopicMonth = ethiopicMonthItr.next();
        											if(day.getMonth() == ethiopicMonth.getMonthIndex()){
        											%>
        												<option value="<%=ethiopicMonth.getMonthIndex() %>" selected="selected"><%=ethiopicMonth.getMonthName() %></option>
        											<%
        											}else{
        											%>
        												<option value="<%=ethiopicMonth.getMonthIndex() %>"><%=ethiopicMonth.getMonthName() %></option>
        											<%
        											}
        										}//end while loop
        									%>
        								</select>
        							</td>
        							<td>
        								<select name="<%=resolutionYearSelectControlName %>" id="<%=resolutionYearSelectControlName %>" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
         									int startYear = year - 5;
         									for(int i=year;i>=startYear;i--){
         										Day ethiopicDay = DateConverter.toEthiopian(1, 1, i);
         										int ethYear = ethiopicDay.getYear();
         										if(day.getYear() == ethYear){
         										%>
         											<option value="<%=ethYear%>" selected="selected"><%=ethYear %></option>
         										<%
         										}else{
         										%>
         											<option value="<%=ethYear%>"><%=ethYear %></option>
         										<%
         										}
         									}//end for...loop
        									%>
        								</select>        								
        							</td>
        						</tr>
        					</table>
					<%
				}else{
			%>
				<input type="text" name="<%=resolutionDateControlName %>" id="<%=resolutionDateControlName %>" value="<%=earlyObj.getResolutionDate() %>"/>				
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
			<select name="<%=resultControlName %>" id="<%=resultControlName %>" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> adminFieldList = AdminField.getAllOptionValuesForThisFieldName("Result");
					if(!adminFieldList.isEmpty()){
						Iterator<AdminField> adminFieldItr = adminFieldList.iterator();
						while(adminFieldItr.hasNext()){
							AdminField adminField = adminFieldItr.next();
							if(adminField.getOptionValue().equalsIgnoreCase(earlyObj.getResult())){
								AdminFieldTranslation resultField = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
								if(resultField != null){
									%>
										<option value="<%=adminField.getOptionValue() %>" selected="selected"><%=resultField.getTranslatedValue() %></option>
									<%
								}else{
									%>
										<option value="<%=adminField.getOptionValue() %>" selected="selected"><%=adminField.getOptionValue() %></option>
									<%
								}
							}else{
								AdminFieldTranslation resultField = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
								if(resultField != null){
									%>							
										<option value="<%=adminField.getOptionValue() %>"><%=resultField.getTranslatedValue() %></option>
									<%
								}else{
									%>
										<option value="<%=adminField.getOptionValue() %>"><%=adminField.getOptionValue() %></option>
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
			<input type="hidden" name="<%=resolutionDateControlNameEthiopic %>" id="<%=resolutionDateControlNameEthiopic %>" value="<%=earlyObj.getResolutionDate() %>"/>
			<%
				String buttonId = "btnupdate" + earlyResolutionId;
			
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
<script type="text/javascript">
	$(document).ready(function(){
		var earlyResolutionId = "<%=earlyResolutionId%>";
		var resolutionDateControlName = "txtresolutiondate" + earlyResolutionId;
		$('#'+resolutionDateControlName).Zebra_DatePicker();
		
		$('.jqte-test').jqte();			
		// settings of status
		var jqteStatus = true;
		$(".status").click(function()
		{
			jqteStatus = jqteStatus ? false : true;
			$('.jqte-test').jqte({"status" : jqteStatus})
		});
		
		
		var buttonId = "btnupdate" + earlyResolutionId;
		var langId = "<%=langId%>";
		
		//here define the control names...
		var resolutionDateSelectControlName = "slctresolutiondate" + earlyResolutionId;
		var resolutionMonthSelectControlName = "slctresolutionmonth" + earlyResolutionId;
		var resolutionYearSelectControlName = "slctresolutionyear" + earlyResolutionId;		
		var resolutionDateControlNameEthiopic = "txtresolutiondateethiopic" + earlyResolutionId;
		
		$('#'+resolutionDateSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicResolutionDate = $('#'+resolutionDateSelectControlName).val();
			var ethiopicResolutionMonth = $('#'+resolutionMonthSelectControlName).val();
			var ethiopicResolutionYear = $('#'+resolutionYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicResolutionDate != "" && ethiopicResolutionMonth != "" && ethiopicResolutionYear != ""){
				var resolutionDateDataString = "dateDataString="+ethiopicResolutionDate+":"+ethiopicResolutionMonth+":"+ethiopicResolutionYear;
							
				$.ajax({
					type:'POST',
					data : resolutionDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+resolutionDateControlNameEthiopic).val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#'+resolutionMonthSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicResolutionDate = $('#'+resolutionDateSelectControlName).val();
			var ethiopicResolutionMonth = $('#'+resolutionMonthSelectControlName).val();
			var ethiopicResolutionYear = $('#'+resolutionYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicResolutionDate != "" && ethiopicResolutionMonth != "" && ethiopicResolutionYear != ""){
				var resolutionDateDataString = "dateDataString="+ethiopicResolutionDate+":"+ethiopicResolutionMonth+":"+ethiopicResolutionYear;
							
				$.ajax({
					type:'POST',
					data : resolutionDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+resolutionDateControlNameEthiopic).val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#'+resolutionYearSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicResolutionDate = $('#'+resolutionDateSelectControlName).val();
			var ethiopicResolutionMonth = $('#'+resolutionMonthSelectControlName).val();
			var ethiopicResolutionYear = $('#'+resolutionYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicResolutionDate != "" && ethiopicResolutionMonth != "" && ethiopicResolutionYear != ""){
				var resolutionDateDataString = "dateDataString="+ethiopicResolutionDate+":"+ethiopicResolutionMonth+":"+ethiopicResolutionYear;
							
				$.ajax({
					type:'POST',
					data : resolutionDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+resolutionDateControlNameEthiopic).val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...			
			var officerEffortControlName = "textareaofficereffort" + earlyResolutionId;
			var respondentResponseControlName = "textarearespondentresponse" + earlyResolutionId;
			var applicantReactionControlName = "textareaapplicantreaction" + earlyResolutionId;
			var resolutionDateControlName = "txtresolutiondate" + earlyResolutionId;
			var resultControlName = "slctresult" + earlyResolutionId;
			////			
			var officerEffort = $('#'+officerEffortControlName).val();
			var respondentResponse = $('#'+respondentResponseControlName).val();
			var applicantReaction = $('#'+applicantReactionControlName).val();
			var resolutionDate = null;
			if(langId == 1){
				resolutionDate = $('#'+resolutionDateControlNameEthiopic).val().trim();
			}else{
				resolutionDate = $('#'+resolutionDateControlName).val().trim();
			}
			var result = $('#'+resultControlName).val();
			
			if(officerEffort != "" && respondentResponse != "" && applicantReaction != "" &&
					resolutionDate != "" && result != ""){
				var dataString = "officerEffort="+officerEffort+"&respondentResponse="+
				respondentResponse+"&applicantReaction="+applicantReaction+"&resolutionDate="+resolutionDate+
				"&result="+result+"&earlyResolutionId="+earlyResolutionId;
				
				$.ajax({
				    url: 'updateearlyresolution.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		var divId = "earlyResolutionEditDiv"+earlyResolutionId;
				    		$('#'+divId).html(response);				
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