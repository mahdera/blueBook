<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.Date" %>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	String respondentIdNumber = request.getParameter("respondentIdNumber");
	String name = request.getParameter("name");
	String structure = request.getParameter("structure");
	String sector = request.getParameter("sector");
	int regionId = Integer.parseInt(request.getParameter("region"));
	int woredaId = Integer.parseInt(request.getParameter("woreda"));
	String kebele = request.getParameter("kebele");
	String telephone = request.getParameter("telephone");
	String mobile = request.getParameter("mobile");
	String fax = request.getParameter("fax");
	String pobox = request.getParameter("pobox");
	String email = request.getParameter("email");
	
	Respondent respondent = new Respondent(respondentIdNumber,name,structure,sector,modifiedBy,modificationDate);
	respondent.save();
	//fetch respondent using the id number since the id number is unique...
	Respondent fetchedRespondent = Respondent.fetchRespondentUsingRespondentIdNumber(respondentIdNumber);
	RespondentAddress respondentAddress = new RespondentAddress(fetchedRespondent.getId(),regionId,woredaId,kebele,telephone,mobile,fax,pobox,email,modifiedBy,modificationDate);
	respondentAddress.save();
%>
<p class="msg done">
	<label id="lblrespondentsavedsuccessfully">
		<%
			String lblRespondentSavedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentsavedsuccessfully");
			label = Label.getLabelUsingLabelId("lblrespondentsavedsuccessfully");
			out.print(lblRespondentSavedSuccessfully != null ? lblRespondentSavedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>