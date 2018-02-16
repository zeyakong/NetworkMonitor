<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" %>
<%@ page import="static jdk.nashorn.internal.runtime.GlobalFunctions.parseInt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Let's make things better.</title>
    <link href="css/style2.css" rel='stylesheet' type='text/css'/>
    <style>
        #message{
            color: red;
            font-weight:bold;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords"
          content="Alley Signup & Signin Form Tab Form,Login Forms,Sign up Forms,Registration Forms,News letter Forms,Elements"
          ./>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <script src="js/jquery.min.js"></script>
    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            <% int num = 1 + (int)(Math.random() * (3-1+1));
            String str = "question"+ num;%>
            $("#question").attr("placeholder","<%=request.getSession().getAttribute(str)%>");
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true   // 100% fit in a container
            });
        });

        function answer() {
            var a= $("#answer").val();
            <%str ="answer"+num;%>
            var ar = "<%=request.getSession().getAttribute(str)%>";
            if(a==ar){
                window.location.href="goMain.action";
            }else{
                $("#message").text("The answer is wrong!");
            }
        }

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
                        <input placeholder="Question" id="question" class="mail" type="text" required="" disabled>
                        <input placeholder="Answer" id="answer" class="lock" type="password" required="" onfocus='$("#message").text("");'>
                        <div class="sign-up">
                            <p id="message"></p>
                            <input type="submit" onclick="answer()" value="Answer"></div>
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
        <p>&copy; </p>
    </div>
</div>
<!--//end-copyright-->

</body>
</html>