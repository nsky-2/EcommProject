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
        <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom">View Sub-Category</a></div>

        <h1>View Sub-Category</h1>
    </div>

    <!--End-breadcrumbs-->
    %{--<div class="widget-box">--}%
        %{--<div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>--}%
            %{--<h5>Sub-Categories</h5>--}%
        %{--</div>--}%
    <div class="widget-content nopadding">
        <table class="table table-bordered data-table">
            <thead>
            <tr>
                <th> Code</th>
                <th> Name</th>
                <th>Description</th>
                <th>Category</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>

            </tr>
            </tbody>
            <g:each in="${(subCategory)}" status="i" var="subcat">
                <tr>
                    <td>${(subcat?.code)}</td>
                    <td>${(subcat?.name)}</td>
                    <td>${subcat.description}</td>
                        <td>${subcat?.category?.name}</td>
                    <td><a href="${createLink(controller:'subCategory' ,action:'updateSubCategory',params: [SubCategoryID:subcat?.id ])}">Edit</a> / <a href="${createLink(controller:'subCategory' ,action:'deleteSubCategory',params: [SubCategoryID:subcat?.id ])}">Delete</a> </td>
                </tr>
            </g:each>
        </table>
    </div>
</body>
</html>