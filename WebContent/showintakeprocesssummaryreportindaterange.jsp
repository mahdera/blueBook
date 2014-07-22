<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Date" %>
<%
	Date startDate = Date.valueOf(request.getParameter("startDate"));
	Date endDate = Date.valueOf(request.getParameter("endDate"));
	
	
%>
<table border="0" width="100%">
	<tr style="font-weight:bolder;font-size:10pt;background:#eeeeee;text-align:center">
		<td colspan="8">Early Resolution</td>		
	</tr>
	<tr style="font-weight:bolder;font-size:10pt;background:#eeeeee;text-align:center">
		<td rowspan="2">Ser.No</td>
		<td colspan="4">Sex</td>
		<td rowspan="2">The Case</td>
		<td rowspan="2">Respondent</td>
		<td rowspan="2">Result Obtained</td>
	</tr>
	<tr style="font-weight:bolder;font-size:10pt;background:#eeeeee;text-align:center">
		<td>Male</td>
		<td>Female</td>
		<td>Unidentified</td>
		<td>Total</td>
	</tr>
</table>