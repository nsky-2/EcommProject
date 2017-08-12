<!DOCTYPE html>
<%@ page import="HMEcomm.Country; HMEcomm.Title" %>
<html>
<head>
    <meta name="layout" content="finalSidebar"/>
    <title> Store </title>
</head>
<body>
<div id="mainBody">
    <div id="breadcrumbs"><span class="home">Home</span> <span class="icon"><i class="fa fa-angle-double-right"></i> </span> <span class="first">My Account</span></div>
    <div id="tabName">Profile & Settings</div>
    <div id="tabBody">
        <ul class="tabHeader">
            <li class="active" rel="tab1" title="Profile & Settings">Profile & Settings</li>
            <li rel="tab2" title="Address Information">Address Info</li>
            <li rel="tab3" title="Order History">Order History</li>
            <li rel="tab4" title="Track Order">Track Order</li>
            <li rel="tab5" title="Contact Us">Contact Us</li>
        </ul>
        <div class="tab active" id="tab1" >
            <div id="personalInfo">
                <div class="header"><span>Account Information</span></div>
                <g:if test="${access == "false"}">
                    Your previous password did not match. Please try again
                </g:if>
                <g:if test="${session?.user}">
                    <ul class="info">
                        <li><span class="name">First Name : </span><span class="tag">${customer?.firstName}</span></li>
                        <li><span class="name">Last Name : </span><span class="tag">${customer?.lastName}</span></li>
                        <li><span class="name">E-mail Address : </span><span class="tag">${customer?.email}</span></li>
                        <li><span class="name">Username : </span><span class="tag">${customer?.username}</span></li>
                        <li><span class="name">Country : </span><span class="tag">${customer?.country}</span></li>
                        <li><span class="name">Contact No. : </span><span class="tag">${customer?.phone}</span></li>
                    </ul>
                </g:if>
                <div class="editTab">
                    <span class="edit"><a href="#">Edit</a></span>
                    <span>|</span>
                    <span class="changePwd"><a href="#changePassword">Change Password</a></span>
                </div>
            </div>

            <div id="editPersonalInfo">
                <div class="header"><span>Edit Personal Information</span></div>
                <g:form role="form" controller="customer" action="editPersonalInfo" method="post" params="[customerId: customer?.id]">
                <ul class="info">
                    <li><span class="name">First Name</span></li>
                    <li><span class="input"><input type="text" name="firstName" value="${customer?.firstName}"/> </span></li>
                    <li><span class="name">Last Name</span></li>
                    <li><span class="input"><input type="text" name="lastName" value="${customer?.lastName}"/> </span></li>
                    <li><span class="name">E-mail Address</span></li>
                    <li><span class="input"><input type="email" name="email" value="${customer?.email}"/> </span></li>
                    <li><span class="name">Username</span></li>
                    <li><span class="input"><input type="text" name="username" value="${customer?.username}"/> </span></li>
                    <li><span class="name">Country</span></li>
                    <li><span class="input"><g:select name="country" from="${Country.values()}" class="country" value="${customer?.country}"/> </span></li>
                    <li><span class="name">Contact No.</span></li>
                    <li><span class="input"><input type="number" name="phone" value="${customer?.phone}"/> </span></li>
                </ul>
                <div class="editTab">
                    <style>
                    .submitLink {
                    background-color: transparent;
                     /*text-decoration: underline;*/
                     border: none;
                     color: rgb(73, 132, 147);
                     cursor: pointer;}
                    </style>
                    <g:submitButton name="update" class="submitLink" value="Update"/>
                    </g:form>
                    <span>|</span>
                    <span class="changePwd">Cancel</span>
                </div>
            </div>

                <div id="changePassword">
                    <div class="header"><span>Change Password</span></div>
                <g:form role="form" controller="customer" action="changePassword" method="post" params="[customerId: customer?.id]">

                <ul class="info">
                        <li><span class="name">Old Password</span></li>
                        <li><span class="input"><input type="password" name="password"/> </span></li>
                        <li><span class="name">New Password</span></li>
                        <li><span class="input"><input id="passedword" type="password" name="newPassword"/> </span></li>
                        <li><span class="name">Confirm New Password</span></li>
                        <li><span class="input"><input id="confirmPassword" type="password" name="confirm_pwd" onkeyup="checkPass(); return false;"/> </span></li>
                        <span id="confirmMessage" class="confirmMessage"></span>
                </ul>
                    <div class="editTab">
                         <style>
                    .submitLink {
                    background-color: transparent;
                     /*text-decoration: underline;*/
                     border: none;
                     color: rgb(73, 132, 147);
                     cursor: pointer;
                    }
                    </style>
                    <g:submitButton name="change" class="submitLink" value="Change"/>
                </g:form>
                        <span>|</span>
                        <span class="changePwd">Cancel</span>
                    </div>
                </div>

        </div>
        <div class="tab" id="tab2" >
            <div class="addressInfo">
                <div class="header"><span>Your address detail</span></div>
                <ul class="info">
                    <li><span class="name">Country :</span><span class="tag">${customer?.country}</span></li>
                    <li><span class="name">State : </span><span class="tag">${customer?.state}</span></li>
                    <li><span class="name">City : </span><span class="tag">${customer?.city}</span></li>
                    <li><span class="name">Postal Code : </span><span class="tag">${customer?.postalCode}</span></li>
                    <li><span class="name">E-mail : </span><span class="tag">${customer?.email}</span></li>
                    <li><span class="name">Contact No. : </span><span class="tag">${customer?.phone}</span></li>
                </ul>
                <div class="message">This is your current shipping address. </div>
                <div class="changeAddress">Change my  address</div>
            </div>
            <div class="addressNew">
                <div class="header"><span>Change your current address</span></div>
            <g:form role="form" controller="customer" action="changeAddressInfo" method="post" params="[customerId: customer?.id]">

    <ul class="info">
                    <li><span class="name">Country</span></li>
                    <li><span class="input"><g:select name="country" from="${Country.values()}" class="country" value="${customer?.country}"/> </span></li>
                    <li><span class="name">State</span></li>
                    <li><span class="input"><input type="text" name="state" value="${customer?.state}"/> </span></li>
                    <li><span class="name">City</span></li>
                    <li><span class="input"><input type="text" name="city" value="${customer?.city}"/> </span></li>
                    <li><span class="name">Address</span></li>
                    <li><span class="input"><input type="text" name="address" value="${customer?.address}"/> </span></li>
                    <li><span class="name">Postal Code</span></li>
                    <li><span class="input"><input type="text" name="postalCode" value="${customer?.postalCode}"/> </span></li>
                    <li><span class="name">Email</span></li>
                    <li><span class="input"><input type="email" name="email" value="${customer?.email}"/> </span></li>
                    <li><span class="name">Contact No.</span></li>
                    <li><span class="input"><input type="number" name="phone" value="${customer?.phone}"/> </span></li>
                </ul>
                <div class="editTab">
                     <style>
                    .submitLink {
                    background-color: transparent;
                     /*text-decoration: underline;*/
                     border: none;
                     color: rgb(73, 132, 147);
                     cursor: pointer;
                    }
                    </style>
                <g:submitButton name="change" class="submitLink" value="Change"/>
                    </g:form>
                    <span>|</span>
                    <span class="changePwd">Cancel</span>
                </div>
            </div>
            <div class="infoMessage">
                <div class="innerBox">
                    Dear customer please provide the correct detail of your current residential address. This help us to ship your purchase to the correct location and avoid any lost of product during shipment.
                </div>
            </div>
         </div>
        <div class="tab" id="tab3">
        <g:if test="${order.size()== 0}">
            <div id="noOrderHistory">
                <div class="bodyMain">
                    <span><img src="${request.contextPath}/ecommThemes/images/sad.jpg"></span>
                    <div class="textBig">Sorry user</div>
                    <div class="textMid">Your order history is currently empty. </div>
                    <div class="textBot">Click below to shop more...</div>
                    <div class="btn"><a href="${createLink(controller: 'ecomm', action: 'initial')}"> <span>Continue Shopping</span></a></div>
                </div>
            </div>
        </g:if>
            <g:else>
            <div id="orderHistory">
                <div class="tableWrapper">
                    <table>
                        <tr>
                            <th class="id">S.N.</th>
                            <th class="orderId">OrderID</th>
                            <th>Status</th>
                            <th>Total</th>
                            <th class="agent">Agent</th>

                            <th class="delete">View Info.</th>
                        </tr>
                        <g:each in="${(order)}" var="ordered" status="i">
                            <tr>
                                <td class="id">${(i+1)}</td>
                                <td class="orderId"><a href="${createLink(controller: 'order', action: 'itemsInOrderList',params: [orderID:ordered?.id])}"> ${(ordered?.id)}</a></td>
                                <td>${(ordered?.status)}</td>
                                <td>Rs.${grandTotal}</td>
                                <td class="agent">${ordered?.user?.fullName?:'N/A' }</td>
                                <td class="delete">
                                    <a title="View Detail Info" class="info" href="${createLink(controller: 'order', action: 'itemsInOrderList',params: [orderID:ordered?.id])}"> <i class="fa fa-info"></i> </a>
                                </td>
                            </tr>
                        </g:each>
                    </table>
                </div>
            </div>
            </g:else>
            </div>

        <div class="tab" id="tab4" >
            <div class="trackOrder">
                <span><img src="${request.contextPath}/ecommThemes/images/orderTracking.jpg"></span>
                <div class="message">Track your order right now.</div>
                <div class="orderId"><span>Enter your Order Id</span><input type="text" placeholder="Order Id"/></div>
                <div class="orderId"><span>Mobile Number</span><input type="text" placeholder="+977 9845234234"/></div>
                <div class="btnTrack"><span>Track Now</span></div>
            </div>
        </div>
        <div class="tab" id="tab5" >
            <div class="contactUs">
                <div class="header"><span>Fill up the form below to contact us</span></div>
                <ul class="info">
                    <li><span class="name">Category</span></li>
                    <li><span class="input">
                        <select>
                            <option>--select--</option>
                            <option>Feedback</option>
                            <option>Complaint</option>
                            <option>Query</option>
                        </select> </span></li>
                    <li><span class="name">Subject</span></li>
                    <li><span class="input"><input type="text" placeholder="Enter a Subject"/> </span></li>
                    <li><span class="name">Message</span></li>
                    <li><span class="input"><textarea placeholder="Type Your Message"></textarea> </span></li>
                    <li class="button"><span class="btn">submit</span> </li>
                </ul>
            </div>
            <div class="infoMessage">
                <div class="innerBox">
                    Our Concierge staff would be glad to be of service. Please complete the email form below so that we can most efficiently address your question. We will make every effort to reply to your message within 24 hours.
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('#tabBody .changeAddress').click(function(){
            $('#tabBody .addressInfo').slideUp(300,function(){
                $('#tabBody .addressNew').slideDown(300);
            });
            $('#tabBody .addressNew .changePwd').click(function(){
                $('#tabBody .addressNew').slideUp(300,function(){
                    $('#tabBody .addressInfo').slideDown(300);
                });
            });
        });
    });

