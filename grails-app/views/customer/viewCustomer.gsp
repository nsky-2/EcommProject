<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminNav"/>
    <title></title>
</head>

<body>


<div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Customer List</a> </div>
    <h1>Customer List</h1>
</div>

                <div class="widget-content nopadding">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>S.No.</th>
                            <th> Name</th>
                            <th>Email ID</th>
                            <th>Contact No.</th>
                            <th>Country</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${customer}" status="i" var="buyer">
                            <tr>
                                <td>${i+1}</td>
                                <td><a href="${createLink(controller: 'customer',action: 'customerDetail', params: [customerId:buyer?.id])}"> ${buyer?.fullName}</a></td>
                                <td>${buyer?.email}</td>
                                <td>${buyer?.phone}</td>
                                <td>${buyer?.country}</td>
                            </tr>
                        </g:each>

                        </tbody>
                    </table>
                </div>


</body>
</html>