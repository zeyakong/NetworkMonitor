<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">
<title> Network Monitor</title>
<html>
<%
    Object obj = session.getAttribute("loginId");
    if (obj == null) {
%>
<meta http-equiv="refresh" content="0; url=doLogin"/>
<%
    }
%>
<head>
    <title>Let's make things better.</title>
    <link href="css/stylec.css" rel='stylesheet' type='text/css'/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords"
          content="Alley Signup & Signin Form Tab Form,Login Forms,Sign up Forms,Registration Forms,News letter Forms,Elements"
          ./>
    <style>
        #message{
            color: red;
            font-weight:bold;
        }
        h3{
            padding-top:35px;
            color:white;
            text-align:right;
        }
    </style>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        }

        function updatingcards() {
            var cnumber2 = $("#cnumber2").val();
            var cname2 = $("#cname2").val();
            var cdate2 = $("#cdate2").val();
            var ccode2 = $("#ccode2").val();
            var name2 = $("#name2").val();
            $.ajax({
                type: "POST",
                url: "updatingcards.action",
                /* data: "username=" + userName + "&password=" + password,*/
                data: "&cnumber2=" + cnumber2+ "&cname2=" + cname2 + "&cdate2=" + cdate2+ "&ccode2=" + ccode2+"&name2=" + name2,
                success: function (result) {
                    console.log(result);//??????????(???)
                    if (result=="Success to update card") {
                        alert(result);
                        window.location.href="cardInfo.action";
                    }else{
                        alert(result);
                    }

                },
                error : function() {
                    alert("Please check your input all the options correctly") ;
                }

            });
        }

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
<h1> Let's Make Things Better</h1>

<div class="main-content">
    <div class="sign-up" style="width:100px;height:50px;">
        <input type="submit" class="submit-btn" id="J_submit" value="Back" style="width:100px;height:50px;"
               onclick='window.location.href="cardInfo.action"' ;>

    </div>
    <div class="sap_tabs">
        <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
            <ul>
                <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span></span></li>
            </ul>
            <div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
                <div class="facts">
                    <div class="register">
                        <h3>Account ID:<input placeholder="Related account number"  value="${creditCard.cardAccount}" id="name2" class="lock"   type="text" required=""onfocus='$("#message").text("");'></h3>
                        <h3>Card Number:<input placeholder="${creditCard.cardId}" id="cnumber2" class="mail" type="text" disabled="disabled" value="${creditCard.cardId}"></h3>
                        <h3>Card Owner:<input placeholder="The length of name must be between 2 to 15"   value="${creditCard.cardName}" id="cname2" class="lock" type="text" required=""  ></h3>
                        <h3>Expiration date:<input placeholder="MM/YY"  value="${creditCard.expirationDate}" id="cdate2" class="lock" type="text" required="" ></h3>
                        <h3>Sercurity Code:<input placeholder="NNN"   value="${creditCard.securityCode}" id="ccode2" class="mail" type="text" required="" ></h3>
                        <div class="sign-up">
                            <p id="message"></p>
                            <input type="submit" class="submit-btn" style="width:100px;height:50px;" onclick="updatingcards()" value="Submit"></div>
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