</script>
<script>
    $(document).ready(function(){
        $('#tabBody .tabHeader li').click(function(){
            $('#tabBody .tabHeader li.active').removeClass('active');
            $(this).addClass('active');
            var panelShow=$(this).attr('rel');
            var title=$(this).attr('title');
            $('#tabName').text(''+title);
            $('#tabBody .tab.active').slideUp(300,function(){
                $(this).removeClass('active');
                $('#' + panelShow).slideDown(300,function(){
                    $(this).addClass('active');
                });
            });
        });


        $('a[href$="#changePassword"]').click(function(){
            $('#changePassword').slideDown(300);
        });
        $('#changePassword .changePwd').click(function(){
            $('#changePassword').slideUp(300);
        });
        $('#changePassword .edit').click(function(){
            $(this).text('Password Changed').css('color','#79d2a6');
        });
        $('#personalInfo .edit').click(function() {
            $('#personalInfo').slideUp(300);
            $('#editPersonalInfo').slideDown(300);
        });
        $('#editPersonalInfo .changePwd').click(function() {
            $('#personalInfo').slideDown(300);
            $('#editPersonalInfo').slideUp(300);
        });
    });

</script>

<script>
    function placeOrder(){

        $.ajax({
            type : "post",
            url : "${createLink(controller: 'order', action: 'placeOrder')}",
            success : function (data){
                if(data == 'order placed successfully'){
                    alert("Your order has been placed successfully!!");
                    window.reload();
                }
            }
        });
    }
</script>
<script>
    function checkPass()
    {
        //Store the password field objects into variables ...
        var pass1 = document.getElementById('passedword');
        var pass2 = document.getElementById('confirmPassword');
        //Store the Confimation Message Object ...
        var message = document.getElementById('confirmMessage');
        //Set the colors we will be using ...
        var goodColor = "#66cc66";
        var badColor = "#ff6666";
        //Compare the values in the password field
        //and the confirmation field
        if(pass1.value == pass2.value){
            //The passwords match.
            //Set the color to the good color and inform
            //the user that they have entered the correct password
            pass2.style.backgroundColor = goodColor;
            message.style.color = goodColor;
            message.innerHTML = "Passwords Match!"
        }else{
            //The passwords do not match.
            //Set the color to the bad color and
            //notify the user.
            pass2.style.backgroundColor = badColor;
            message.style.color = badColor;
            message.innerHTML = "Passwords Do Not Match!"
        }
    }

</script>
</body>
</html>
		