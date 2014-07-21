<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String region = request.getParameter("region");
	String zone = request.getParameter("zone");
	String woreda = request.getParameter("woreda");
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	List<Applicant> applicantList = null;
	Iterator<Applicant> applicantItr = null;
	
	applicantList = Applicant.getAllApplicantsWithTheseAddressFilters(region,zone,woreda);	
	
	if(!applicantList.isEmpty()){
%>
<table border="0" width="100%">
	<tr style="background:#eee;font-size:12pt;font-style:bolder">
		<td><label id="lblserialnumber"><%
						String lblSerailNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
						label = Label.getLabelUsingLabelId("lblserialnumber");
		 				out.print(lblSerailNumber != null ? lblSerailNumber : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblapplicantidnumber"><%
						String lblApplicantIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantidnumber");
						label = Label.getLabelUsingLabelId("lblapplicantidnumber");
		 				out.print(lblApplicantIdNumber != null ? lblApplicantIdNumber : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblfullname"><%
						String lblFullName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfullname");
						label = Label.getLabelUsingLabelId("lblfullname");
		 				out.print(lblFullName != null ? lblFullName : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblsex"><%
						String lblSex = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsex");
						label = Label.getLabelUsingLabelId("lblsex");
		 				out.print(lblSex != null ? lblSex : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblagecategory"><%
						String lblAgeCategory = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblagecategory");
						label = Label.getLabelUsingLabelId("lblagecategory");
		 				out.print(lblAgeCategory != null ? lblAgeCategory : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblnumberofapplicantsmale"><%
						String lblNumberOfMaleApplicants = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnumberofapplicantsmale");
						label = Label.getLabelUsingLabelId("lblnumberofapplicantsmale");
		 				out.print(lblNumberOfMaleApplicants != null ? lblNumberOfMaleApplicants : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblnumberofapplicantsfemale"><%
						String lblNumberOfFemaleApplicants = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnumberofapplicantsfemale");
						label = Label.getLabelUsingLabelId("lblnumberofapplicantsfemale");
		 				out.print(lblNumberOfFemaleApplicants != null ? lblNumberOfFemaleApplicants : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lbloccupation"><%
						String lblOccupation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbloccupation");
						label = Label.getLabelUsingLabelId("lbloccupation");
		 				out.print(lblOccupation != null ? lblOccupation : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lbldisability"><%
						String lblDisability = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldisability");
						label = Label.getLabelUsingLabelId("lbldisability");
		 				out.print(lblDisability != null ? lblDisability : label.getLabelCaption());
		 			%></label></td>		
		<td><label id="lbledit"><%
						String lblEdit = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbledit");
						label = Label.getLabelUsingLabelId("lbledit");
		 				out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
		 			%></label></td>
	</tr>
	<%
		applicantItr = applicantList.iterator();
		int ctr=1;
		while(applicantItr.hasNext()){
			Applicant applicant = applicantItr.next();
			%>
			<tr>
				<td><%=ctr++ %></td>
				<td><%=applicant.getApplicantIdNumber() %></td>
				<td><%=applicant.getFullName() %></td>
				<td><%=applicant.getSex() %></td>
				<td><%=applicant.getAgeCategory() %></td>
				<td><%=applicant.getNumberOfApplicantsMale() %></td>
				<td><%=applicant.getNumberOfApplicantsFemale() %></td>
				<td><%=applicant.getOccupation() %></td>
				<td><%=applicant.getDisability() %></td>
				<td>
					<a href="#.jsp" onclick="showEditFieldsOfThisApplicant(<%=applicant.getId() %>);">
						<label id="lbledit">
							<%								
								label = Label.getLabelUsingLabelId("lbledit");
				 				out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
				 			%>
						</label>
					</a> 
					|
					<a href="#.jsp" onclick="hideEditFieldsOfThisApplicant(<%=applicant.getId()%>);">
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
				String divId = "applicantEditDiv"+applicant.getId();
			%>
			<tr>
				<td colspan="10">
					<div id="<%=divId %>"></div>
				</td>
			</tr>
			<%
		}//end while loop
	%>
</table>
<%
	}else{
		%>
		<p class="msg warning">No applicant information with the parameter given/በተሠጠው የማጣሪያ መሥፈርት መሠረት የአመልካች መረጃ ለማግኝት አልተቻለም</p>
		<%
	}
%>
<script type="text/javascript">
	function showEditFieldsOfThisApplicant(applicantId){
		var divId = "applicantEditDiv" + applicantId;
		$('#'+divId).load('showeditfieldsofthisapplicant.jsp?applicantId='+applicantId);
	}
	
	function hideEditFieldsOfThisApplicant(applicantId){
		var divId = "applicantEditDiv" + applicantId;
		$('#'+divId).html('');
	}
</script>
