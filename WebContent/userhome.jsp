<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
<head>	
	<meta http-equiv="content-type" content="text/html; charset=utf-8" /> 
	<meta http-equiv="content-language" content="en" /> 
	<meta name="robots" content="noindex,nofollow" /> 
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/reset.css" /> <!-- RESET --> 
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/main.css" /> <!-- MAIN STYLE SHEET --> 
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/2col.css" title="2col" /> <!-- DEFAULT: 2 COLUMNS --> 
	<link rel="alternate stylesheet" media="screen,projection" type="text/css" href="css/1col.css" title="1col" /> <!-- ALTERNATE: 1 COLUMN --> 
	<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]--> <!-- MSIE6 --> 
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/style.css" /> <!-- GRAPHIC THEME -->	
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/mystyle.css" /> <!-- WRITE YOUR CSS CODE HERE -->
	<link rel="stylesheet" media="print" type="text/css" href="css/print.css"/> 
	<script type="text/javascript" src="js/jquery.js"></script> 
	<script type="text/javascript" src="js/switcher.js"></script> 
	<script type="text/javascript" src="js/toggle.js"></script> 
	<script type="text/javascript" src="js/ui.core.js"></script> 
	<script type="text/javascript" src="js/ui.tabs.js"></script>
	<script type="text/javascript" src="js/ajax_functions.js"></script>
	
	
	<!-- now comes the jquery text editor section -->	
	<script type="text/javascript" src="jQuery-TE_v.1.4.0/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="jQuery-TE_v.1.4.0/jquery-te-1.4.0.min.js"></script>
	<link rel="Stylesheet" type="text/css" href="jQuery-TE_v.1.4.0/jquery-te-1.4.0.css" />
	<!-- for the datetime picker -->
	<link href="glDatePicker-2.0/styles/glDatePicker.default.css" rel="stylesheet" type="text/css"/>
	 <script src="glDatePicker-2.0/glDatePicker.min.js"></script>
	
	<title>CMS-1.0</title> 
	<link rel="shortcut icon" href="images/favicon.ico"/>		  
	<script src="sample/datetimepicker_css.js"></script> 	     
</head> 
 
<body> 
<%
	response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
	response.addHeader("Pragma", "no-cache"); 
	response.addDateHeader ("Expires", 0);
%>
<div id="main"> 
 
	<!-- Tray -->
	<%@include file="tray.jsp" %> 	 
 
	<hr class="noscreen" /> 
 
	<%@include file="menuheader.jsp" %>
 
	<hr class="noscreen" /> 
 
	<!-- Columns --> 
	<div id="cols" class="box"> 
 
		<!-- Aside (Left Column) --> 
		<div id="aside" class="box"> 
 
			<%@include file="leftpaddingbox.jsp" %>
 
 			<%@include file="leftmenulists.jsp"%>
			
		</div> <!-- /aside --> 
 
		<hr class="noscreen" /> 
 
		<!-- Content (Right Column) --> 
		<div id="content" class="box"> <!-- the main container div mahder -->
			<div style="text-align:center;min-height:600px">
			
 			</div>
 				
 			<div id="searchResultDiv"></div>
 			<div id="operationStatusDiv"></div>		 
		</div> <!-- /content --> 
 
	</div> <!-- /cols --> 
 
	<hr class="noscreen" /> 
 
	<!-- Footer --> 
	<%@include file="footer.jsp" %> 
 
</div> <!-- /main --> 
 
</body> 
</html>