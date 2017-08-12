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
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom">New Tasks</a></div>

    <h1>Task List</h1>
</div>

<br>
<br>


<!--End-breadcrumbs-->
<div class="widget-content nopadding">
    <table class="table table-bordered data-table">
        <thead>
        <tr>
            <th>Order ID</th>
            <th> Status</th>
            <th>Ordered Date</th>
            <th>Customer</th>
            <th>Email ID</th>
            %{--<th>Total</th>--}%
            <th>Tracking ID</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${order}" status="i" var="ordered">
            <tr>
                <td><a href="${createLink(controller:'order',action:'itemsInOrderList' )}" >${ordered?.OrderID}</a></td>
                <td>${ordered?.status}</td>
                <td>${ordered?.orderedPlacedDate}</td>
                <td>${ordered?.customer?.fullName}</td>
                <td>${ordered?.customer?.email}</td>
                <td>${ordered?.trackingID}</td>
                <td><a href="${createLink(controller: 'agent', action:'changeStatus' , params: [orderId:ordered?.id])}" ><i class="icon icon-pencil"></i></a></td>
            </tr>
        </g:each>

        </tbody>


    </table>
</div>
</body>
</html>