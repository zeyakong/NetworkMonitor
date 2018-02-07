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
<head>
    <title>Let's make things better.</title>
    <link href="css/style4.css" rel='stylesheet' type='text/css'/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords"
          content="Alley Signup & Signin Form Tab Form,Login Forms,Sign up Forms,Registration Forms,News letter Forms,Elements"
          ./>
    <style>
        #message {
            color: red;
            font-weight: bold;
        }
        .table{
            margin-top: 30px;
        }
    </style>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
    <script src="js/jquery.min.js"></script>
    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: '1000', //auto or any width like 600px
                fit: true   // 100% fit in a container
            });
        });
    </script>
</head>
<body>


<div class="main-content">
    <h1> Account Detail</h1>
    <div class="sign-up" style="width:100px;height:50px;">
        <input type="submit" class="submit-btn" id="J_submit" value="Back" style="width:100px;height:50px;"
               onclick='window.location.href="accountinfo.action"' ;>
    </div>
    <div class="sap_tabs"/>
    ">
    <table id="tbeTest " class="table table-bordered" style="margin-top:0px; width:100%;
    margin-left:0px;">
        <tr>
            <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">Account
                Name
            </td>
            <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                style="width:200px;height:50px;">${cardAccount.accountName}</td>
        </tr>
        <tr>
            <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">Account
                Address
            </td>
            <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                style="width:200px;height:50px;">${cardAccount.accountAddress}</td>
        </tr>
        <tr>
            <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">Account
                Phone
            </td>
            <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                style="width:200px;height:50px;">${cardAccount.accountPhone}</td>
        </tr>
        <tr>
            <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">Account
                Limit
            </td>
            <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                style="width:200px;height:50px;">${cardAccount.limit}</td>
        </tr>
        <tr>
            <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">Account
                Balance
            </td>
            <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                style="width:200px;height:50px;">${cardAccount.balance}</td>
        </tr>
    </table>

    <br>


    <c:forEach var="ac" items="${list}">
        <table class="table table-bordered" >
            <tr>
                <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">Card Id
                </td>
                <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                    style="width:200px;height:50px;">${ac.cardId}</td>

            </tr>
            <tr>
                <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">Card
                    Name
                </td>
                <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                    style="width:200px;height:50px;">${ac.cardName}</td>

            </tr>
            <tr>
                <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">
                    Associate
                    Account
                </td>
                <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                    style="width:200px;height:50px;">${ac.cardAccount}</td>
            </tr>
            <tr>
                <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">Create
                    Date
                </td>
                <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                    style="width:200px;height:50px;">${ac.expirationDate}</td>
            </tr>
            <tr>
                <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">
                    Security
                    code
                </td>
                <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                    style="width:200px;height:50px;">${ac.securityCode}</td>
            </tr>
        </table>
    </c:forEach>
</div>

<!--start-copyright-->

</body>
</html>

