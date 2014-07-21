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
	
	String applicantIdNumber = request.getParameter("applicantIdNumber");
	String fullName = request.getParameter("fullName");
	String sex = request.getParameter("sex");
	String ageCategory = request.getParameter("ageCategory").trim();
	int numberOfMaleApplicants = Integer.parseInt(request.getParameter("numberOfMaleApplicants"));
	int numberOfFemaleApplicants = Integer.parseInt(request.getParameter("numberOfFemaleApplicants"));
	String occupation = request.getParameter("occupation");
	String disability = request.getParameter("disability");
	int regionId = Integer.parseInt(request.getParameter("region"));
	int zoneId = Integer.parseInt(request.getParameter("zone"));
	int woredaId = Integer.parseInt(request.getParameter("woreda"));
	String kebele = request.getParameter("kebele");
	String officeTelephone = request.getParameter("officeTelephone");
	String homeTelephone = request.getParameter("homeTelephone");
	String email = request.getParameter("email");
	String mobilePhone = request.getParameter("mobilePhone");
	
	Applicant applicant = new Applicant(applicantIdNumber,fullName,sex,ageCategory,numberOfMaleApplicants,
			numberOfFemaleApplicants,occupation,disability,modifiedBy,modificationDate);
	applicant.save();
	//now get the saved applicant using the applicant id number...
	Applicant fetchedApplicant = Applicant.fetchApplicantUsingApplicantIdNumber(applicantIdNumber);
	ApplicantAddress applicantAddress = new ApplicantAddress(fetchedApplicant.getId(),regionId,zoneId,woredaId,
			kebele,officeTelephone,homeTelephone,mobilePhone,email,modifiedBy,modificationDate);
	applicantAddress.save();
%>
<p class="msg done">
	<label id="lblapplicantsavedsuccessfully">
		<%
			String lblApplicantSavedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantsavedsuccessfully");
			label = Label.getLabelUsingLabelId("lblapplicantsavedsuccessfully");
			out.print(lblApplicantSavedSuccessfully != null ? lblApplicantSavedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>