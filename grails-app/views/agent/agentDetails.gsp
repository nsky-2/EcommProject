<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminNav"/>
    <title></title>
</head>
<body>
<div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom">Agent Details</a></div>

    <h1>Agent Details</h1>
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
                        <h4> General Information</h4>
                    </div>
                    <div class="widget-content nopadding">
                        <div>
                            <ul>
                                <li><span>Name </span>: ${agent?.fullName}</li>
                                <li><span>Email </span>: ${agent?.emailID}</li>
                                <li><span>Contact </span>: ${agent?.contactNo}</li>
                                <li><span>Username </span>: ${agent?.username}</li>
                            </ul>
                        </div>
                    </div>

                    <div class="widget-title">
                        <h4> Address Information</h4>
                    </div>
                    <div class="widget-content nopadding">
                        <div>
                            <ul>
                                <li><span>Address </span>: ${agent?.address}</li>
                                <li><span>City </span>: ${agent?.city}</li>
                                <li><span>State </span>: ${agent?.state}</li>
                                <li><span>Country </span>: ${agent?.country}</li>
                                <li><span>Postal Code </span>: ${agent?.postalCode}</li>
                            </ul>
                        </div>
                    </div>

                            <div class="form-actions">
                                <div class="span9">
                                </div>
                                <a href="${createLink(controller: 'agent', action: 'addAgent', params: [agentId:agent?.id])}" class="btn btn-success">Edit</a>
                                <a href="${createLink(controller: 'agent',action: 'viewAgent')}" class="btn btn-warning">Mail</a>
                                <a href="${createLink(controller: 'agent',action: 'viewAgent')}" class="btn btn-danger">Back</a>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>