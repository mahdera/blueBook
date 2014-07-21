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
	
	int respondentId = Integer.parseInt(request.getParameter("respondentId"));
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
	
	Respondent respondent = Respondent.getRespondent(respondentId);
	respondent.setName(name);
	respondent.setStructure(structure);
	respondent.setSector(sector);
	respondent.setModifiedBy(modifiedBy);
	respondent.setModificationDate(modificationDate);
	Respondent.update(respondent);
	//now do the same for the respondent address..
	RespondentAddress respondentAddress = RespondentAddress.getRespondentAddressForThisRespondent(respondentId);
	respondentAddress.setRegionId(regionId);
	respondentAddress.setWoredaId(woredaId);
	respondentAddress.setKebele(kebele);
	respondentAddress.setTelephone(telephone);
	respondentAddress.setMobile(mobile);
	respondentAddress.setFax(fax);
	respondentAddress.setPobox(pobox);
	respondentAddress.setEmail(email);
	respondentAddress.setModifiedBy(modifiedBy);
	respondentAddress.setModificationDate(modificationDate);
	RespondentAddress.update(respondentAddress);
%>
<p class="msg done">Respondent information update successfully/የመልስ ሰጭ ክፍል መረጃ በተሳካ ሁኔታ ታድሷል</p>