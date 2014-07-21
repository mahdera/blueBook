<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	ApplicantAddress applicantAddress = ApplicantAddress.getAddressOfThisApplicant(applicantId);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	if(applicantAddress != null){
		%>
		<table border="0" width="100%" style="background:lightyellow">
			<tr>
				<td>
					<label id="lblregion">
						<%
							String lblRegion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregion");
							label = Label.getLabelUsingLabelId("lblregion");
			 				out.print(lblRegion != null ? lblRegion : label.getLabelCaption());
			 			%>
					</label>
				</td>
				<td><%
						if(langId == 1){
							AdminFieldTranslation regionTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, applicantAddress.getRegion());
							out.print(regionTranslation.getTranslatedValue());
						}else{
							AdminField regionField = AdminField.getAdminField(applicantAddress.getRegion());
							out.print(regionField.getOptionValue());
						}
					%>
				</td>
			</tr>
			<tr>
				<td>
					<label id="lblzone">
						<%
							String lblZone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblzone");
							label = Label.getLabelUsingLabelId("lblzone");
			 				out.print(lblZone != null ? lblZone : label.getLabelCaption());
			 			%>
					</label>
				</td>
				<td>
					<%
						if(langId == 1){
							AdminFieldTranslation zoneTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, applicantAddress.getApplicantZone());
							out.print(zoneTranslation.getTranslatedValue());
						}else{
							AdminField zoneField = AdminField.getAdminField(applicantAddress.getApplicantZone());
							out.print(zoneField.getOptionValue());
						}
					%>
				</td>
			</tr>
			<tr>
				<td>
					<label id="lblworeda">
						<%
							String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
							label = Label.getLabelUsingLabelId("lblworeda");
			 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
			 			%>
					</label>
				</td>
				<td>
					<%
						if(langId == 1){
							AdminFieldTranslation woredaTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, applicantAddress.getWoreda());
							out.print(woredaTranslation.getTranslatedValue());
						}else{
							AdminField woredaField = AdminField.getAdminField(applicantAddress.getWoreda());
							out.print(woredaField.getOptionValue());
						}
					%>		
				</td>
			</tr>
			<tr>
				<td>
					<label id="lblkebele">
						<%
							String lblKebele = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblkebele");
							label = Label.getLabelUsingLabelId("lblkebele");
			 				out.print(lblKebele != null ? lblKebele : label.getLabelCaption());
			 			%>
					</label>
				</td>
				<td><%=applicantAddress.getKebele() %></td>
			</tr>
			<tr>
				<td>
					<label id="lblofficetelephone">
						<%
							String lblOfficeTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblofficetelephone");
							label = Label.getLabelUsingLabelId("lblofficetelephone");
			 				out.print(lblOfficeTelephone != null ? lblOfficeTelephone : label.getLabelCaption());
			 			%>
					</label>
				</td>
				<td><%=applicantAddress.getOfficeTelephone() %></td>
			</tr>
			<tr>
				<td>
					<label id="lblhometelephone">
						<%
							String lblHomeTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblhometelephone");
							label = Label.getLabelUsingLabelId("lblhometelephone");
			 				out.print(lblHomeTelephone != null ? lblHomeTelephone : label.getLabelCaption());
			 			%>
					</label>
				</td>
				<td><%=applicantAddress.getHomeTelephone() %></td>
			</tr>
			<tr>
				<td>
					<label id="lblmobiletelephone">
						<%
							String lblMobileTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmobiletelephone");
							label = Label.getLabelUsingLabelId("lblmobiletelephone");
			 				out.print(lblMobileTelephone != null ? lblMobileTelephone : label.getLabelCaption());
			 			%>
					</label>
				</td>
				<td><%=applicantAddress.getMobileTelephone() %></td>
			</tr>
			<tr>
				<td>
					<label id="lblemail">
						<%
							String lblEmail = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblemail");
							label = Label.getLabelUsingLabelId("lblemail");
			 				out.print(lblEmail != null ? lblEmail : label.getLabelCaption());
			 			%>
					</label>
				</td>
				<td><%=applicantAddress.getEmail() %></td>
			</tr>			
		</table>
		<%
	}else{
		%>
			<p class="msg warning">
				<label id="lblnoinformationfound">
					<%
						String lblNoInformationFound = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnoinformationfound");
						label = Label.getLabelUsingLabelId("lblnoinformationfound");
		 				out.print(lblNoInformationFound != null ? lblNoInformationFound : label.getLabelCaption());
		 			%>
				</label>
			</p>
		<%
	}
%>