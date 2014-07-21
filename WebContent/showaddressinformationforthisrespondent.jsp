<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	int respondentId = Integer.parseInt(request.getParameter("respondentId"));
	RespondentAddress rAddress = RespondentAddress.getRespondentAddressForThisRespondent(respondentId);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	if(rAddress != null){
		%>
		<table border="0" width="100%" style="background:lightyellow">
			<tr>
				<td><label id="lblregion"><%
					String lblRegion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregion");
					label = Label.getLabelUsingLabelId("lblregion");
	 				out.print(lblRegion != null ? lblRegion : label.getLabelCaption());
	 			%></label></td>
				<td>
					<%
						AdminField region = AdminField.getAdminField(rAddress.getRegionId());
						AdminFieldTranslation regionTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, region.getId());
						out.print(regionTranslation != null ? regionTranslation.getTranslatedValue() : region.getOptionValue());
					%>
				</td>
			</tr>
			<tr>
				<td><label id="lblworeda"><%
					String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
					label = Label.getLabelUsingLabelId("lblworeda");
	 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
	 			%></label></td>
				<td>
					<%						
						AdminField woreda = AdminField.getAdminField(rAddress.getWoredaId());
						AdminFieldTranslation woredaTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, woreda.getId());
						out.print(woredaTranslation != null ? woredaTranslation.getTranslatedValue() : woreda.getOptionValue());
					%>
				</td>
			</tr>
			<tr>
				<td><label id="lblkebele"><%
					String lblKebele = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblkebele");
					label = Label.getLabelUsingLabelId("lblkebele");
	 				out.print(lblKebele != null ? lblKebele : label.getLabelCaption());
	 			%></label></td>
				<td><%=rAddress.getKebele() %></td>
			</tr>
			<tr>
				<td><label id="lbltelephone"><%
					String lblTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltelephone");
					label = Label.getLabelUsingLabelId("lbltelephone");
	 				out.print(lblTelephone != null ? lblTelephone : label.getLabelCaption());
	 			%></label></td>
				<td><%=rAddress.getTelephone() %></td>
			</tr>
			<tr>
				<td><label id="lblmobile"><%
					String lblMobile = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmobile");
					label = Label.getLabelUsingLabelId("lblmobile");
	 				out.print(lblMobile != null ? lblMobile : label.getLabelCaption());
	 			%></label></td>
				<td><%=rAddress.getMobile() %></td>
			</tr>
			<tr>
				<td><label id="lblfax"><%
					String lblFax = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfax");
					label = Label.getLabelUsingLabelId("lblfax");
	 				out.print(lblFax != null ? lblFax : label.getLabelCaption());
	 			%></label></td>
				<td><%=rAddress.getFax() %></td>
			</tr>
			<tr>
				<td><label id="lblpobox"><%
					String lblPobox = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpobox");
					label = Label.getLabelUsingLabelId("lblpobox");
	 				out.print(lblPobox != null ? lblPobox : label.getLabelCaption());
	 			%></label></td>
				<td><%=rAddress.getPobox() %></td>
			</tr>
			<tr>
				<td><label id="lblemail"><%
					String lblEmail = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblemail");
					label = Label.getLabelUsingLabelId("lblemail");
	 				out.print(lblEmail != null ? lblEmail : label.getLabelCaption());
	 			%></label></td>
				<td><%=rAddress.getEmail() %></td>
			</tr>
		</table>
		<%
	}else{
		%>
		<p class="msg warning">
			<label id="lblnoinformationfound">
				<%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
	 				out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
	 			%>
			</label>
		</p>
		<%
	}
%>