<%--
  Created by IntelliJ IDEA.
  User: sumit
  Date: 7/5/2017
  Time: 10:34 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminNav"/>

    <title></title>
</head>

<body>
<div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#">Profile</a> </div>
    <h1>Profile</h1>
</div>
<div class="container-fluid"><hr>
    <div class="row-fluid">
        <div class="span12">
            <div class="widget-box">
                <div class="widget-title"> <span class="icon"> <i class="icon-briefcase"></i> </span>
                    <h5 >User Details</h5>
                </div>
                <div class="widget-content">
                    <div class="row-fluid">
                        <div class="span6">
                            <table class="">
                                <tbody>
                                <tr>
                                    <td><h4>Address Information</h4></td>
                                </tr>
                                <tr>
                                    <td>${user?.address}</td>
                                </tr>
                                <tr>
                                    <td>${user?.city},${user?.state}</td>
                                </tr>
                                <tr>
                                    <td>${user?.postalCode}</td>
                                </tr>
                                <tr>
                                    <td >${user?.country}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="span6">
                            <table class="table table-bordered table-invoice">
                                <tbody>
                                <tr>
                                <tr>
                                    <td class="width30">Name:</td>
                                    <td class="width70"><strong>${user?.fullName}</strong></td>
                                </tr>
                                <tr>
                                    <td>Contact No.:</td>
                                    <td><strong>${user?.contactNo}</strong></td>
                                </tr>
                                <tr>
                                    <td>Email ID:</td>
                                    <td><strong>${user?.emailID}</strong></td>
                                </tr>
                                <td class="width30">Username</td>
                                <td><strong>${user?.username}</strong></td>

                                </tr>
                                <tr>
                                    <td>Password</td>
                                    <td><strong>${user?.password}</strong></td>
                                </tr>
                                </tbody>

                            </table>
                            <div class="pull-right">
                                <a class="btn btn-primary btn-large pull-right" href="${createLink(controller: 'admin',action: 'editProfile', params: [userId:user?.id])}">Edit</a> </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>