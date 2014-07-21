<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.sql.Date"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.util.*" %>



<%		
	long applicantId=0;
	long caseId=0;
	int respondentId=0;
	String investigator=null;
	String investigatorLevel=null;
	String caseStatus=null;
	Date dateAssigned=null;
	Date dateOpened=null;
	
	Account userAccount = (Account) session.getAttribute("account");
	
	
	
	String itemName = "No File";	
	
    
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    
	if (!isMultipart){
		out.print("Form is not multipart!");
		
	} else {
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator itr = items.iterator();
		int ctr = 1;
		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			if (item.isFormField()) {
				String name = item.getFieldName();
				if(name.equals("slctapplicant")){
					applicantId = Long.parseLong(item.getString());					
				}
				if(name.equals("slctcase")){
					System.out.println("mahder inside slctcase "+item.getString());
					caseId = Long.parseLong(item.getString());
				}
				if(name.equals("slctrespondent")){
					System.out.println("mahder inside slctrespondent "+item.getString());
					respondentId = Integer.parseInt(item.getString());
				}
				if(name.equals("slctinvestigator")){
					investigator = item.getString();
				}
				if(name.equals("slctinvestigatorlevel")){
					investigatorLevel = item.getString();
				}
				if(name.equals("slctcasestatus")){
					caseStatus = item.getString();
				}
				if(name.equals("txtdateassigned")){
					dateAssigned = Date.valueOf(item.getString());
				}
				if(name.equals("txtdateopened")){
					dateOpened = Date.valueOf(item.getString());
				}
			}else{
				try {
					itemName = item.getName();	
					System.out.println(item.getName());
					if(itemName != null){
						File importFile = new File(config.getServletContext().getRealPath("/")
								+ "/assignment_import_data/" + itemName);
						item.write(importFile);
						System.out.println("location is : "+importFile.getAbsolutePath());
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					System.gc();
				}
			}//end else			
		}//end while loop
		
		///now save the datavalues to the database...
		if(!itemName.equalsIgnoreCase("No File") && itemName != null){
			InvestigatorAssignment investigatorAssignment = new InvestigatorAssignment(applicantId,caseId,
					respondentId, itemName, userAccount.getUserId(),
					investigator, investigatorLevel, caseStatus,
					dateAssigned, dateOpened);
			investigatorAssignment.addInvestigatorAssignment();
		}else{
			InvestigatorAssignment investigatorAssignment = new InvestigatorAssignment(applicantId,caseId,
					respondentId, "No File", userAccount.getUserId(),
					investigator, investigatorLevel, caseStatus,
					dateAssigned, dateOpened);
			investigatorAssignment.addInvestigatorAssignment();
		}
		
	}//end bigger else body!!    
%>
<p class='msg done'>Investigator assigned successfully/መርማሪ በተሳካ ሁኔታ ተመድቧል!</p>
<%@include file="userhome.jsp" %>






