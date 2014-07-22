<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Date" %>
<%
	Date startDate = Date.valueOf(request.getParameter("startDate"));
	Date endDate = Date.valueOf(request.getParameter("endDate"));
	
	
%>
<table border="1" width="100%">
	<tr style="background:#eeeeee;font-weight:bolder;font-size:10pt;text-align:center">
		<td rowspan="2">Ser.No</td>
		<td rowspan="2">Appeal Count</td>
		<td colspan="4">Sex</td>
		<td rowspan="2">Region</td>
		<td rowspan="2">Case Type</td>
	</tr>
	<tr style="background:#eeeeee;font-weight:bolder;font-size:10pt;text-align:center">
		<td>Male</td>
		<td>Female</td>
		<td>Unidentified</td>
		<td>Total</td>
	</tr>
</table>