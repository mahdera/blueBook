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
	
	String name = request.getParameter("name");
	String level = request.getParameter("level");
	String region = request.getParameter("region");
	String woreda = request.getParameter("woreda");
	String kebele = request.getParameter("kebele");
	String telephone = request.getParameter("telephone");
	String mobile = request.getParameter("mobile");
	String fax = request.getParameter("fax");
	String pobox = request.getParameter("pobox");
	String email = request.getParameter("email");
	int investigatorId = Integer.parseInt(request.getParameter("investigatorId"));
	int userId = Integer.parseInt(request.getParameter("userId"));
	//first find the investigator from the database...
	Investigator investigator = Investigator.getInvestigator(investigatorId);
	investigator.setFullName(name);
	investigator.setLevel(level);
	investigator.setModifiedBy(modifiedBy);
	investigator.setModificationDate(modificationDate);
	Investigator.update(investigator);
	//now do the same for the investoigator address object...
	InvestigatorAddress investigatorAddress = InvestigatorAddress.getInvestigatorAddressForThisInvestigator(investigatorId);
	if(investigatorAddress != null){
		investigatorAddress.setRegion(region);
		investigatorAddress.setWoreda(woreda);
		investigatorAddress.setKebele(kebele);
		investigatorAddress.setTelephone(telephone);
		investigatorAddress.setMobile(mobile);
		investigatorAddress.setFax(fax);
		investigatorAddress.setPobox(pobox);
		investigatorAddress.setEmail(email);
		investigatorAddress.setModifiedBy(modifiedBy);
		investigatorAddress.setModificationDate(modificationDate);
		InvestigatorAddress.update(investigatorAddress);
	}else{
		//save the investigator address for the first time since its NULL...
		InvestigatorAddress invAddress = new InvestigatorAddress(investigatorId,region,woreda,kebele,
				telephone,mobile,fax,pobox,email,modifiedBy,modificationDate);
		invAddress.save();
	}
	//now update the InvestigatorUserMap information in the database...
	InvestigatorUserMap investigatorUserMap = InvestigatorUserMap.getInvestigatorUserMapForInvestigator(investigatorId);
	if(investigatorUserMap != null){
		investigatorUserMap.setInvestigatorId(investigatorId);
		investigatorUserMap.setUserId(userId);
		investigatorUserMap.setModifiedBy(modifiedBy);
		investigatorUserMap.setModificationDate(modificationDate);
		InvestigatorUserMap.update(investigatorUserMap);
	}else{
		InvestigatorUserMap newInvestigatorUserMap = new InvestigatorUserMap(investigatorId,userId,
				modifiedBy,modificationDate);
		newInvestigatorUserMap.save();
	}
%>
<p class="msg done">Investigator information updated successfully!</p>