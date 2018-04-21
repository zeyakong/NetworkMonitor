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
        .main-content{
            width:1000px;
            height:1500px;
            background-color: rgba(42, 54, 80, 0.44);
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
    </style>
    <script type="application/x-javascript">
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
        function validatephone(mobile)
        {
            if(mobile.length==0)
            {
                $("#message").text("Cant been empty?");
                return false;
            }
            var reg = /^[0-9]+$/;
            if(mobile!=""&&!reg.test(mobile)){
                $("#message").text("Must be Number!");
                return false;
            }


        }
        function validatemobile(mobile)
        {
            if(mobile.length==0)
            {
                $("#message").text("Security Code:Security code cant been empty?");
                return false;
            }
            if(mobile.length!=3)
            {
                $("#message").text("Security Code:Security code should be 3!");
                return false;
            }
            var reg = /^[0-9]+$/;
            if(mobile!=""&&!reg.test(mobile)){
                $("#message").text("Security Code:Must be Number!");
                return false;
            }


        }
        function validatecard(mobile)
        {
            if(mobile.length==0)
            {
                $("#message").text("Card Number:Cant been empty?");
                return false;
            }
            if(mobile.length!=14)
            {
                $("#message").text("Card Number:Card Number should be 16!");
                return false;
            }
            var reg = /^[0-9]+$/;
            if(mobile!=""&&!reg.test(mobile)){
                $("#message").text("Card Number:Must be Number!");
                return false;
            }


        }

        function validatenumber(mobile)
        {

            var reg = /^[0-9]+$/;
            if(mobile!=""&&!reg.test(mobile)){
                $("#message").text("Must be Number!");
                return false;
            }


        }
        function validatemobile2(mobile)
        {

            if(mobile.length!=5)
            {
                $("#message").text("Expiration date:Invalid Date format(MM/YY)")
                return false;
            }



        }

        function validatename(name){
            if(name.length<2){
                $("#message").text("Name:Invalid format(name should more than 2)")
            }
            if(name.length>15){
                $("#message").text("Name:Invalid format(name should less than 15)")
            }
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
                        <h3>First Name:<input placeholder="The length of name must be between 2 to 15" id="name1" onblur="validatename(this.value)"  onfocus='$("#message").text("");' class="lock" type="text" required=""  ></h3>
                        <h3>Last Name:<input placeholder="The length of name must be between 2 to 15" id="name2" onblur="validatename(this.value)"  onfocus='$("#message").text("");' class="lock" type="text" required=""  ></h3>
                        <h3>Account Addrress:<input placeholder=" " id="address" class="lock" type="text" required=""  ></h3>
                        <h3>Phone Number:<input placeholder="XXX-XXX-XXXX"   id="phone" class="mail" type="text" required="" onblur="validatenumber(this.value)"  onfocus='$("#message").text("");' ></h3>
                        <h3>Limit:<input type="text" class="form-control" id="limit" placeholder="$" maxlength="5"  onkeyup="value=value.replace(/[^\d]/g,'')"></h3>
                        <h3>Balance:<input type="text" class="form-control" id="balance" placeholder="$"   maxlength="5" onkeyup="value=value.replace(/[^\d]/g,'')"></h3>
                        <h4>Related Card</h4>
                        <h3>Card Number:<input placeholder="XXXX-XXXX-XXXX-XXXX"  id="cnumber" class="mail" type="text" required=""  onblur="validatecard(this.value)"  onfocus='$("#message").text("");'  ></h3>
                        <h3>First Name:<input placeholder="The length of name must be between 2 to 15" onblur="validatename(this.value)"  onfocus='$("#message").text("");' id="cname1" class="lock" type="text" required=""  ></h3>
                        <h3>Last Name:<input placeholder="The length of name must be between 2 to 15" onblur="validatename(this.value)"  onfocus='$("#message").text("");' id="cname2" class="lock" type="text" required=""  ></h3>

                        <h3>Expiration date:<input placeholder="MM/YY" id="cdate" class="lock" type="text" required=""  onblur="validatemobile2(this.value)"  onfocus='$("#message").text("");'       ></h3>
                        <h3>Sercurity Code:<input placeholder="NNN" id="ccode" class="mail" type="text" required=""   onblur="validatemobile(this.value)" onfocus='$("#message").text("");'  ></h3>
                        <div class="sign-up">
                            <p id="message"></p>
                            <input type="submit" class="submit-btn" style="width:100px;height:50px;" onclick="createaccounts()"  value="Submit"></div>
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