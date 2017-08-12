<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Form</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="${request.contextPath}/adminLogin/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${request.contextPath}/adminLogin/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${request.contextPath}/adminLogin/assets/css/form-elements.css">
    <link rel="stylesheet" href="${request.contextPath}/adminLogin/assets/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="${request.contextPath}/assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${request.contextPath}/adminLogin/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${request.contextPath}/adminLogin/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${request.contextPath}/adminLogin/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${request.contextPath}/adminLogin/assets/ico/apple-touch-icon-57-precomposed.png">

</head>

<body>
<br>
<br>

<div class="row">
    <div class="col-sm-4 col-sm-offset-4 form-box">
        <div class="form-top">
            <div class="form-top-left">
                <g:if test="${access == "false"}">
                    <p style="color: red;">Invalid username or password.</p>
                </g:if>
                <h3>Login</h3>
                <p>Enter your username and password to log on:</p>
            </div>
            <div class="form-top-right">
                <i class="fa fa-key"></i>
            </div>
        </div>
        <div class="form-bottom">
            <g:form role="form" controller="admin" action="validateUser"  method="post" class="login-form">
                <div class="form-group">
                    <label class="sr-only" for="form-username">Username</label>
                    <input type="text" name="username" placeholder="Username..." class="form-username form-control" id="form-username">
                </div>
                <div class="form-group">
                    <label class="sr-only" for="form-password">Password</label>
                    <input type="password" name="password" placeholder="Password..." class="form-password form-control" id="form-password">
                </div>
                <button type="submit" class="btn">Sign in!</button>
           </g:form>
        </div>
    </div>
</div>



<!-- Javascript -->
<script src="${request.contextPath}/adminLogin/assets/js/jquery-1.11.1.min.js"></script>
<script src="${request.contextPath}/adminLogin/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${request.contextPath}/adminLogin/assets/js/jquery.backstretch.min.js"></script>
<script src="${request.contextPath}/adminLogin/assets/js/scripts.js"></script>

<!--[if lt IE 10]>
            <script src="${request.contextPath}/adminLogin/assets/js/placeholder.js"></script>
        <![endif]-->

</body>

</html>