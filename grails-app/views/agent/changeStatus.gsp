<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminNav"/>
    <title></title>
</head>
<body>
<div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom">Orders List</a></div>

    <h1>Order List</h1>
</div>
<div class="container-fluid">
    <hr>
    <div class="row-fluid">
        <div class="span2">
        </div>
        <div class="span8">
            <div class="widget-box">
                <div class="widget-box">
                    <div class="widget-title">
                        <h4> User Details</h4>
                    </div>
                    <div class="widget-content nopadding">
                        <div>
                            <ul>
                                <li><span>Name </span>: ${order?.customer?.fullName}</li>
                                <li><span>Email </span>: ${order?.customer?.email}</li>
                                <li><span>Contact </span>: ${order?.customer?.phone}</li>
                                <li><span>Username </span>: ${order?.customer?.username}</li>
                            </ul>
                        </div>
                    </div>

                    <div class="widget-title">
                        <h4> Address Information</h4>
                    </div>
                    <div class="widget-content nopadding">
                        <div>
                            <ul>
                                <li><span>Address </span>: ${order?.customer?.address}</li>
                                <li><span>City </span>: ${order?.customer?.city}</li>
                                <li><span>State </span>: ${order?.customer?.state}</li>
                                <li><span>Country </span>: ${order?.customer?.country}</li>
                                <li><span>Postal Code </span>: ${order?.customer?.postalCode}</li>
                            </ul>
                        </div>
                    </div>

                    <div class="widget-title">
                        <h4> Order Information</h4>
                    </div>
                    <div class="widget-content nopadding">
                        <div>
                            <ul>
                                <li><span>Order ID </span>: ${order?.OrderID}</li>
                                <li><span>Ordered Date </span>: ${order?.orderedPlacedDate}</li>
                                %{--<li><span>Status </span>: ${order?.status}</li>--}%
                                <li><span>Tracking ID </span>: ${order?.trackingID}</li>
                            </ul>
                        </div>
                    </div>

                    <div class="widget-title">
                        <h4>Status</h4>
                    </div>
                    <div class="widget-content nopadding">
                        <g:form controller="order" action="changesMadeInTheStatus" class="form-horizontal" params="[orderId:order?.id]">

                            <div class="control-group">
                                <label for="normal" class="control-label">Status</label>
                                <div class="controls">
                                    <g:select name="status"  from="${Status}" class="form-control"></g:select>
                                </div>
                            </div>

                            <div class="form-actions">
                                <div class="span9">
                                </div>
                                <button type="submit" class="btn btn-success">Save</button>
                                <a href="${createLink(controller: 'agent',action: 'taskHistory')}" class="btn btn-danger">Back</a>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>