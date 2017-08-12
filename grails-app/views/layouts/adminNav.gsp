<%@ page import="HMEcomm.Reviews; HMEcomm.OrderPlaced" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Matrix Admin</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${request.contextPath}/themesadmin/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${request.contextPath}/themesadmin/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="${request.contextPath}/themesadmin/css/fullcalendar.css" />
    <link rel="stylesheet" href="${request.contextPath}/themesadmin/css/adminStyles.css" />
    <link rel="stylesheet" href="${request.contextPath}/themesadmin/css/matrix-media.css" />
    <link rel="stylesheet" href="${request.contextPath}/ecommThemes/css/dataTable.css" />

    <link href="${request.contextPath}/themesadmin/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="${request.contextPath}/themesadmin/css/jquery.gritter.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
    <link href="${request.contextPath}/themesadmin/css/userProfile.css" rel="stylesheet" type="text/css"/>

    <script src="${request.contextPath}/themesadmin/js/jquery.min.js"></script>
    <script src="${request.contextPath}/themesadmin/js/jquery.js"></script>

    <link href="${request.contextPath}/themesadmin/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <g:layoutHead/>
</head>

<body>

<!--Header-part-->
<div id="header">
    <h1><a href="${createLink(controller: 'admin', action: 'adminMain')}"><img
            src="${request.contextPath}/ecommThemes/images/logoMain.png" alt=""/></a></h1>
</div>
<!--close-Header-part-->


<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav">

        <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome User</span><b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a href="${createLink(controller: 'admin',action: 'profile')}"><i class="icon-user"></i> My Profile</a></li>
                <li class="divider"></li>
                <li><a href="${createLink(controller: 'admin',action: 'logout')}"><i class="icon-key"></i> Log Out</a></li>
            </ul>
        </li>
        %{--<li class=""><a title="" href="#"><i class="icon icon-envelope"></i> <span class="text">Messages</span></a></li>--}%
        %{--<li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>--}%
        <li class=""><a title="" href="${createLink(controller: 'admin',action: 'logout')}"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
    </ul>
</div>
<!--close-top-Header-menu-->
<!--start-top-serch-->
<div id="search">
    <input type="text" placeholder="Search here..."/>
    <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>

<!--close-top-search-->
<!--sidebar-menu-->
<div id="sidebar"><a href="${createLink(controller: 'admin', action: 'adminMain')}" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
    <ul>
        <g:if test="${session?.user.role=='ADMIN'}">
            <%
                def order=OrderPlaced.findAllByStatusAndIsDeleted("Pending",false)
                def numberOfOrders=order.size()

                def reviews=Reviews.findAllByStatus("NotApproved")
                def noOfReviews=reviews?.size()
            %>
        <li class="active"><a href="${createLink(controller: 'admin', action: 'adminMain')}"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
        <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>Category</span> </a>
            <ul>
                <li><a href="${createLink(controller: 'category', action: 'viewCategory')}">Main Category</a></li>
                <li><a href="${createLink(controller: 'subCategory',action: 'viewSubCategory')}">Sub-Category</a></li>
            </ul>
        </li>
        %{--<li><a href="#"><i class="icon icon-tint"></i> <span>Buttons &amp; icons</span></a></li>--}%
        <li><a href="${createLink(controller: 'product',action: 'viewProduct')}"><i class="icon icon-star"></i> <span>All Product</span></a></li>
        <li><a href="${createLink(controller: 'slider',action: 'sliderView')}"><i class="icon icon-picture"></i> <span>Slider Image</span></a></li>
        <li><a href="${createLink(controller: 'customer',action: 'viewCustomer')}"><i class="icon icon-user"></i> <span>Customer</span></a></li>
        <li><a href="${createLink(controller: 'agent',action: 'viewAgent')}"><i class="icon icon-user-md"></i> <span>Agent</span></a></li>
        <li class='submenu'><a href="#"><i class="icon icon-money"></i> <span>Order </span><span class="label label-important">${numberOfOrders}</span></a>
        <ul>
            <li><a href="${createLink(controller: 'order', action: 'newOrders')}">New Orders</a></li>
            <li><a href="${createLink(controller: 'order',action: 'viewAllOrders')}">All Orders</a></li>
        </ul>
        </li>
            <li class='submenu'><a href="#"><i class="icon icon-money"></i> <span>Reviews </span><span class="label label-important">${noOfReviews}</span></a>
                <ul>
                    <li><a href="${createLink(controller: 'review', action: 'reviewList')}">New Reviews</a></li>
                    <li><a href="${createLink(controller: 'review',action: 'allReviewList')}">All Reviews</a></li>
                </ul>
            </li>

        %{--<li><a href="${createLink(controller: 'product',action: 'viewProduct')}"><i class="icon icon-comment"></i> <span>Comments and Reviews</span></a></li>--}%
        </g:if>
        <g:elseif test="${session?.user.role=='AGENT'}">
           <% def orders=OrderPlaced.findAllByUserAndStatusAndIsDeleted(session?.user,"Processing",false)
             def numberOfOrder=order.size()%>

            <li class="active"><a href="${createLink(controller: 'agent', action: 'agentMain')}"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
            <li><a href="${createLink(controller: 'agent',action: 'newTask')}"><i class="icon icon-tasks"></i> <span>New Tasks</span><span class="label label-important">${numberOfOrder}</span></a></li>
            <li><a href="${createLink(controller: 'agent',action: 'taskHistory')}"><i class="icon icon-time"></i> <span>Tasks History</span></a></li>

        </g:elseif>





    </ul>
