<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "caseManagement";
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(true){		
%>
<%
	List<Case> caseList = Case.getAllCases();
	if(!caseList.isEmpty()){
		Iterator<Case> caseItr = caseList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-size:11pt;font-weight:bolder">
				<td><label id="lblserialnumber"><%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
	 				out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblcasenumber"><%
					String lblCaseNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasenumber");
					label = Label.getLabelUsingLabelId("lblcasenumber");
	 				out.print(lblCaseNumber != null ? lblCaseNumber : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lbltheme"><%
					String lblCaseIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltheme");
					label = Label.getLabelUsingLabelId("lbltheme");
	 				out.print(lblCaseIdNumber != null ? lblCaseIdNumber : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblreliefsought"><%
					String lblReliefSought = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblreliefsought");
					label = Label.getLabelUsingLabelId("lblreliefsought");
	 				out.print(lblReliefSought != null ? lblReliefSought : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblcasecategory"><%
					String lblCaseCategory = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasecategory");
					label = Label.getLabelUsingLabelId("lblcasecategory");
	 				out.print(lblCaseCategory != null ? lblCaseCategory : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lbllinkage"><%
					String lblLinkage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllinkage");
					label = Label.getLabelUsingLabelId("lbllinkage");
	 				out.print(lblLinkage != null ? lblLinkage : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblevidencetype"><%
					String lblEvidenceType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblevidencetype");
					label = Label.getLabelUsingLabelId("lblevidencetype");
	 				out.print(lblEvidenceType != null ? lblEvidenceType : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblnumberofpages"><%
					String lblNumberOfPages = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnumberofpages");
					label = Label.getLabelUsingLabelId("lblnumberofpages");
	 				out.print(lblNumberOfPages != null ? lblNumberOfPages : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblmeansofapplication"><%
					String lblMeansOfApplication = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmeansofapplication");
					label = Label.getLabelUsingLabelId("lblmeansofapplication");
	 				out.print(lblMeansOfApplication != null ? lblMeansOfApplication : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblappliedby"><%
					String lblAppliedBy = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappliedby");
					label = Label.getLabelUsingLabelId("lblappliedby");
	 				out.print(lblAppliedBy != null ? lblAppliedBy : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblapplicant"><%
					String lblApplicant = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicant");
					label = Label.getLabelUsingLabelId("lblapplicant");
	 				out.print(lblApplicant != null ? lblApplicant : label.getLabelCaption());
	 			%></label></td>			
				<td><label id="lbldelete"><%
					String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
					label = Label.getLabelUsingLabelId("lbldelete");
	 				out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
	 			%></label></td>
			</tr>
			<%
				int ctr=1;
				while(caseItr.hasNext()){
					Case c = caseItr.next();
					Applicant applicant = Applicant.getApplicant(c.getApplicantId());
					%>
						<tr>
							<td><%=ctr++ %></td>
							<td><%=c.getCaseIdNumber() %></td>
							<td><%=c.getTheme() %></td>
							<td><%=c.getReliefSought() %></td>
							<td><%=c.getCaseCategoryId() %></td>
							<td>
								<%
									AdminField linkage = AdminField.getAdminField(c.getLinkageId());
									out.print(linkage != null ? linkage.getOptionValue() : "---");
								%>
							</td>
							<td>
								<%									
									AdminField evidence = AdminField.getAdminField(c.getEvidenceTypeId());
									out.print(evidence != null ? evidence.getOptionValue() : "---");
								%>
							</td>
							<td><%=c.getNumberOfPages() %></td>
							<td>
								<%
									AdminField meansOfApplication = AdminField.getAdminField(c.getMeansOfApplicationId());
									out.print(meansOfApplication != null ? meansOfApplication.getOptionValue() : "---");
								%>
							</td>
							<td>
								<%
									AdminField appliedBy = AdminField.getAdminField(c.getAppliedById());
									out.print(appliedBy != null ? appliedBy.getOptionValue() : "---");
								%>
							</td>
							<td>
								<%
									if(applicant != null)
										out.print(applicant.getFullName()); 
									else
										out.print("---");
								%>
							</td>
							<td align="center">
								<a href="#.jsp" onclick="deleteThisCase(<%=c.getId() %>);"><label id="lbldelete"><%
					String lblDelete1 = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
					label = Label.getLabelUsingLabelId("lbldelete");
	 				out.print(lblDelete1 != null ? lblDelete1 : label.getLabelCaption());
	 			%></label></a>
							</td>
						</tr>
						<%
							String divId = "caseEditDiv"+c.getId();
						%>
						<tr>
							<td colspan="12">
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
		<p class="msg warning" id="lblnoinformationfound">There is no information found</p>
		<%
	}
%>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	function deleteThisCase(caseId){
		var langId = "<%=langId %>";
		var displayMsg = "Are you sure you want to delete this case?";
		if(langId == 1){
			displayMsg = "ይህን የአቤቱታ/ጉዳይ መረጃ ለማስወገድ ፈልገዋል። እንግጠኛ ነዎት?";
		}
		if(window.confirm(displayMsg)){
			var dataString = "caseId="+caseId;
			$.ajax({					
			    url: 'deletethiscase.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){   		
			    		$('#subTabDetailDiv').load('showlistofcasesfordelete.jsp');			    		
			    },
			    error:function(error){
					alert(error);
			    }
			});			
		}
	}
</script>