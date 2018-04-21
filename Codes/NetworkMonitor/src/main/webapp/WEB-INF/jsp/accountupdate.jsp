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

        function updatingaccounts() {
            var accountName = $("#accountName").val();
            var accountId= $("#accountId").val();
            var accountAddress = $("#accountAddress").val();
            var accountPhone = $("#accountPhone").val();
            var limit = $("#limit").val();
            var balance = $("#balance").val();
            $.ajax({
                type: "POST",
                url: "updatingaccounts.action",
                /* data: "username=" + userName + "&password=" + password,*/
                data: "&accountName=" + accountName+ "&accountAddress=" + accountAddress + "&accountPhone=" + accountPhone+ "&limit=" + limit+"&balance=" + balance+"&accountId=" + accountId,
                success: function (result) {
                    console.log(result);//??????????(???)
                        if (result=="Success to update account!") {
                        alert(result);
                        window.location.href="accountInfo.action";
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
               onclick='window.location.href="accountInfo.action"' ;>

    </div>
    <div class="sap_tabs">
        <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
            <ul>
                <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span></span></li>
            </ul>
            <div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
                <div class="facts">
                    <div class="register">
                        <h3>Account ID:<input placeholder="${cardAccount.accountId}" id="accountId" class="mail" type="text" disabled="disabled" value="${cardAccount.accountId}"></h3>
                        <h3>Account Name:<input placeholder=" "  value="${cardAccount.accountName}" id="accountName" class="lock"   type="text" required=""onfocus='$("#message").text("");'></h3>
                        <h3>Account Address:<input placeholder=" "   value="${cardAccount.accountAddress}" id="accountAddress" class="lock" type="text" required=""  ></h3>
                        <h3>Account Phone:<input placeholder=" "  value="${cardAccount.accountPhone}" id="accountPhone" class="lock" type="text" required="" ></h3>
                        <h3>Account Limit:<input placeholder=" "   value="${cardAccount.limit}" id="limit" class="mail" type="text" required="" ></h3>
                        <h3>Account Balance:<input placeholder=" "   value="${cardAccount.balance}" id="balance" class="mail" type="text" required="" ></h3>
                        <div class="sign-up">
                            <p id="message"></p>
                            <input type="submit" class="submit-btn" style="width:100px;height:50px;" onclick="updatingaccounts()" value="Submit"></div>
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