</div>
<!--sidebar-menu-->

<div id="content">
    <g:layoutBody/>
</div>

<!--Footer-part-->
<div class="row-fluid">
    <div id="footer" class="span12"> 2017 &copy; Himalayan Minerals. </div>
</div>

<!--end-Footer-part-->

<script src="${request.contextPath}/themesadmin/js/excanvas.min.js"></script>
<script src="${request.contextPath}/themesadmin/js/jquery.min.js"></script>
<script src="${request.contextPath}/themesadmin/js/jquery.ui.custom.js"></script>
<script src="${request.contextPath}/themesadmin/js/bootstrap.min.js"></script>
<script src="${request.contextPath}/themesadmin/js/jquery.flot.min.js"></script>
<script src="${request.contextPath}/themesadmin/js/jquery.flot.resize.min.js"></script>
<script src="${request.contextPath}/themesadmin/js/jquery.peity.min.js"></script>
<script src="${request.contextPath}/themesadmin/js/fullcalendar.min.js"></script>
<script src="${request.contextPath}/themesadmin/js/matrix.js"></script>
<script src="${request.contextPath}/themesadmin/js/matrix.dashboard.js"></script>
<script src="${request.contextPath}/themesadmin/js/jquery.gritter.min.js"></script>
<script src="${request.contextPath}/themesadmin/js/matrix.interface.js"></script>
<script src="${request.contextPath}/themesadmin/js/matrix.chat.js"></script>
<script src="${request.contextPath}/themesadmin/js/jquery.validate.js"></script>
<script src="${request.contextPath}/themesadmin/js/matrix.form_validation.js"></script>
<script src="${request.contextPath}/themesadmin/js/jquery.wizard.js"></script>
<script src="${request.contextPath}/themesadmin/js/jquery.uniform.js"></script>
<script src="${request.contextPath}/themesadmin/js/select2.min.js"></script>
<script src="${request.contextPath}/themesadmin/js/matrix.popover.js"></script>
<script src="${request.contextPath}/themesadmin/js/jquery.dataTables.min.js"></script>
<script src="${request.contextPath}/themesadmin/js/matrix.tables.js"></script>
<script src="${request.contextPath}/themesadmin/js/dataTable.js"></script>


<script type="text/javascript">
    // This function is called from the pop-up menus to transfer to
    // a different page. Ignore if the value returned is a null string:
    function goPage (newURL) {

        // if url is empty, skip the menu dividers and reset the menu selection to default
        if (newURL != "") {

            // if url is "-", it is this page -- reset the menu:
            if (newURL == "-" ) {
                resetMenu();
            }
            // else, send page to designated URL
            else {
                document.location.href = newURL;
            }
        }
    }

    // resets the menu selection upon entry to this page:
    function resetMenu() {
        document.gomenu.selector.selectedIndex = 2;
    }
</script>
<r:layoutResources/>
</body>
</html>
