<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "caseCategoryManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true){
		int langId = Integer.parseInt(session.getAttribute("langId").toString());
		Label label = null;
%>
<%
	List<CaseCategory> caseCategoryList = CaseCategory.getAllCaseCategories();
	if(!caseCategoryList.isEmpty()){
		Iterator<CaseCategory> caseCategoryItr = caseCategoryList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-size:11pt;font-weight:bolder">
				<td><label id="lblserialnumber"><%
						String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
						label = Label.getLabelUsingLabelId("lblserialnumber");
		 				out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
		 			%></label></td>
				<td><label id="lblcasecategoryname"><%
						String lblCaseCategoryName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasecategoryname");
						label = Label.getLabelUsingLabelId("lblcasecategoryname");
		 				out.print(lblCaseCategoryName != null ? lblCaseCategoryName : label.getLabelCaption());
		 			%></label></td>
				<td><label id="lbldescription"><%
						String lblDescription = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldescription");
						label = Label.getLabelUsingLabelId("lbldescription");
		 				out.print(lblDescription != null ? lblDescription : label.getLabelCaption());
		 			%></label></td>
				<td><label id="lbldelete"><%
						String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
						label = Label.getLabelUsingLabelId("lbldelete");
		 				out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
		 			%></label></td>
			</tr>
			<%
				int ctr=1;
				while(caseCategoryItr.hasNext()){
					CaseCategory c = caseCategoryItr.next();
					%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=c.getCaseCategoryName() %></td>
						<td><%=c.getDescription() %></td>
						<td>
							<a href="#.jsp" onclick="deleteThisCaseCategory(<%=c.getId() %>);">Delete</a>
						</td>
					</tr>					
					<%
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
		<p class="msg warning"><label id="lblnoinformationfound"><%
						String lblNoInformationFound = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnoinformationfound");
						label = Label.getLabelUsingLabelId("lblnoinformationfound");
		 				out.print(lblNoInformationFound != null ? lblNoInformationFound : label.getLabelCaption());
		 			%></label></p>
		<%
	}
%>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	function deleteThisCaseCategory(caseCategoryId){
		if(window.confirm("Are you sure you want to delete this case category?")){
			var dataString = "caseCategoryId="+caseCategoryId;
			$.ajax({
			    url: 'deletethiscasecategory.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){	
			    		$('#subTabDetailDiv').load('showlistofcasecategoriesfordelete.jsp');		
			    },
			    error:function(error){
					alert(error);
			    }
			 });	
		}
	}
</script>