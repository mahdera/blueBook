<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	Date fromDate = Date.valueOf(request.getParameter("fromDate"));
	Date toDate = Date.valueOf(request.getParameter("toDate"));
	
	
%>
<table border="0" width="100%">
	<thead>
		<tr>
			<th colspan="7">
				Means of Application Report/አቤቱታው የቀረበበት መንገድ ሪፖርት<br/>
				Starting Date/መነሻ ቀን:<%=fromDate %> End Date/መዳረሻ ቀን:<%=toDate %>
			</th>
		</tr>
		<tr>
			<th>Ser.No/ተራ.ቁ</th>
			<th>Number of Cases/የጉዳዮች/የአቤቱታ ብዛት</th>
			<th>Means of Application/አቤቱታው የቀረበበት መንገድ</th>			
			<th>Female/ሴት</th>
			<th>Male/ወንድ</th>
			<th>Non Identified/ያልተለየ</th>
			<th>Total/አጠቃላይ ድምር</th>		
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>