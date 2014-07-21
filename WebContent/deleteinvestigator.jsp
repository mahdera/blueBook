<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	int investigatorId = Integer.parseInt(request.getParameter("investigatorId"));
	Investigator.delete(investigatorId);
	//now remove the investigator address object as well.
	InvestigatorAddress investigatorAddress = InvestigatorAddress.getInvestigatorAddressForThisInvestigator(investigatorId);
	InvestigatorAddress.delete(investigatorAddress.getId());
%>