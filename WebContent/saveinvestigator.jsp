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
	
	String investigatorIdNumber = request.getParameter("investigatorIdNumber");
	String name = request.getParameter("name");
	String level = request.getParameter("level");
	String region = request.getParameter("region");
	String woreda = request.getParameter("woreda");
	String kebele = request.getParameter("kebele");
	String telephone = request.getParameter("telephone");
	String mobile = request.getParameter("mobile");
	String fax = request.getParameter("fax");
	String pobox = request.getParameter("pobox");
	String email = request.getParameter("email");
	int userId = Integer.parseInt(request.getParameter("userId"));
	
	Investigator investigator = new Investigator(investigatorIdNumber,name,level,modifiedBy,modificationDate);
	investigator.save();
	
	Investigator fetchedInvestigator = Investigator.getInvestigatorUsingIdNumber(investigatorIdNumber);
	//now save the investigator address information...
	InvestigatorAddress investigatorAddress = new InvestigatorAddress(fetchedInvestigator.getId(),
			region,woreda,kebele,telephone,mobile,fax,pobox,email,modifiedBy,modificationDate);
	investigatorAddress.save();
	//now map the userid with the investigator id on the newly defined table...
	InvestigatorUserMap investigatorUserMap = new InvestigatorUserMap(fetchedInvestigator.getId(),userId,
			modifiedBy,modificationDate);
	investigatorUserMap.save();
%>
<p class="msg done">
	<label id="lblinvestigatorsavedsuccessfully">
		<%
			String lblInvestigatorSavedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigatorsavedsuccessfully");
			label = Label.getLabelUsingLabelId("lblinvestigatorsavedsuccessfully");
			out.print(lblInvestigatorSavedSuccessfully != null ? lblInvestigatorSavedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>