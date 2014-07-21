<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	Date fromDate = Date.valueOf(request.getParameter("fromDate"));
	Date toDate = Date.valueOf(request.getParameter("toDate"));
	
	int totalFemale = Applicant.getHowManyOfThisSexTypeIsDisabledRegisteredDuring(fromDate,toDate,"Female");
	int totalMale = Applicant.getHowManyOfThisSexTypeIsDisabledRegisteredDuring(fromDate,toDate,"Male");
	int totalNotIdentified = Applicant.getHowManyOfThisSexTypeIsDisabledRegisteredDuring(fromDate,toDate,"NI");
	int totalSex = totalFemale + totalMale + totalNotIdentified;
%>
<table border="0" width="100%">
	<thead>
		<tr>
			<th colspan="6">
				Disability Report/የአካል ጉዳተኛነት ሪፖርት<br/>
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
					<td><%=totalSex %></td>
					<td><%=totalFemale %></td>
					<td><%=totalMale %></td>
					<td><%=totalNotIdentified %></td>
					<td><%=totalSex %></td>
				</tr>
	</tbody>
</table>