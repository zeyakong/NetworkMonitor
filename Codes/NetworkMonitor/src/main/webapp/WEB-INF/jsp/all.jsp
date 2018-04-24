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
    <script src="Scripts/jquery-1.7.1.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    <script src="https://github.com/igorescobar/jQuery-Mask-Plugin/blob/master/jquery.mask.min.js"></script>
    <!--JQuery CDN-->
    <script src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.js"></script>
    <%--
    <script src="Scripts/jquery.validate.js"></script>
    <script src="Scripts/jquery.validate.unobtrusive.js"></script>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords"
          content="Alley Signup & Signin Form Tab Form,Login Forms,Sign up Forms,Registration Forms,News letter Forms,Elements"
          ./>
    <style>
        .main-content{
            width:80%;
            height:100%;
            background-color: rgba(42, 54, 80, 0.88);
            margin:50px auto;
        }
        #message{
            padding-bottom:25px;
            color: red;
            font-weight:bold;
            font-size:30px;
        }

        h3{
            padding-top:35px;
            color:white;
            text-align:right;
        }
        h4{
            padding-top:45px;
            color:white;
            text-align:left;
        }
        .register input[type="text"] {
            margin:0 40px 15px 0;
        }
    </style>

    <%--<script type="application/x-javascript">
    addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    }

    function createaccounts() {

        var name = $("#name1").val()+" "+$("#name2").val();
        var address = $("#address").val();
        var phone = $("#phone").val();
        var balance = $("#balance").val();
        var limit = $("#limit").val();
        var cnumber = $("#cnumber").val();
        var cname = $("#cname1").val()+" "+$("#cname2").val();
        var cdate = $("#cdate").val();
        var ccode = $("#ccode").val();
        $.ajax({
            type: "POST",
            url: "createaccount.action",
            /* data: "username=" + userName + "&password=" + password,*/
            data: "&name=" + name+"&address=" + address+"&phone=" + phone+"&balance=" + balance+"&limit=" + limit+"&cnumber=" + cnumber+ "&cname=" + cname + "&cdate=" + cdate+ "&ccode=" + ccode,
            success: function (result) {
                console.log(result);//??????????(???)
                if (result=="Success to create account!") {
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


</script>--%>
    <%--<script src="js/jquery.min.js"></script>
    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>--%>

</head>
<body>

<div class="main-content">
    <div class="sign-up" style="width:100px;height:50px;">
        <input type="submit" class="submit-btn" id="J_submit" value="Back" style="width:100px;height:50px;margin-top:150px;margin-left:150px;"
               onclick='window.location.href="accountInfo.action"' ;>
    </div>
    <div class="sap_tabs">

        <div class="facts">
            <div class="register">
                <h1>&nbsp Account Information</h1>
                <h3>First Name:<input placeholder="The length of name must be between 2 to 15"
                                      maxlength="15"     id="name1"  class="lock" type="text" required="required"  ></h3>
                <h3>Last Name:<input placeholder="The length of name must be between 2 to 15"
                                     maxlength="15" id="name2"   class="lock" type="text" required="required"  ></h3>
                <h3>Account Addrress:<input placeholder="Street,City,State and ZIP" id="address" class="lock" type="text" required="required"  ></h3>
                <h3>Phone Number:<input placeholder="(XXX) XXX-XXXX"   id="phone" class="phonelimi" type="text" required="required"
                ></h3>
                <h3>Limit:<input type="text" class="goldlimi" id="limit" placeholder="$"    ></h3>
                <h3>Balance:<input type="text" class="goldlimi" id="balance" placeholder="$"></h3>
                <h1>&nbsp Related Card</h1>
                <h3>Card Number:<input placeholder="XXXX-XXXX-XXXX-XXXX"  id="cnumber" class="cardlimi" type="text" required=""    ></h3>
                <h3>First Name:<input placeholder="The length of name must be between 2 to 15"    id="cname1" class="lock" type="text" required="required"  ></h3>
                <h3>Last Name:<input placeholder="The length of name must be between 2 to 15"    id="cname2" class="lock" type="text" required="required"  ></h3>

                <h3>Expiration date:<input placeholder="MM/YY" id="cdate" class="datelimi" type="text" required="required"        ></h3>
                <h3>Sercurity Code:<input placeholder="NNN" id="ccode" class="codelimi" type="text" required="required"      ></h3>
                <div class="sign-up">
                    <p id="message"></p>
                    <input type="submit" class="submit-btn" style="width:100px;height:50px;" onclick="createaccounts()"  value="Submit"></div>
            </div>
        </div>
    </div>
</div>


<!--start-copyright-->

</body>
<script>


    $(document).ready(function () {
        $(".phonelimi").mask("(000) 000-0000");
        $(".codelimi").mask("000");
        $(".datelimi").mask("00/0000");
        $(".goldlimi").mask("00000");
        $(".cardlimi").mask("0000000000000000");
    });
    function createaccounts() {

        var name = $("#name1").val()+" "+$("#name2").val();
        var address = $("#address").val();
        var phone = $("#phone").val();
        var balance = $("#balance").val();
        var limit = $("#limit").val();
        var cnumber = $("#cnumber").val();
        var cname = $("#cname1").val()+" "+$("#cname2").val();
        var cdate = $("#cdate").val();
        var ccode = $("#ccode").val();
        $.ajax({
            type: "POST",
            url: "createaccount.action",
            /* data: "username=" + userName + "&password=" + password,*/
            data: "&name=" + name+"&address=" + address+"&phone=" + phone+"&balance=" + balance+"&limit=" + limit+"&cnumber=" + cnumber+ "&cname=" + cname + "&cdate=" + cdate+ "&ccode=" + ccode,
            success: function (result) {
                console.log(result);//??????????(???)
                if (result=="Success to create account!") {
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
</html>




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
        .main-content{
            width:80%;
            height:100%;
            background-color: rgba(42, 54, 80, 0.88);
            margin:50px auto;
        }
        .register input[type="text"] {
            margin:0 40px 15px 0;
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
<h1> Update Account</h1>

<div class="main-content">
    <div class="sign-up" style="width:100px;height:50px;">
        <input type="submit" class="submit-btn" id="J_submit" value="Back" style="width:100px;height:50px;margin-top:80px;margin-left:80px;"
               onclick='window.location.href="accountInfo.action"' ;>

    </div>
    <div class="sap_tabs">
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

<!--start-copyright-->
<div class="copy-right">
    <div class="wrap">
        <p>&copy; </p>
    </div>
</div>
<!--//end-copyright-->
</body>
</html>












