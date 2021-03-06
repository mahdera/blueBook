<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.Iterator"%>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.List"%>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<table border="0" width="100%">
	<tr style="background:#eee;font-weight:bolder">
		<td><label id="lblserialnumber"><%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
					out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
				%></label></td>
		<td><label id="lbllabelid"><%
					String lblLabelId = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllabelid");
					label = Label.getLabelUsingLabelId("lbllabelid");
					out.print(lblLabelId != null ? lblLabelId : label.getLabelCaption());
				%></label></td>
		<td><label id="lbllabelcaption"><%
					String lblLabelCaption = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllabelcaption");
					label = Label.getLabelUsingLabelId("lbllabelcaption");
					out.print(lblLabelCaption != null ? lblLabelCaption : label.getLabelCaption());
				%></label></td>		
	</tr>
	<%
		List<Label> labelList = Label.getAllLabels();
		Iterator<Label> labelItr = labelList.iterator();
		int ctr=1;
		while(labelItr.hasNext()){
			label = labelItr.next();
			%>
			<tr>
				<td><%=ctr++ %></td>
				<td><%=label.getLabelId() %></td>
				<td><%=label.getLabelCaption() %></td>
			</tr>
			<%
		}//end while loop
	%>
</table>