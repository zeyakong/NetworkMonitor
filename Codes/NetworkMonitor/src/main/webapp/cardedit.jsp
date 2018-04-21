<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>????</title>
    <style>
        table{
            border:1px solid #6699cc;
            width:600px;
            margin:0 auto;
            border-collapse: collapse;
            font-family:'????';
        }
        th,td{
            border:1px solid #6699cc;
            padding:10px;
        }
        th{
            background-color: #090;
        }
        td{
            background-color: #0f9;
        }
        #repswSpan{
            margin-left:150px;
        }
        .error-info{
            color:#f00;
            display: none;
        }
        .focus{
            border:2px solid #6699cc;
        }
        .normal{
            border:1px solid #999;
        }
        .errror{
            border:2px solid #f00;
        }
        .submit-btn{
            display: inline-block;
            color:#fff;
            background-color: #6699cc;
            width:100px;
            height: 25px;
            line-height: 25px;
            font-size:15px;
            font-weight: 600;
            text-align: center;
            border:none;
        }
    </style>
</head>
<body>
<form action="http://www.baidu.com" method="get" id="registerForm">
    <table>
        <tr>
            <th>????</th>
        </tr>
        <tr>
            <td>
                <div>???</div>
                <div><input type="text" name="user"/></div>
                <div class="error-info J_user_error_info">????????????</div>
                <div>??????3-5?????(a-z),??(0-9),???(_)??</div>
            </td>
        </tr>
        <tr>
            <td>
                <div><span>??</span><span id="repswSpan">????</span> </div>
                <div>
                    <input type="password" name="psw"/>
                    <input type="password" name="repsw"/>
                </div>
                <div class="error-info J_error_psw_info">?????????????</div>
                <div class="error-info J_error_repsw_info">?????????</div>
                <div>?????6-12?????(a-z),??(0-9)??</div>
            </td>
        </tr>
        <tr>
            <td>
                <div>????</div>
                <div><input type="text" name="mail"/></div>
                <div class="error-info J_error_mail_info">?????????????</div>
            </td>
        </tr>
        <tr>
            <th><input type="submit" class="submit-btn" value="????"/></th>
        </tr>
    </table>
</form>
<script type="text/javascript" src="../jquery-1.10.2.min.js"></script>
<script>
    $(document).ready(function(){
        var $inputEle=$("input[name]");
        //??????input????
        $inputEle.addClass('normal');
        //input????????
        function inputColor(input){
            input.on('focus',function(e){
                $(this).addClass('focus');
            })
        }
        //???name???input??????????
        inputColor($inputEle);
        //???????????
        function checkVal(flag,$input,$errorInfo){
            if(!flag){
                $input.addClass('error');
                $errorInfo.show();
                return false;
            }
            $input.addClass('normal');
            $errorInfo.hide();
            return true;
        }
        var regUser=/^\w{3,5}$/,
            regPsw=/^[a-z0-9]{6,12}$/i,
            regMail=/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
        var $userErrorInfo=$('.J_user_error_info'),
            $pswErrorInfo=$('.J_error_psw_info'),
            $repswErrorInfo=$('.J_error_repsw_info'),
            $mailErrorInfo=$('.J_error_mail_info');
        var $user=$("input[name='user']"),
            $psw=$("input[name='psw']"),
            $repsw=$("input[name='repsw']"),
            $mail=$("input[name='mail']"),
            $submitBtn=$("input[type='submit']");
        //?????
        $user.on('blur',function(e){
            var userFlag=regUser.test($(this).val());
            return checkVal(userFlag,$(this),$userErrorInfo);
        });
        //????
        $psw.on('blur',function(e){
            var pswFlag=regPsw.test($(this).val());
            checkVal(pswFlag,$(this),$pswErrorInfo);
        });
        //??????
        $repsw.on('blur',function(e){
            var repswVal=$(this).val(),
                pswVal=$psw.val();
            var repswFlag=(repswVal===pswVal);
            checkVal(repswFlag,$(this),$repswErrorInfo);
        });
        //????
        $mail.on('blur',function(e){
            var mailFlag=regMail.test($(this).val());
            checkVal(mailFlag,$(this),$mailErrorInfo);
        });
        //??????
        $submitBtn.on('click',function(e){
            var userFlag=regUser.test($user.val()),
                pswFlag=regPsw.test($psw.val()),
                repswFlag=($repsw.val()===$psw.val()),
                mailFlag=regMail.test($mail.val());
            var checkUserResult=checkVal(userFlag,$user,$userErrorInfo),
                checkPswResult=checkVal(pswFlag,$psw,$pswErrorInfo),
                checkRepswResult=checkVal(repswFlag,$repsw,$repswErrorInfo),
                checkMailResult=checkVal(mailFlag,$mail,$mailErrorInfo);
            if(checkUserResult && checkPswResult && checkRepswResult && checkMailResult){
                $('#registerForm').submit();
            }else{
                e.preventDefault();
            }
        });

    });
</script>

</body>
</html>