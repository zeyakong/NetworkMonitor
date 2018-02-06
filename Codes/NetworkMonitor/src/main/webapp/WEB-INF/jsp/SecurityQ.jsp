 <%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>Let's make things better.</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Alley Signup & Signin Form Tab Form,Login Forms,Sign up Forms,Registration Forms,News letter Forms,Elements"./>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</script>
<script src="js/jquery.min.js"></script>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
				<script type="text/javascript">
					$(document).ready(function () {
						$('#horizontalTab').easyResponsiveTabs({
							type: 'default', //Types: default, vertical, accordion           
							width: 'auto', //auto or any width like 600px
							fit: true   // 100% fit in a container
						});
					});
				
				
				 
					
				   </script>
</head>
<body>
	<h1>Safer</h1>
			
<div class="main-content">
	<div class="sap_tabs">	 
		<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
		 
			  <ul>
			  	  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Security Question</span></li>
				    
			  </ul>		
			  <!----> 

			<div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
				<div class="facts">
					<div class="register">
						 <form name="loginform" method="POST" id="loginform" action="getinfo.jsp">									
							<input placeholder="SecurityQuestion" class="mail" type="text" name="username" required="">	
							<option value="SecurityQuestion"><%session.getAttribute("SecurityQ");%></option> 								
							<input placeholder="Answer" class="Answer" type="password" name="Answer" required="">										
							<div class="sign-up">
								<input type="submit" class="submit-btn" id="J_submit" value="Answer"">
							</div>
						</form>
						<h3><a href="#"> Help</a></h3>
					</div>
				</div> 
			</div> 			        					            	      
			 	
		</div>	
		
	</div>
</div>
	 <!--start-copyright-->
   		<div class="copy-right">
   			<div class="wrap">
				<p>&copy;  </a></p>
			</div>
		</div>
	<!--//end-copyright-->
 
</body>
</html>