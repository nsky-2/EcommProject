<%@ page import="HMEcomm.Customer; HMEcomm.Country; HMEcomm.Title" %>
%{--<div id="noLogged" class="login-popup">--}%
    %{--<h1>Not logged in</h1>--}%
%{--</div>--}%

<div id="loginBox">
    <div id="topMask"></div>
    <div id="login1">
        <div class="heading">
            <span class="head">login</span>
            <span id="logClose" class="logClose">x</span>
        </div>
        <div class="logBody">
            <div class="bodyLeft">
                <g:form role="form" action="loginCustomer" controller="customer" method="post" class="login-form" params='[addToCart:"${addToCart}", viewCart:"${viewCart}"]'>
                    <fieldset class="textbox">
                    <ul>
                        <li><span>Username</span></li>
                        <li class="email"><span><input id="username" name="username" value="" type="text" autocomplete="on" placeholder="Username or Email"></span></li>
                        <li><span>Password</span></li>
                        <li class="logPwd"><span><input id="pword" name="password" value="" type="password" placeholder="Password"></span></li>
                        <li class="forgetPwd"><span>Forget Password?</span></li>
                                    <li class="button"><span ><g:submitButton name="login" value="Login" class="btnlogin" /></span></li>

                            %{--<li><span>Invalid Username or Password</span></li>--}%

                    </ul>
                </g:form>
            </div>
            <div class="bodyRight">
                <ul>
                    %{--<li class="logOr"><span>OR</span></li>--}%
                    %{--<li class="login"><span>Login with</span></li>--}%
                    %{--<li class="social">--}%
                        %{--<span class="facebook"><i class="fa fa-facebook-square"></i></span>--}%
                        %{--<span class="google"><i class="fa fa-google-plus-square"></i></span>--}%
                    %{--</li>--}%
                    <li class="logNoAcc">Dont have an account?<a href="#registerBox"><span class="logRegHere"> Register Here</span></a></li>
                </ul>
               </div>
        </div>
    </div>
</div>
<div id="registerBox">
    <div id="registerMask"></div>
    <div class="register">
        <div class="heading">
            <span class="head">User registration</span>
            <span class="registerClose">x</span>
        </div>
        <div class="registerBody">
            <g:form role="form" action="createCustomer" controller="customer" method="post" class="registration-form">
                <fieldset class="textbox">
                        <ul>
                            <li class="message">
                                <span class="big">Welcome to the shop</span>
                                <span class="small">Hello user, please fill up the form with the correct details, so we can track your location for the order delivery..</span>
                            </li>
                            <li><g:select name="title" from="${Title.values()}" class="title"/></li>
                            <li class="firstName gap"><input id="firstName" name="firstName" value="" type="text" placeholder="First Name"></li>
                            <li class="lastName gap"> <input id="lastName" name="lastName" value="" type="text" placeholder="Last Name"></li>
                            <li class="email gap"><input id="email" name="email" value="" type="text" placeholder="Email Address"></li>
                            <li class="userName gap"><input id="uname" name="username" value="" type="text" placeholder="Username"></li>
                            <li class="password gap"><input id="password" name="password" value="" type="password" placeholder="Password"></li>
                            <li class="passConfirm gap"><input id="confirm_pwd" name="confirm_pwd" value="" type="password" placeholder="Confirm Password" onkeyup="checkPass(); return false;"></li>
                            <span id="confirmMessage" class="confirmMessage"></span>
                            <li><g:select name="country" from="${Country.values()}" class="country"/></li>
                            <li class="contact"><input id="contact" name="contact" value="" type="number" placeholder="Contact no."></li>
                            <li class="button"><span><g:submitButton name="register" value="Register" class="btnRegister"/></span></li>
                            <li class="haveAccount"><span class="haveAcc">Already have an account.</span></li>
                        </ul>

                </fieldset>
            </g:form>
        </div>
    </div>
</div>
%{--<div id="newlogin-box" class="login-popup1">--}%
    %{--<div class="btn_close1">x</div>--}%

    %{--<h1>you are welcome</h1>--}%

    %{--<p>Please use a valid email address for secure purchase. Enjoy shopping and provide feedbacks on your experience.</p>--}%

    %{--<g:form role="form" action="createCustomer" controller="customer" method="post" class="registration-form">--}%
        %{--<fieldset class="textbox">--}%
            %{--<g:select name="title" from="${Title.values()}"/>--}%
            %{--<input id="firstName" name="firstName" value="" type="text" placeholder="First Name">--}%
            %{--<input id="lastName" name="lastName" value="" type="text" placeholder="Last Name">--}%
            %{--<input id="email" name="email" value="" type="text" placeholder="Email Address">--}%
            %{--<input id="uname" name="username" value="" type="text" placeholder="Username">--}%
            %{--<input id="password" name="password" value="" type="password" placeholder="Password">--}%
            %{--<input id="confirm_pwd" name="confirm_pwd" value="" type="password" placeholder="Confirm Password" onkeyup="checkPass(); return false;">--}%
            %{-- <span id="confirmMessage" class="confirmMessage"></span>--}%
            %{--<input id="address" name="address" value="" type="text" placeholder="Address">--}%
            %{--<g:select name="country" from="${Country.values()}"/>--}%
            %{--<input id="contact" name="contact" value="" type="number" placeholder="Contact no.">--}%
            %{--<button type="button">Register</button>--}%
            %{--<g:submitButton name="register" value="Register"/>--}%
        %{--</fieldset>--}%

    %{--</g:form>--}%

%{--</div>--}%

<script>
    function checkPass()
    {
        //Store the password field objects into variables ...
        var pass1 = document.getElementById('password');
        var pass2 = document.getElementById('confirm_pwd');
        //Store the Confimation Message Object ...
        var message = document.getElementById('confirmMessage');
        //Set the colors we will be using ...
        var goodColor = "#66cc66";
        var badColor = "#ff6666";
        //Compare the values in the password field
        //and the confirmation field
        if(pass1.value == pass2.value){
            //The passwords match.
            //Set the color to the good color and inform
            //the user that they have entered the correct password
            pass2.style.backgroundColor = goodColor;
            message.style.color = goodColor;
            message.innerHTML = "Passwords Match!"
        }else{
            //The passwords do not match.
            //Set the color to the bad color and
            //notify the user.
            pass2.style.backgroundColor = badColor;
            message.style.color = badColor;
            message.innerHTML = "Passwords Do Not Match!"
        }
    }

</script>

<script>
  function loginCheck(){
//       var $uname=$('#loginBox .logBody .bodyLeft .email input').attr('value');
//        var $pass=$('#loginBox .logBody .bodyLeft .logPwd input').attr('value');
        $.ajax({
                    type:"post",
//                    data:{username:$uname,password:$pass},
                    url: ${g.createLink(controller:'customer',action:'userCheck')},
                    success : function(data) {
                        if (data == "valid") {
                            console.log("valid user")
                        }
                        else if(data == "invalid")
                        {
                            console.log("invalid user")
                        }

                    }s

                }
        );
    }
</script>