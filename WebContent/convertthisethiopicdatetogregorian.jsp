<%@page import="java.sql.Date"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	String startDateDataString = request.getParameter("dateDataString");
	StringTokenizer token = new StringTokenizer(startDateDataString,":");
	//System.out.println("token: "+token);
	int ethiopicDate = Integer.parseInt(token.nextToken());
	int ethiopicMonth = Integer.parseInt(token.nextToken());
	int ethiopicYear = Integer.parseInt(token.nextToken());
	//now Mahder, do the greg convertion in here...
	Day day = DateConverter.toGregorian(ethiopicDate, ethiopicMonth, ethiopicYear);	
	if(day != null){
		String gregDblMonth = "";
		String gregDblDate = "";
		if(day.getGregorianMonth() < 10){
			gregDblMonth = "0" + day.getGregorianMonth();
		}else{
			gregDblMonth = String.valueOf(day.getGregorianMonth());
		}
		
		if(day.getGregorianDate() < 10){
			gregDblDate = "0" + day.getGregorianDate();	
		}else{
			gregDblDate = String.valueOf(day.getGregorianDate());
		}
		
		String strGregDate = day.getGregorianYear()+"-"+gregDblMonth+"-"+gregDblDate;		
		Date gregDate = Date.valueOf(strGregDate.trim());
		out.print(gregDate);
	}else{
		out.print("");
	}
%>