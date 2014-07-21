<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long agreementId = Long.parseLong(request.getParameter("agreementId"));
	Agreement.deleteAgreement(agreementId);
%>
<p class="msg done">Agreement deleted successfully/የስምምነት መረጃ በተሳካ ሁኔታ ተሠርዟል</p>