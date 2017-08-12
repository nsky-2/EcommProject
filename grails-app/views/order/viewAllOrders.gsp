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
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom">Orders List</a></div>

    <h1>Order List</h1>
</div>

<br>
<br>


<!--End-breadcrumbs-->
<div class="widget-content nopadding">
    <table class="table" id="orderList">
        <thead>
        <tr>
            <th>Order ID</th>
            <th> Status</th>
            <th>Ordered Date</th>
            <th>Customer</th>
            %{--<th>Email ID</th>--}%
            %{--<th>Total</th>--}%
            <th>Agent</th>
            <th>Tracking ID</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${orderedAll}" status="i" var="ordered">
            <tr>
                <td><a href="${createLink(controller:'order',action:'itemsInOrderList' )}" >${ordered?.OrderID}</a></td>
                <td>${ordered?.status}</td>
                <td>${ordered?.orderedPlacedDate}</td>
                <td>${ordered?.customer?.fullName}</td>
                %{--<td>${ordered?.customer?.email}</td>--}%
                <td>
                ${ordered?.user?.fullName}
                %{--<g:if test="${ordered?.status}=='Pending'">--}%
                    %{--Not Assigned--}%
                %{--</g:if>--}%
                %{--<g:else>--}%
                    %{--${ordered?.user?.fullName}--}%
                %{--</g:else>--}%
                </td>
                <td>${ordered?.trackingID}</td>
                <td><a href="${createLink(controller: 'order', action:'detailsForAgentSelection' , params: [orderId:ordered?.id])}" ><i class="icon icon-pencil"></i></a></td>
            </tr>
        </g:each>

        </tbody>


    </table>
</div>

<script>
    $(document).ready(function(){
        $('#orderList').DataTable();
    });
</script>

</body>
</html>