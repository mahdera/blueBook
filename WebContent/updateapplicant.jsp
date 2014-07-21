<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	String applicantIdNumber = request.getParameter("applicantIdNumber");
	String fullName = request.getParameter("fullName");
	String sex = request.getParameter("sex");
	String ageCategory = request.getParameter("ageCategory");
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
	//now fetch the applicant obj and set its values with the new data and update it back to the database...
	Applicant fetchedApplicant = Applicant.getApplicant(applicantId);
	fetchedApplicant.setApplicantIdNumber(applicantIdNumber);
	fetchedApplicant.setFullName(fullName);
	fetchedApplicant.setSex(sex);
	fetchedApplicant.setAgeCategory(ageCategory);
	fetchedApplicant.setNumberOfApplicantsMale(numberOfMaleApplicants);
	fetchedApplicant.setNumberOfApplicantsFemale(numberOfFemaleApplicants);
	fetchedApplicant.setOccupation(occupation);
	fetchedApplicant.setDisability(disability);
	//now get the address object for this particular applicant...
	ApplicantAddress fetchedApplicantAddress = ApplicantAddress.getAddressOfThisApplicant(fetchedApplicant.getId());
	fetchedApplicantAddress.setRegion(regionId);
	fetchedApplicantAddress.setApplicantZone(zoneId);
	fetchedApplicantAddress.setWoreda(woredaId);
	fetchedApplicantAddress.setKebele(kebele);
	fetchedApplicantAddress.setOfficeTelephone(officeTelephone);
	fetchedApplicantAddress.setHomeTelephone(homeTelephone);
	fetchedApplicantAddress.setEmail(email);
	fetchedApplicantAddress.setMobileTelephone(mobilePhone);
	
	Applicant.update(fetchedApplicant);
	ApplicantAddress.update(fetchedApplicantAddress);
%>
<p class="msg done">Applicant information updated successfully/የአመልካች መረጃ በተሳካ ሁኔታ ታድሶአል</p>