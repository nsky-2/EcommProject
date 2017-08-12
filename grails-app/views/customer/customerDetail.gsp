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
<div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#">Addons pages</a> <a href="#" class="current">invoice</a> </div>
<h1>Invoice</h1>
</div>
<div class="container-fluid"><hr>
    <div class="row-fluid">
        <div class="span12">
            <div class="widget-box">
                <div class="widget-title"> <span class="icon"> <i class="icon-briefcase"></i> </span>
                    <h5 >Customer Details</h5>
                </div>
                <div class="widget-content">
                    <div class="row-fluid">
                        <div class="span6">
                            <table class="">
                                <tbody>
                                <tr>
                                    <td><h4>Address Details</h4></td>
                                </tr>
                                <tr>
                                    <td>${customer?.address}</td>
                                </tr>
                                <tr>
                                    <td>${customer?.city},${customer?.state}</td>
                                </tr>
                                <tr>
                                    <td>${customer?.postalCode}</td>
                                </tr>
                                <tr>
                                    <td >${customer?.country}</td>
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
                                    <td class="width70"><strong>${customer?.fullName}</strong></td>
                                </tr>
                                <tr>
                                    <td>Contact No.:</td>
                                    <td><strong>${customer?.phone}</strong></td>
                                </tr>
                                <tr>
                                    <td>Email ID:</td>
                                    <td><strong>${customer?.email}</strong></td>
                                </tr>
                                <td class="width30">Username</td>
                                <td><strong>${customer?.username}</strong></td>

                                </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>