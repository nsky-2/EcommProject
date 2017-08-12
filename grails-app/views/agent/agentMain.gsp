<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="adminNav"/>
    <title></title>
</head>
<body>

<!--main-container-part-->
%{--<div id="content">--}%
<!--breadcrumbs-->
<div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
</div>
<!--End-breadcrumbs-->

<!--Action boxes-->
<div class="container-fluid">
    <div class="quick-actions_homepage">
        <ul class="quick-actions">

            <li class="bg_ly span3"> <a href="${createLink(controller: 'agent',action: 'newTask')}"> <i class="icon-tasks"></i> New Tasks<span class="label label-important">${numberOfOrders}</span></a> </li>
            <li class="bg_lv span2"> <a href="${createLink(controller: 'agent',action: 'taskHistory')}"> <i class="icon-time"></i> Task History</a> </li>



            %{--<li class="bg_lh "> <a href="${createLink(controller: 'agent', action: 'addAgent')}" data-toggle="modal"> <i class="icon-user"></i>Add Agent</a> </li>--}%
            %{--<li class="bg_lb span3 "> <a href="${createLink(controller: 'order', action: 'newOrders')}" data-toggle="modal"> <i class="icon-money"></i>New Orders <span style="color: red; border: solid; border-color: red; "> ${numberOfOrders}</span></a> </li>--}%
</ul>
    </div>
</div>
</div>

<!--End-Action boxes-->




</body>
</html>
