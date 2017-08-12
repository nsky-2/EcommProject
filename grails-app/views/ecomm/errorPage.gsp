<DOCTYPE html!>
<head>
	<title>Header</title>
	<link href="${request.contextPath}/ecommThemes/css/error.css" rel="stylesheet" type="text/css"/>
	
	
	<script src="${request.contextPath}/ecommThemes/js/jquery.min.js"></script>
	<link href="${request.contextPath}/ecommThemes/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	
</head>
<body>
<div id="error">
	<span class="icon"><i class="fa fa-frown-o"></i></span>
	<span class="oops">oops!</span>
	<span class="message">The content you are searching for is currently unavailable.</span>

	<span class="btn"><a href="${createLink(controller: 'ecomm',action: 'whereToGo')}" class="btnbtn">Back to home</a></span>
</div>

</body>
</html>