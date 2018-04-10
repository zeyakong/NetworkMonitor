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
    <link href="css/styleai.css" rel='stylesheet' type='text/css'/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="js/modernizr.js"></script> <!-- Modernizr -->
    <link rel="stylesheet" href="css/css/style.css"> <!-- CSS reset -->
    <script src="/bundles/modernizr?v=wBEWDufH_8Md-Pbioxomt90vm6tJN2Pyy9u9zHtWsPo1"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords"
          content="Alley Signup & Signin Form Tab Form,Login Forms,Sign up Forms,Registration Forms,News letter Forms,Elements"
          ./>
    <style>
        #message {
            color: red;
            font-weight: bold;
        }
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=80);
        }
        .white_content {
            display: none;
            position: absolute;
            top: 10%;
            left: 10%;
            width: 80%;
            height: 80%;
            border: 16px solid lightblue;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
    </style>
    <%--<script type="application/x-javascript">
        function createaccount() {
            console.log("do");
            var name = $("#name").val();
            var address = $("#address").val();
            var phone = $("#phone").val();
            var limit = $("#limit").val();
            var balance = $("#balance").val();
            var cnumber = $("#cnumber").val();
            var cdate = $("#cdate").val();
            var cname = $("#cname").val();
            var ccode = $("#ccode").val();
            $.ajax({
                type: "POST",
                url: "createaccount.action",
                data: "name=" + name + "&address=" + address+ "&phone=" + phone+ "&limit=" + limit
                + "&balance=" + balance+ "&cnumber=" + cnumber+ "&cdate=" + cdate+ "&cname=" + cname+ "&ccode=" + ccode,
                success: function (data) {
                    if (data) {

                        /*alert("Success!");*/
                    } else {
                        //incorrect
                        $("#message").text("error");
//                        document.getElementById("message").innerHTML="The username or password wrong!";
                    }
                }
            });
        }
    </script>--%>   <script type="application/x-javascript">
    addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    function accountDetail(id) {
        window.location.href = "accountCards.action?id=" + id;
    }
    function deleteAccount(id){
        window.location.href="deleteAccount.action?id="+id;
    }
    function updateAccount(id) {
        console.log("43");
        window.location.href = "updateAccountnumber.action?id=" + id;
        console.log("44");
    }
    function ShowDiv(show_div,bg_div){
        document.getElementById(show_div).style.display='block';
        document.getElementById(bg_div).style.display='block' ;
        var bgdiv = document.getElementById(bg_div);
        bgdiv.style.width = document.body.scrollWidth;
// bgdiv.style.height = $(document).height();
        $("#"+bg_div).height($(document).height());
    };
    //?????
    function CloseDiv(show_div,bg_div)
    {
        document.getElementById(show_div).style.display='none';
        document.getElementById(bg_div).style.display='none';
    };
















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
<a href="#cd-nav" class="cd-nav-trigger">
    Menu<span><!-- used to create the menu icon --></span>
</a> <!-- .cd-nav-trigger -->


<div class="main-content">
    <h1> Account Informations</h1>
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
                    Edit
                </th>
                <th class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:100px;height:50px;">
                    Delete
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
                            <input type="submit" class="submit-btn" id="J_submit" value="Details" id="detail"
                                   style="width:100px;height:50px;" onclick="accountDetail('${ac.accountId}')">
                        </div>

                            <%-- <a style="padding:0;">
                                <button type="button" class="submit-btn" onclick="accountDetail('${ac.accountId}')" style="width:100px;height:50px;">View
                                </button>
                            </a> --%></td>
                    <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:100px;height:50px;">
                        <div class="sign-up" style="width:100px;height:50px;">
                            <input type="freeze" class="submit-btn" value="Edit" id="edit"  onclick=" updateAccount('${ac.accountId}')"
                                   style="text-align: center; width:100px;height:50px;">
                        </div>
                    </td>
                    <td class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:100px;height:50px;">
                        <div class="sign-up" style="width:100px;height:50px;">
                            <input type="redman" class="submit-btn" value="Delete" id="delete"
                                   style="text-align: center; width:100px;height:50px;"onclick="deleteAccount('${ac.accountId}')">
                        </div>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="sign-up" style="width:260px;height:80px;margin:0px auto;">
            <input type="submit" class="submit-btn" id="Create" value="Create a New account"
                   style="width:260px;height:80px;" onclick='window.location.href="createaccountpage.action"'>
        </div>


    </div>
</div>

<!--start-copyright-->
<%--
<div id="fade" class="black_overlay">
</div>
<div id="MyDiv" class="white_content">
    <div style="text-align: right; cursor: default; height: 40px;" id="move">
        <span style="font-size: 16px;" onclick="CloseDiv('MyDiv','fade')">X</span>
    </div>
    <form class="form-horizontal" role="form"  form action="createaccount" method="post">
        <div class="form-group">
            <label for="na" class="col-sm-2 control-label">Account  Name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" maxlength="15" minlength="2" placeholder="The length of name must be between 2 to 15">
            </div>
        </div>
        <div class="form-group">
            <label for="ad" class="col-sm-2 control-label">Account Address</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="address" minlength="5">
            </div>
        </div>
        <div class="form-group">
            <label for="ph" class="col-sm-2 control-label">Phone Number</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="phone" maxlength="7" minlength="7" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="XXX-XXXX">
            </div>
        </div>
        <div class="form-group">
            <label for="li" class="col-sm-2 control-label">Limit</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="limit" placeholder="$" maxlength="5" onkeyup="value=value.replace(/[^\d]/g,'')">
            </div>
        </div>
        <div class="form-group">
            <label for="ba" class="col-sm-2 control-label">Balance</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="balance"  placeholder="$" maxlength="5" onkeyup="value=value.replace(/[^\d]/g,'')">
            </div>
        </div>
        Related Card
        <div class="form-group">
            <label for="cn" class="col-sm-2 control-label">Card Number</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="cnumber" maxlength="16" minlength="16" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="XXXX-XXXX-XXXX-XXXX">
            </div>
        </div>
        <div class="form-group">
            <label for="co" class="col-sm-2 control-label">Owner Name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="cname" maxlength="15" minlength="2" placeholder="The length of name must be between 2 to 15">
            </div>
        </div>
        <div class="form-group">
            <label for="cd" class="col-sm-2 control-label">Expiration date</label>
            <div class="col-sm-10">
                <input type="date" class="form-control" id="cdate" placeholder="MM/DD/YYYY">
            </div>
        </div>
        <div class="form-group">
            <label for="cc" class="col-sm-2 control-label">Sercurity Code</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="ccode" maxlength="3" minlength="3" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="XXX">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit"  class="btn btn-default" id="createb">Create</button>
            </div>
        </div>
    </form>
</div>--%>













<!--start-copyright-->

<nav class="cd-nav-container" id="cd-nav">
    <header>
        <h3>Function</h3>
        <a href="#" class="cd-close-nav">Close</a>
    </header>




    <ul  class="cd-nav">

        <li class="cd-selected"  data-menu="accountinfo">
            <a href=" " onclick='window.location.href="accountInfo.action"'>
					<span >
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 1000 1000" enable-background="new 0 0 1000 1000" xml:space="preserve"   style="stroke: #000066; fill: #666666;" >
<metadata> Svg Vector Icons : http://www.sfont.cn </metadata>
<g><path d="M769.5,303.2c0-156.3-126.1-283-281.8-283c-155.6,0-281.8,126.7-281.8,283c0,156.3,126.1,283,281.8,283C643.4,586.1,769.5,459.4,769.5,303.2L769.5,303.2z M255,303.2c0-129.1,104.2-233.7,232.7-233.7c128.5,0,232.8,104.6,232.8,233.7c0,129.1-104.2,233.7-232.8,233.7C359.2,536.9,255,432.3,255,303.2L255,303.2z M10,955.2v24.6h24.5h441h490H990v-24.6c0-220.9-226.7-418.3-490-418.3c-15.8,0-31.6,0.6-47.2,1.9c-13.5,1.1,21.6,13,22.7,26.5c14.3-1.2,10,20.8,24.5,20.8c237.6,0,441,177,441,369.1l24.5-24.6h-490h-441L59,955.2c0-130.7,82.1-250.1,214.4-316.6c12.1-6.1,17-20.9,10.9-33c-6.1-12.2-20.8-17.1-32.9-11C103.4,669,10,804.8,10,955.2L10,955.2z"  /></g>
</svg>
					</span>

                <em>Account manage</em>
            </a>
        </li>
        <li data-menu="cardmanage">
            <a href=" " onclick='window.location.href="cardInfo.action"'>
					<span>
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 1000 1000" enable-background="new 0 0 1000 1000" xml:space="preserve">
<metadata> Svg Vector Icons : http://www.sfont.cn </metadata>
<g><g transform="translate(0.000000,511.000000) scale(0.100000,-0.100000)"><path d="M581.2,3196.5c-184.6-64.8-341.7-210.1-430.1-398.7l-51.1-108V107.3v-2582.6l64.8-131.6c72.7-147.3,206.2-280.8,353.5-353.5l92.3-45.2H5000h4389.4l94.3,47.1c149.3,72.6,278.9,204.2,351.6,351.5l64.8,131.6V107.3v2582.6l-64.8,131.6c-72.7,147.3-202.3,278.9-351.6,351.5l-94.3,47.1l-4359.9,3.9C1103.6,3228,661.7,3226,581.2,3196.5z M9446.3,2848.9c125.7-96.2,149.3-172.8,149.3-516.5v-300.5H5000H404.4v300.5c0,379,31.4,461.5,206.2,551.9c53,27.5,492.9,31.4,4411,25.5l4352.1-3.9L9446.3,2848.9z M1003.4,1167.8C701,865.4,441.7,617.9,429.9,617.9c-19.6,0-25.5,121.8-25.5,549.9v549.9h573.5h575.4L1003.4,1167.8z M2554.9,1167.8L2005,617.9h-549.9H905.2l549.9,549.9l549.9,549.9h549.9h549.9L2554.9,1167.8z M4086.8,1167.8l-549.9-549.9H2987h-549.9l549.9,549.9l549.9,549.9h549.9h549.9L4086.8,1167.8z M5638.3,1167.8l-549.9-549.9h-549.9h-549.9l549.9,549.9l549.9,549.9h549.9h549.9L5638.3,1167.8z M7170.1,1167.8l-549.9-549.9h-549.9h-549.9l549.9,549.9l549.9,549.9h549.9H7720L7170.1,1167.8z M8702,1167.8l-549.9-549.9H7612h-540.1l549.9,549.9l549.9,549.9h540.1h540.1L8702,1167.8z M9595.6,1108.9v-491h-494.9h-496.9l491,491c269.1,271,492.9,491,494.9,491C9593.6,1599.9,9595.6,1379.9,9595.6,1108.9z M9595.6-1051.4c0-1176.4-3.9-1366.9-29.5-1427.8c-39.3-94.3-80.5-139.4-170.9-184.6c-70.7-35.4-192.5-37.3-4395.3-37.3c-4202.8,0-4324.6,2-4395.3,37.3c-90.3,45.2-131.6,90.3-170.9,184.6c-25.5,60.9-29.5,251.4-29.5,1427.8V303.7H5000h4595.6V-1051.4z"/><path d="M6759.7-719.5l-51.1-39.3v-616.7v-616.7l51.1-39.3c51.1-41.3,70.7-41.3,1082.1-41.3h1029.1l47.1,49.1l49.1,47.1v600.9v601l-49.1,47.1l-47.1,49.1H7841.8C6830.4-678.3,6810.7-678.3,6759.7-719.5z M8652.9-1375.5v-383h-815h-815v383v383h815h815V-1375.5z"/><path d="M1213.5-1273.4c-90.3-94.3-37.3-233.7,98.2-259.2c35.3-5.9,263.2-9.8,502.8-5.9l439.9,5.9l49.1,57c37.3,45.2,45.2,70.7,37.3,115.9c-27.5,131.6-23.6,131.6-581.3,131.6C1258.7-1228.2,1254.8-1228.2,1213.5-1273.4z"/><path d="M2912.3-1251.8c-88.4-68.7-66.8-231.7,35.3-271c74.6-27.5,2105.3-25.5,2187.8,2c108,37.3,137.5,172.8,55,249.4l-45.2,43.2H4045.5C3195.2-1228.2,2937.9-1234.1,2912.3-1251.8z"/></g></g>
</svg>
					</span>

                <em>Card manage</em>
            </a>
        </li>

        <li  data-menu="cardinfo">
            <a href=" " onclick='window.location.href="logout.action"'>
					<span ><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 1000 1000" enable-background="new 0 0 1000 1000" xml:space="preserve">
<metadata> Svg Vector Icons : http://www.sfont.cn </metadata>
<g><g transform="translate(0.000000,511.000000) scale(0.100000,-0.100000)"><path d="M4453.8,4811.6c-524.1-45.9-1021.5-283.1-1279.8-606.4c-170.2-214.2-285-462.9-344.3-738.4c-19.1-91.8-32.5-304.2-40.2-644.7l-11.5-510.8l-59.3-24.9c-99.5-44-130.1-137.7-132-386.4c0-262.1,34.4-417,147.3-656.1c93.7-197,164.5-306.1,309.9-476.3c68.9-82.3,110.9-155,141.6-248.7c63.1-197,214.3-478.2,334.8-629.4c57.4-72.7,105.2-137.7,105.2-145.4c0-17.2-489.7-267.8-765.2-392.2c-132-59.3-482.1-210.4-778.6-336.7c-797.7-334.8-916.3-396-1094.2-562.4c-462.9-436.1-839.8-1316.1-876.1-2048.7L100-3825.4l179.8-68.9c1295.1-491.6,4139.6-694.4,6549.9-466.7l229.6,21l5.7,185.6l5.7,187.5l-1155.4,3.8l-1153.5,5.7l-82.3,53.6c-55.5,38.3-95.6,84.2-128.2,153l-45.9,99.5v719.3v717.4l47.8,97.6c30.6,61.2,78.4,116.7,128.2,151.1l78.4,55.5l1155.4,5.7l1153.5,3.8l-3.8,537.5l-5.7,537.5l-286.9,128.2c-302.2,135.8-570.1,267.8-770.9,378.8l-120.5,67l65,70.8c160.7,177.9,309.9,447.6,396,715.4c28.7,89.9,67,156.9,118.6,210.4c116.7,124.3,288.8,392.1,355.8,552.9c97.6,231.5,122.4,376.8,114.8,627.4c-7.6,250.6-38.3,334.8-132,367.3c-55.5,19.1-55.5,21-57.4,174.1c-3.8,485.9-34.5,966-70.8,1094.2c-208.5,749.9-757.5,1168.8-1639.4,1253C4798.2,4834.5,4712.1,4834.5,4453.8,4811.6z"/><path d="M7489.7-1304.1l-57.4-57.4v-461v-461H6236.7c-1319.9,0-1293.2,1.9-1367.8-118.6c-36.3-59.3-38.3-95.6-38.3-531.8c0-436.1,1.9-472.5,38.3-531.8c74.6-120.5,47.8-118.6,1367.8-118.6h1195.6v-457.2c0-426.6,1.9-459.1,38.3-505c45.9-57.4,120.5-78.4,177.9-49.7c114.8,61.2,2180.8,1482.5,2213.3,1524.6c26.8,32.5,38.3,76.5,38.3,139.6c0,80.4-9.6,103.3-61.2,158.8c-91.8,93.7-2176.9,1509.3-2238.1,1518.9C7562.4-1248.6,7533.7-1262,7489.7-1304.1z"/></g></g>
</svg> </span>

                <em>Logout</em>
            </a>
        </li>


        <li   data-menu="map">
            <a href=" " onclick='window.location.href="goMain.action"'>
					<span  >
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 1000 1000" enable-background="new 0 0 1000 1000" xml:space="preserve" style="stroke: #000066; fill: #666666;">
<metadata> Svg Vector Icons : http://www.sfont.cn </metadata>
<g><g transform="translate(0.000000,511.000000) scale(0.100000,-0.100000)"><path d="M2732.7,4586.4l-67-58.8l-6.1-580.4l-6.1-580.4H1781c-957.8,0-982.2-2-1041-119.7c-42.6-79.1-40.6-119.7,8.1-198.9c26.4-42.6,62.9-71,115.7-85.2c48.7-14.2,395.7-22.3,933.5-22.3h858.4l4.1-3058.1l6.1-3060.1h202.9h202.9l6.1,917.2l4.1,917.2l523.5-2h521.5l6.1,205l6.1,205h-529.6h-527.6v1937.9v1937.9h1795.9h1795.9v-395.7v-395.7h202.9h202.9v1189.1v1189.1l-58.9,58.8c-67,67-152.2,77.1-243.5,30.4c-97.4-50.7-103.5-91.3-103.5-692v-558H4879.6H3083.8l-6.1,580.4l-6.1,580.4l-67,58.8c-44.6,40.6-87.3,58.8-136,58.8S2777.3,4626.9,2732.7,4586.4z"/><path d="M8668.2,4127.7c-570.2-154.2-886.8-744.7-696-1296.7c22.3-64.9,99.4-225.2,172.5-359.2c184.7-332.8,371.3-726.5,505.3-1073.5c62.9-162.3,129.9-334.8,150.2-385.6c30.4-79.1,44.6-91.3,101.5-97.4c75.1-8.1,69-22.3,239.5,432.2c109.6,294.2,426.1,963.9,596.6,1260.2c89.3,156.2,162.3,407.9,162.3,554c0,140-52.8,338.9-127.8,476.9C9567.2,4026.3,9084.2,4239.4,8668.2,4127.7z M9063.9,3537.2c269.9-111.6,349-436.3,160.3-651.4c-202.9-231.3-554-176.5-685.9,105.5c-93.3,200.9-10.1,426.1,192.8,527.6C8846.8,3577.8,8956.4,3583.9,9063.9,3537.2z"/><path d="M4918.2,1461.3c-32.5-20.3-79.1-56.8-101.5-83.2c-40.6-44.6-40.6-77.1-46.7-2619.8l-4.1-2575.1H3296.8H1827.7l-101.5-267.9c-56.8-148.1-109.6-286.1-115.7-304.4c-14.2-34.5,79.1-36.5,1769.5-36.5h1785.7l67,46.7c36.5,24.4,83.2,77.1,103.5,115.7c36.5,67,38.5,176.5,38.5,2611.6V891.1h1501.6c1189.1,0,1501.6,6.1,1501.6,26.4c-2,12.2-50.7,148.1-109.6,298.3l-107.5,273.9l-1590.9,4.1C5050.1,1499.9,4977,1497.8,4918.2,1461.3z"/><path d="M6673.5-336.6v-598.6h-334.8h-334.8v-202.9v-202.9l67-2c34.5,0,184.7-2,328.7-4l263.8-4.1l10.1-1373.8l10.1-1371.8l48.7-52.8c60.9-62.9,148.1-85.2,227.3-52.8c109.6,46.7,119.7,95.4,119.7,566.2v426.1l1124.2,6.1l1124.2,6.1l52.8,48.7c95.4,91.3,87.3,249.6-16.3,316.6c-44.6,30.4-170.4,34.5-1162.8,36.5l-1112,4.1v720.4v720.4l963.9,4.1c529.6,2,1034.9,4,1120.1,4c133.9,2,164.4,8.1,213.1,50.7c46.7,40.6,56.8,64.9,56.8,142.1c0,73.1-12.2,103.5-56.8,148.2l-54.8,56.8l-1126.2,6.1l-1126.2,6.1v596.6V262h-202.9h-202.9V-336.6z"/><path d="M855.6-1186.9c-347-85.2-637.2-367.3-728.5-710.2c-36.5-138-36.5-381.5,2-529.6c18.3-67,77.1-202.9,133.9-304.4c251.6-452.5,497.2-988.3,669.6-1459c67-184.6,87.3-215.1,150.2-215.1c64.9,0,81.2,26.4,182.6,300.3c170.5,466.7,342.9,838.1,608.8,1323.1c146.1,263.8,192.8,416,192.8,633.1c0,271.9-97.4,501.2-292.2,698.1C1531.4-1209.2,1182.3-1107.7,855.6-1186.9z M1287.9-1801.7c190.7-97.4,267.9-361.2,166.4-554c-138-257.7-485-298.3-673.7-79.2c-180.6,213.1-117.7,517.5,133.9,645.3C1020-1734.8,1170.2-1738.8,1287.9-1801.7z"/></g></g>
</svg></span>

                <em>Net Map</em>
            </a>
        </li>
    </ul> <!-- .cd-3d-nav -->
</nav>
<div class="cd-overlay"><!-- shadow layer visible when navigation is visible --></div>

<script src="js/jquery-2.1.1.js"></script>
<script src="js/main.js"></script> <!-- Resource jQuery -->


















</body>
</html>