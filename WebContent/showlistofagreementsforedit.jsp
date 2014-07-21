<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.Date"%>
<%
	Account account = (Account) session.getAttribute("account");
	int userId = account.getUserId();
	//now get all agreements modified by this investigator user id
	List<Agreement> agreementList = Agreement.getAllAgreementsModifiedBy(userId);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(!agreementList.isEmpty()){
		Iterator<Agreement> agreementItr = agreementList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-weight:bolder;">
				<td><label id="lblserialnumber"><%
						String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
						label = Label.getLabelUsingLabelId("lblserialnumber");
		 				out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
		 			%></label></td>
				<td><label id="lblfilenumber"><%
						String lblFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilenumber");
						label = Label.getLabelUsingLabelId("lblfilenumber");
		 				out.print(lblFileNumber != null ? lblFileNumber : label.getLabelCaption());
		 			%></label></td>
				<td><label id="lblagreementdate"><%
						String lblAgreementDate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblagreementdate");
						label = Label.getLabelUsingLabelId("lblagreementdate");
		 				out.print(lblAgreementDate != null ? lblAgreementDate : label.getLabelCaption());
		 			%></label></td>
				<td><label id="lbledit"><%
						String lblEdit = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbledit");
						label = Label.getLabelUsingLabelId("lbledit");
		 				out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
		 			%></label></td>							
			</tr>
			<%
				int ctr=1;
				while(agreementItr.hasNext()){
					Agreement agreement = agreementItr.next();
					%>
						<tr>
							<td><%=ctr++ %></td>
							<td><%=agreement.getFileNumber() %></td>
							<td>
								<%				
								if(langId == 1){
									///now convert the greg date to ethiopic date and show the values in the						
									StringTokenizer tokenD = new StringTokenizer(String.valueOf(agreement.getAgreementDate()),"-");
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
										EthiopicMonth ethiopicMonth = EthiopicMonth.getEthiopicMonthByMonthIndex(day.getMonth());
										out.print(ethiopicMonth.getMonthName()+" "+ethDblDate+", "+day.getYear());
									}
								}else{
									out.print(agreement.getAgreementDate());
								}
								%>								
							</td>
							<td>
								<a href="#.jsp" onclick="showDetailsOfThisAgreementForEdit(<%=agreement.getId() %>);">
									<label id="lbledit">
										<%
											label = Label.getLabelUsingLabelId("lbledit");
							 				out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
										%>
									</label>
								</a>
								|
								<a href="#.jsp" onclick="hideDetailsOfThisAgreement(<%=agreement.getId() %>);">
									<label id="lblhide">
										<%
											String lblHide = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblhide");
											label = Label.getLabelUsingLabelId("lblhide");
							 				out.print(lblHide != null ? lblHide : label.getLabelCaption());
										%>
									</label>
								</a>
							</td>
						</tr>
						<%
							String divId = "agreementDetailDiv" + agreement.getId();
						%>
						<tr>
							<td colspan="4">
								<div id="<%=divId%>"></div>
							</td>
						</tr>
					<%
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
			<p class="msg warning">There is no information found!</p>
		<%
	}
%>
<script type="text/javascript">
	function showDetailsOfThisAgreementForEdit(agreementId){
		var divId = "agreementDetailDiv" + agreementId;
		$('#'+divId).load('showdetailsofthisagreementforedit.jsp?agreementId='+agreementId);
	}
	
	function hideDetailsOfThisAgreement(agreementId){
		var divId = "agreementDetailDiv" + agreementId;
		$('#'+divId).html('');
	}
</script>