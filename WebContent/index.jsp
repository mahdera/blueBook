<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="en" />
<meta name="robots" content="noindex,nofollow" />
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="css/reset.css" />
<!-- RESET -->
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="css/main.css" />
<!-- MAIN STYLE SHEET -->
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="css/2col.css" title="2col" />
<!-- DEFAULT: 2 COLUMNS -->
<link rel="alternate stylesheet" media="screen,projection"
	type="text/css" href="css/1col.css" title="1col" />
<!-- ALTERNATE: 1 COLUMN -->
<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]-->
<!-- MSIE6 -->
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="css/style.css" />
<!-- GRAPHIC THEME -->
<link rel="stylesheet" media="screen,projection" type="text/css"
	href="css/mystyle.css" />
<!-- WRITE YOUR CSS CODE HERE -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/switcher.js"></script>
<script type="text/javascript" src="js/toggle.js"></script>
<script type="text/javascript" src="js/ui.core.js"></script>
<script type="text/javascript" src="js/ui.tabs.js"></script>
<script type="text/javascript" src="js/ajax_functions.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".tabs > ul").tabs();
	});
</script>
<title>Case Management System 1.0</title>
<link rel="shortcut icon" href="images/favicon.ico" />
</head>

<body>

	<div id="main">

		<!-- Tray -->
		<%@include file="indextray.jsp"%>

		<hr class="noscreen" />

		<%@include file="indexmenuheader.jsp"%>

		<hr class="noscreen" />

		<!-- Columns -->
		<div id="cols" class="box">

			<!-- Aside (Left Column) -->
			<div id="aside" class="box">
				<%@include file="indexleftpaddingbox.jsp"%>
			</div>
			<!-- /aside -->

			<hr class="noscreen" />

			<!-- Content (Right Column) -->
			<div id="content" class="box">
				<!-- the main container div mahder -->
				<table border="1" width="100%">
					<tr style="background:white">
						<td colspan="2" align="center">
						<strong><font size="5">
						<!-- Community Based Health Insurance Database System. -->
						የሕዝብ ዕንባ ጠባቂ ተቋም የአቤቱታ ጉዳዮች መከታተያ ሶፍትዌር/Inistitution of The Ombudsman Case Management System
						<br/>
						</font>
						</strong></td>
					</tr>					
				</table>
				
				<div style="height:400px">
					<br/><br/><br/><br/>
					<table border="0" width="100%">
						<tr>
							<td align="center">
								<table border="1" width="100%">
									<tr>
										<td align="center">
											<a href="intakeindexpage.jsp"><img src="images/intake.png" border="0"/></a>
										</td>
										<td align="center">
											<a href="investigationindexpage.jsp"><img src="images/investigation.png" border="0"/></a>
										</td>
										<td align="center">
											<a href="appealindexpage.jsp"><img src="images/appeal.png" border="0"/></a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>				
				<!-- <img src="images/mainpic.jpeg" border="0" align="middle"/>	-->			
				
						
				<!-- <p class="f-right">
					<img src="images/anotherbetter.jpeg" border="0"/>																				
				</p> -->
			</div>
		</div>
		<!-- /content -->

	</div>
	<!-- /cols -->

	<hr class="noscreen" />

	<!-- Footer -->
	<%@include file="indexfooter.jsp"%>

	</div>
	<!-- /main -->

</body>
</html>