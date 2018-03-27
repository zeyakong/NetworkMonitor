<!doctype html>
<html lang="en">
<title> Network Monitor</title>
<html>
<head>
    <title>Let's make things better.</title>
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
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
    </style>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        }

        function jump(){
            <%request.getSession().setAttribute("loginId",1);%>
            window.location.href="/goMain";
        }
        function doLogin() {
            var userName = $("#username").val();
            var password = $("#password").val();
            $.ajax({
                type: "POST",
                url: "doLogin.action",
                data: "username=" + userName + "&password=" + password,
                success: function (data) {
                    if (data) {
                        //success
                        document.cookie="username="+data.username+" ;loginId="+data.loginId;
                        window.location.href="loginSuccess.action";
                    } else {
                        //incorrect
                        $("#message").text("The username or password was wrong!");
//                        document.getElementById("message").innerHTML="The username or password wrong!";
                    }
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
<%--<button class="btn btn-primary" onclick="jump()">Developer:Jump this</button>--%>
<div class="main-content">
    <div class="sap_tabs">
        <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
            <ul>
                <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Welcome</span></li>

            </ul>
            <!---->
            <div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
                <div class="facts">
                    <div class="register">
                        <input placeholder="Username" id="username" class="mail" type="text" required=""onfocus='$("#message").text("");'>
                        <input placeholder="Password" id="password" class="lock" type="password" required=""onfocus='$("#message").text("");'>
                        <div class="sign-up">
                            <p id="message"></p>
                            <input type="submit" onclick="doLogin()" value="Sign in"></div>
                        <h3><a  href="help.pdf" target="view_window">Help</a></h3>
                    </div>
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