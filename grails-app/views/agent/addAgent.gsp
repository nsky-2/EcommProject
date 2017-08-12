<%@ page import="HMEcomm.Country" contentType="text/html;charset=UTF-8" %>
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
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom">Add Agent</a></div>

    <h1>New Agent</h1>
</div>

<!--End-breadcrumbs-->
<div class="container-fluid">
    <hr>
    <div class="row-fluid">
        <div class="span2">
        </div>
        <div class="span8">
            %{--<div class="widget-box">--}%
            <g:form action="createAgent" method="post" params="[agentId:agent?.id]">
                <div class="widget-title">
                    <h4>General Information</h4>
                </div>
                <div class="widget-content nopadding">
                    <div class="control-group">
                        <label for="normal" class="control-label">First Name</label>
                        <div class="controls">
                            <input type="text" id="mask-firstName" class="span8 mask text" name="firstName" value="${agent?.firstName}">
                        </div>
                    </div>

                        <div class="control-group">
                            <label for="normal" class="control-label">Last Name</label>
                            <div class="controls">
                                <input type="text" id="mask-lastName" class="span8 mask text" name="lastName" value="${agent?.lastName}">
                            </div>
                        </div>

                        <div class="control-group">
                            <label for="normal" class="control-label">Contact Number</label>
                            <div class="controls">
                                <input type="text" id="mask-phoneExt" class="span8 mask text" name="contactNo" value="${agent?.contactNo}">
                            </div>
                        </div>
                    <div class="control-group">
                        <label for="normal" class="control-label">Email ID</label>
                        <div class="controls">
                            <input type="email" id="mask-email" class="span8 mask text" name="email" value="${agent?.emailID}">
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="normal" class="control-label">Username</label>
                        <div class="controls">
                            <input type="text" id="mask-username" class="span8 mask text" name="username" value="${agent?.username}">
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="normal" class="control-label">Password</label>
                        <div class="controls">
                            <input type="password" id="mask-password" class="span8 mask text" name="password" value="${agent?.password}" readonly>
                        </div>
                    </div>

                    </div>

                <div class="widget-title">
                    <h4>Address Information</h4>
                </div>
                <div class="widget-content nopadding">
                    <div class="control-group">
                        <label for="normal" class="control-label">Address</label>
                        <div class="controls">
                            <input type="text" id="mask-address" class="span8 mask text" name="address" value="${agent?.address}">
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="normal" class="control-label">City</label>
                        <div class="controls">
                            <input type="text" id="mask-city" class="span8 mask text" name="city" value="${agent?.city}">
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="normal" class="control-label">State</label>
                        <div class="controls">
                            <input type="text" id="mask-state" class="span8 mask text" name="state" value="${agent?.state}">
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="normal" class="control-label">Country</label>
                        <div class="controls">
                            <g:select name="country" id="mask-country" class="span8 mask text" from="${Country.values()}" value="${agent?.country}"/>

                        </div>
                    </div>
                    <div class="control-group">
                        <label for="normal" class="control-label">Postal Code </label>
                        <div class="controls">
                            <input type="text" id="mask-postalCode" class="span8 mask text" name="postalCode" value="${agent?.postalCode}">
                        </div>
                    </div>


                </div>



                        <div class="form-actions">
                            <div class="span9">
                            </div>
                            <button type="submit" class="btn btn-success">Save</button>
                            <a href="${createLink(controller: 'agent',action: 'viewAgent')}" class="btn btn-danger">Cancel</a>
                        </div>
            </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!--Footer-part-->

</body>
</html>
