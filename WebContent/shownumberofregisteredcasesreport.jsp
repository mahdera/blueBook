<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%@page import="java.util.*" %>
<%
	Date fromDate = Date.valueOf(request.getParameter("fromDate"));
	Date toDate = Date.valueOf(request.getParameter("toDate"));
	
	long numberOfCases = Case.getTotalNumberOfCasesRegisteredDuring(fromDate,toDate);
	
	
	
	if(numberOfCases > 0){
		int totalMale = Case.getHowManyApplicantsApplyDuringThisPeriodAndSex(fromDate,toDate,"Male");
		int totalFemale = Case.getHowManyApplicantsApplyDuringThisPeriodAndSex(fromDate,toDate,"Female");
		int totalNotIdentified = Case.getHowManyApplicantsApplyDuringThisPeriodAndSex(fromDate, toDate, "NI");
		int totalSex = totalMale + totalFemale + totalNotIdentified;
%>
<table border="0" width="100%">
	<thead>
		<tr>
			<th colspan="6">
				Number of Registered Cases Group By Applicant Report/የተመዘገቡ አቤቱታዎች ሪፖርት<br/>
				Starting Date/መነሻ ቀን:<%=fromDate %> End Date/መዳረሻ ቀን:<%=toDate %>
			</th>
		</tr>
		<tr>
			<th>Ser.No/ተራ.ቁ</th>
			<th>Number of Cases/የጉዳዮች/የአቤቱታ ብዛት</th>			
			<th>Female/ሴት</th>
			<th>Male/ወንድ</th>
			<th>Non Identified/ያልተለየ</th>
			<th>Total/አጠቃላይ ድምር</th>		
		</tr>
	</thead>
	<tbody>
		
				<tr>
					<td><%=1 %></td>
					<td><%=numberOfCases %></td>
					<td><%=totalFemale %></td>
					<td><%=totalMale %></td>
					<td><%=totalNotIdentified %></td>
					<td><%=totalSex %></td>
				</tr>
				
	</tbody>
</table>
<%
	}else{
		%>
		<p class="msg info">No Data to Display/ምንም ዓይነት መረጃ አልተገኝም</p>
		<%
	}
%>