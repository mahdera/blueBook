<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	String fileNumber = request.getParameter("fileNumber");
	String appealReason = request.getParameter("appealReason");
	Date registrationDate = Date.valueOf(request.getParameter("registrationDate"));
	
	Appeal appeal = new Appeal(fileNumber,appealReason,registrationDate,modifiedBy,modificationDate);
	appeal.save();
%>
<p class="msg done">
	<label id="lblappealregisteredsuccessfully">
		<%
			String lblAppealRegisteredSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealregisteredsuccessfully");
			label = Label.getLabelUsingLabelId("lblappealregisteredsuccessfully");
			out.print(lblAppealRegisteredSuccessfully != null ? lblAppealRegisteredSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>