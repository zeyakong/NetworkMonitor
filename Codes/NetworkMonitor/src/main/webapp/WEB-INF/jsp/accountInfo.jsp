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
    <link href="css/style3.css" rel='stylesheet' type='text/css'/>
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
    </style>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        }
        function accountDetail(id) {
            window.location.href = "accountCards.action?id=" + id;
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
<h1> Account Information</h1>

<input type="submit" class="submit-btn"  value="Back" style="width:100px;height:50px;"
       onclick='window.location.href="goMain.action"' ;>
<div class="main-content">
    <div class="sap_tabs">
        <table id="table-demo" class="table table-bordered" style="margin-top:10px; width:100%;
    margin-left:0px;">
            <thead>
            <tr>
                <th class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">Account
                    Id
                </th>
                <th class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:200px;height:50px;">Account
                    Name
                </th>
                <th class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:100px;height:50px;">
                    Detail
                </th>
                <th class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:100px;height:50px;">
                    Manage
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="ac" items="${list}">
                <tr>
                    <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                        style="width:200px;height:50px;">${ac.accountId}</td>
                    <td class="resp-tab-item" aria-controls="tab_item-0" role="tab"
                        style="width:200px;height:50px;">${ac.accountName}</td>
                    <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:100px;height:50px;">
                        <div class="sign-up" style="width:100px;height:50px;">
                            <input type="submit" class="submit-btn" id="J_submit" value="Details"
                                   style="width:100px;height:50px;" onclick="accountDetail('${ac.accountId}')">
                        </div>

                            <%-- <a style="padding:0;">
                                <button type="button" class="submit-btn" onclick="accountDetail('${ac.accountId}')" style="width:100px;height:50px;">View
                                </button>
                            </a> --%></td>
                    <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:100px;height:50px;">
                        <div class="sign-up" style="width:100px;height:50px;">
                            <input type="freeze" class="submit-btn" value="Edit"
                                   style="text-align: center; width:100px;height:50px;">
                        </div>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>


    </div>
</div>

<!--start-copyright-->

</body>
</html>