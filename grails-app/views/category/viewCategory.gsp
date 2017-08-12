<%--
  Created by IntelliJ IDEA.
  User: sumit
  Date: 2/13/2017
  Time: 6:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminNav"/>
    <title></title>
</head>

<body>

    <!--main-container-part-->
    %{--<div id="content">--}%
        <!--breadcrumbs-->
        <div id="content-header">
            <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom">View Category</a></div>

            <h1>View Category</h1>
        </div>

        <!--End-breadcrumbs-->
    <div class="widget-content nopadding">
    <table class="table" id="allCategoryList">
        <thead>
    <tr>
        <th> Code</th>
        <th> Name</th>
        <th>Description</th>
        <th>Action</th>
    </tr>
        </thead>
        <tbody>
        <g:each in="${(category)}" status="i" var="cat">
            <tr>
            <td>${(cat.code)}</td>
            <td>${(cat.name)}</td>
            <td>${cat.description}</td>
            <td><a href="${createLink(controller:'category' ,action:'updateCategory',params: [categoryID:cat.id ])}">Edit</a> / <a href="${createLink(controller:'category' ,action:'deleteCategory',params: [categoryID:cat.id ])}">Delete</a> </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    </div>
<script>
    $(document).ready(function(){
        $('#allCategoryList').DataTable();
    });
</script>

</body>
</html>