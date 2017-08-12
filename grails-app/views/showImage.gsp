<%--
  Created by IntelliJ IDEA.
  User: sumit
  Date: 2/16/2017
  Time: 9:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:uploadForm action="upload" controller="admin"/>

    Photo: <input name="photo" type="file" />
    <g:submitButton name="upload" value="Upload"/>

</body>
</html>