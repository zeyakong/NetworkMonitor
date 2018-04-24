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



    ?? <script src="Scripts/jquery.validate.js"></script>
    ??<script src="Scripts/jquery.validate.unobtrusive.js"></script>
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

    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.js"></script>
    <script>

        function refreshCaptcha(){
            var ran = Math.floor(Math.random() * 100)
            $('#captcha1').attr('src','/doGet?' + ran);
        }

        $('#btnSubmit').on('click',function(event){
            event.preventDefault();

            if ($('#phone').val().trim().length < 1) {
                layer.msg('Can not been empty?');
                $('#phone').focus();
                return;
            }
            var reg1 = /^\(([0-9]{3})\)[ ]([0-9]{3})[-]([0-9]{4})$/;
            var input1 = $('#phone').val();
            if(!reg1.test(input1)){
                layer.msg('Invalid phone format');
                return;
            }

            if ($('#password').val().trim().length < 1) {
                layer.msg('??????');
                $('#password').focus();
                return;
            }
            var pass = /^[a-zA-Z]\w{5,17}$/;
            var input2 = $('#password').val();
            if(!pass.test(input2)){
                layer.msg('??????6~18???,?????????')
                return;

            }
            if ($('#repeatPassword').val().trim().length < 1) {
                layer.msg('????????');
                $('#repeatPassword').focus();
                return;
            }

            if (($('#repeatPassword').val().trim())!=($('#password').val().trim())) {
                layer.msg('??????????');
                $('#repeatPassword').focus();
                return;
            }
            if ($('#yzm').val().trim().length < 1) {
                layer.msg('???????');
                $('#yzm').focus();
                return;
            }


            $.post('/api/register', $('#form_reg').serialize(), function(res) {
                if(res.code == 200){
                    setTimeout(function(){
                        location.reload();
                    },2000);
                    layer.msg('?????????????????')
                }else{
                    //$('.error-message').text(res.message);
                    layer.msg(res.message)
                }

            })

        })

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
                        <h3>First Name:<input placeholder="The length of name must be between 2 to 15"
                                              maxlength="15"     id="name1"  class="lock" type="text" required="required"  ></h3>
                        <h3>Last Name:<input placeholder="The length of name must be between 2 to 15"
                                             maxlength="15" id="name2"   class="lock" type="text" required="required"  ></h3>
                        <h3>Account Addrress:<input placeholder="Street,City,State and ZIP" id="address" class="lock" type="text" required="required"  ></h3>
                        <h3>Phone Number:<input placeholder="(XXX) XXX-XXXX"   id="phone" class="mail" type="text" required="required"
                                                data-val-regex-pattern="^\(([0-9]{3})\)[ ]([0-9]{3})[-]([0-9]{4})$"          ></h3>
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
<script>


</script>
</html>
