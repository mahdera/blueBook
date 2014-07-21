<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long appealId = Long.parseLong(request.getParameter("appealId"));
	Appeal appeal = Appeal.getAppeal(appealId);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	//now define the control names in here...
	String appealReasonControlName = "textareaappealreason" + appealId;
	String registrationDateControlName = "txtappealdate" + appealId;
	String registrationDateEthiopicControlName = "txtappealdateethiopic" + appealId;
	String dateSelectControlName = "slctappealdate" + appealId;
	String monthSelectControlName = "slctappealmonth" + appealId;
	String yearSelectControlName = "slctappealyear" + appealId;
	String buttonId = "btnupdate" + appealId;
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td><label id="lblappealreason">
				<%
						String lblAppealReason = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealreason");
						label = Label.getLabelUsingLabelId("lblappealreason");
						out.print(lblAppealReason != null ? lblAppealReason : label.getLabelCaption());
					%>
			</label></td>
			<td>
				<textarea name="<%=appealReasonControlName %>" id="<%=appealReasonControlName %>" style="width:100%" class="jqte-test"><%=appeal.getAppealReason() %></textarea>
			</td>
		</tr>
		<tr>
			<td><label id="lblregistrationdate">
				<%
						String lblRegistrationDate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregistrationdate");
						label = Label.getLabelUsingLabelId("lblregistrationdate");
						out.print(lblRegistrationDate != null ? lblRegistrationDate : label.getLabelCaption());
					%>
			</label></td>
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
						///
						StringTokenizer tokenD = new StringTokenizer(String.valueOf(appeal.getRegistrationDate()),"-");
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
	        								<select name="<%=dateSelectControlName %>" id="<%=dateSelectControlName %>" style="width:100%">
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
	        								<select name="<%=monthSelectControlName %>" id="<%=monthSelectControlName %>" style="width:100%">
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
	        								<select name="<%=yearSelectControlName %>" id="<%=yearSelectControlName %>" style="width:100%">
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
	        								<input type="hidden" name="<%=registrationDateEthiopicControlName %>" id="<%=registrationDateEthiopicControlName %>" value="<%=appeal.getRegistrationDate() %>"/>
	        							</td>
	        						</tr>
	        					</table>
						<%
					}else{
				%>
						<input id="<%=registrationDateControlName%>" type="text" name="<%=registrationDateControlName%>" value="<%=appeal.getRegistrationDate() %>"/>
						<img onclick="javascript:NewCssCal('<%=registrationDateControlName%>');" src="sample/images/cal.gif"/>
				<%
					}
				%>
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
		$('.jqte-test').jqte();			
		// settings of status
		var jqteStatus = true;
		$(".status").click(function()
		{
			jqteStatus = jqteStatus ? false : true;
			$('.jqte-test').jqte({"status" : jqteStatus})
		});	
		
		var appealId = "<%=appealId %>";
		var langId = "<%=langId%>";
		var buttonId = "btnupdate" + appealId;
		
		var dateSelectControlName = "slctappealdate" + appealId;
		var monthSelectControlName = "slctappealmonth" + appealId;
		var yearSelectControlName = "slctappealyear" + appealId;		
		var registrationDateEthiopicControlName = "txtappealdateethiopic" + appealId;
		
		$('#'+dateSelectControlName).change(function(){			
			var ethiopicRegistrationDate = $('#'+dateSelectControlName).val();
			var ethiopicRegistrationMonth = $('#'+monthSelectControlName).val();
			var ethiopicRegistrationYear = $('#'+yearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
							
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+registrationDateEthiopicControlName).val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#'+monthSelectControlName).change(function(){			
			var ethiopicRegistrationDate = $('#'+dateSelectControlName).val();
			var ethiopicRegistrationMonth = $('#'+monthSelectControlName).val();
			var ethiopicRegistrationYear = $('#'+yearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
							
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+registrationDateEthiopicControlName).val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#'+yearSelectControlName).change(function(){			
			var ethiopicRegistrationDate = $('#'+dateSelectControlName).val();
			var ethiopicRegistrationMonth = $('#'+monthSelectControlName).val();
			var ethiopicRegistrationYear = $('#'+yearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
							
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+registrationDateEthiopicControlName).val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var appealReasonControlName = "textareaappealreason" + appealId;
			var registrationDateControlName = "txtappealdate" + appealId;
			var registrationDateEthiopicControlName = "txtappealdateethiopic" + appealId;
			///now get the values...
			var appealReason = $('#'+appealReasonControlName).val();
			var registrationDate = null;
			if(langId == 1){
				registrationDate = $('#'+registrationDateEthiopicControlName).val().trim();
			}else{
				registrationDate = $('#'+registrationDateControlName).val();
			}
			
			if(appealReason != "" && registrationDate != ""){
				var dataString = "appealId="+appealId+"&appealReason="+appealReason+
				"&registrationDate="+registrationDate;
				
				var divId = "appealEditDiv" + appealId; 
				
				$.ajax({
				    url: 'updateappeal.jsp',		
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
	});//end document.ready function
</script>