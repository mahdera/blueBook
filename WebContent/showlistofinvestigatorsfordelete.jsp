<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<Investigator> investigatorList = Investigator.getAllInvestigator();
	Iterator<Investigator> investigatorItr = investigatorList.iterator();
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<table border="1" width="100%">
	<tr style="background:#eee;font-weight:bolder">
		<td><label id="lblserialnumber"><%
						String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
						label = Label.getLabelUsingLabelId("lblserialnumber");
		 				out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblinvestigatoridnumber"><%
						String lblInvestigatorIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigatoridnumber");
						label = Label.getLabelUsingLabelId("lblinvestigatoridnumber");
		 				out.print(lblInvestigatorIdNumber != null ? lblInvestigatorIdNumber : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblfullname"><%
						String lblFullName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfullname");
						label = Label.getLabelUsingLabelId("lblfullname");
		 				out.print(lblFullName != null ? lblFullName : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lbllevel"><%
						String lblLevel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllevel");
						label = Label.getLabelUsingLabelId("lbllevel");
		 				out.print(lblLevel != null ? lblLevel : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblregion"><%
						String lblRegion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregion");
						label = Label.getLabelUsingLabelId("lblregion");
		 				out.print(lblRegion != null ? lblRegion : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblworeda"><%
						String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
						label = Label.getLabelUsingLabelId("lblworeda");
		 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblkebele"><%
						String lblKebele = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblkebele");
						label = Label.getLabelUsingLabelId("lblkebele");
		 				out.print(lblKebele != null ? lblKebele : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lbltelephone"><%
						String lblTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltelephone");
						label = Label.getLabelUsingLabelId("lbltelephone");
		 				out.print(lblTelephone != null ? lblTelephone : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblmobile"><%
						String lblMobile = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmobile");
						label = Label.getLabelUsingLabelId("lblmobile");
		 				out.print(lblMobile != null ? lblMobile : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblfax"><%
						String lblFax = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfax");
						label = Label.getLabelUsingLabelId("lblfax");
		 				out.print(lblFax != null ? lblFax : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblpobox"><%
						String lblPobox = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpobox");
						label = Label.getLabelUsingLabelId("lblpobox");
		 				out.print(lblPobox != null ? lblPobox : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lblemail"><%
						String lblEmail = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblemail");
						label = Label.getLabelUsingLabelId("lblemail");
		 				out.print(lblEmail != null ? lblEmail : label.getLabelCaption());
		 			%></label></td>
		<td><label id="lbldelete"><%
						String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
						label = Label.getLabelUsingLabelId("lbldelete");
		 				out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
		 			%></label></td>
	</tr>
	<%
		int ctr = 1;
		while(investigatorItr.hasNext()){
			Investigator investigator = investigatorItr.next();
			InvestigatorAddress investigatorAddress = InvestigatorAddress.getInvestigatorAddressForThisInvestigator(investigator.getId());
			%>
			<tr>
				<td><%=ctr %></td>
				<td><%=investigator.getInvestigatorIdNumber() %></td>
				<td><%=investigator.getFullName() %></td>
				<td><%=investigator.getLevel() %></td>				
				<td><%=(investigatorAddress == null ? "" : investigatorAddress.getRegion()) %></td>
				<td><%=(investigatorAddress == null ? "" : investigatorAddress.getWoreda()) %></td>
				<td><%=(investigatorAddress == null ? "" : investigatorAddress.getKebele()) %></td>
				<td><%=(investigatorAddress == null ? "" : investigatorAddress.getTelephone()) %></td>
				<td><%=(investigatorAddress == null ? "" : investigatorAddress.getMobile()) %></td>
				<td><%=(investigatorAddress == null ? "" : investigatorAddress.getFax()) %></td>
				<td><%=(investigatorAddress == null ? "" : investigatorAddress.getPobox()) %></td>
				<td><%=(investigatorAddress == null ? "" : investigatorAddress.getEmail()) %></td>
				<td>
					<a href="#.jsp" onclick="deleteThisInvestigator(<%=investigator.getId() %>);">Delete</a>
				</td>
			</tr>
			<%
			ctr++;
		}//end while loop
	%>
</table>
<script type="text/javascript">
	function deleteThisInvestigator(investigatorId){
		if(window.confirm('Are you sure you want to delete this investigator?')){
			var dataString = "investigatorId="+investigatorId;
			$.ajax({					
			    url: 'deleteinvestigator.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){   		
			    		$('#subTabDetailDiv').load('showlistofinvestigatorsfordelete.jsp');			    		
			    },
			    error:function(error){
					alert(error);
			    }
			});			
		}
	}
</script>