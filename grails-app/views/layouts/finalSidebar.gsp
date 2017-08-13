<%@ page import="HMEcomm.Cart; HMEcomm.Product; himalayanecomm.EcommService;himalayanecomm.CartService" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>Store</title>
    <!--CSS-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/ecommThemes/css/image_slider.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/ecommThemes/css/sliderProduct.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/ecommThemes/css/NewProductSlider.css">

    <link rel="stylesheet" href="${request.contextPath}/ecommThemes/css/cartListProduct.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/ecommThemes/css/awesomplete.css">
    <link href="${request.contextPath}/ecommThemes/css/initialStyle.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/review&rating.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/AllPopups.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/productDetails.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/catogirySidebar.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/loginBoxPopup.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/registerBoxPopup.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/addedToCart.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/navigationHeaderTop.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/infoAccount.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/footerBottom.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/responsiveBody.css" rel="stylesheet" type="text/css"/>
    <link href="${request.contextPath}/ecommThemes/css/productSlider.css" rel="stylesheet" type="text/css"/>
    %{--<link href="${request.contextPath}/ecommThemes/css/dataTable.css" rel="stylesheet" type="text/css"/>--}%

    <style>body{background:#f5f5f5;}</style>
    <!--JAVASCRIPT-->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${request.contextPath}/ecommThemes/js/login_popup.js"></script>
    <script type="text/javascript" src="${request.contextPath}/ecommThemes/js/awesomplete.js"></script>
    <!---IMAGE SLIDER--->
    <script type="text/javascript" src="${request.contextPath}/ecommThemes/js/jquery.eislideshow.js"></script>
    <script type="text/javascript" src="${request.contextPath}/ecommThemes/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${request.contextPath}/ecommThemes/js/commonFunction.js"></script>
    %{--<script type="text/javascript" src="${request.contextPath}/ecommThemes/js/productSlider.js"></script>--}%
    <script type="text/javascript" src="${request.contextPath}/ecommThemes/js/newProductSlider.js"></script>
    %{--<script type="text/javascript" src="${request.contextPath}/ecommThemes/js/dataTable.js"></script>--}%


</head>

<body>
<div id="header">
    <div class="headTopWrap">
        <div class="contact">
            <ul>
                <li><i class="fa fa-phone"></i><span>+9779898734523 | +9779898734523</span></li>
                <li><i class="fa fa-envelope"></i> <span>HimalayanMinerals@gmail.com</span></li>
                <li><i class="fa fa-map-marker"></i> <span>Nayabazar, Kathmandu, Nepal</span></li>
            </ul>
        </div>

        <div class="socialIcons">
            <ul>
                <li class="facebook"><a href="#" title="facebook"><i class="fa fa-facebook"></i></a></li>
                <li class="twitter"><a href="#" title="twitter"><i class="fa fa-twitter"></i></a></li>
                <li class="google-plus"><a href="#" title="google plus"><i class="fa fa-google-plus"></i></a></li>
                <li class="linkedin"><a href="#" title="linkedin"><i class="fa fa-linkedin"></i></a></li>
                <li class="youtube-play"><a href="#" title="youtube"><i class="fa fa-youtube-play"></i></a></li>
            </ul>
        </div>
    </div><!--/header_top-->

    <div class="headBotWrap">

        <div class="logo">
            <a href="${createLink(controller: 'ecomm', action: 'initial')}"><img
                    src="${request.contextPath}/ecommThemes/images/logoMain.png" alt=""/></a>
        </div>
  <div class="search">
        <g:form controller="ecomm" action="search">
            <%
                def product=Product.findAll()
                def productName=product?.name?.toString()?.replaceAll('\\[', '')?.replaceAll('\\]', '')
            %>

        %{--<div class="search_box">--}%
            <input class="awesomplete"
                   data-minchars="1"
                   data-maxitems="5"
                   data-list="${productName}" placeholder="Search by Product.." name="search" type="search"/>
                <button title="search"><i class="fa fa-search"></i></button>
        </g:form>
        </div>
    %{--${customer?.firstName}--}%
        <div class="menu">
        <%

        %>

            <ul>
                <g:if test="${session?.user}">
                    <%
                        def customer=(session?.user)
                        def customerName=customer?.firstName
                    %>

                    <li class="welcome" ><span class="text">Hi ${customerName} <i class="fa fa-caret-down"></i></span>
                        <span class="down">
                            <ul class="dropdown">
                                <li><a href="${createLink(controller: 'order', action: 'viewOrderHistory')}"><i class="fa fa-user"></i> Profile & Settings</a></li>
                                <li><a href="${createLink(controller: 'customer', action: 'logout')}"><i
                                        class="fa fa-sign-out"></i><span class="text">Logout</span></a>
                                </li>
                            </ul>
                        </span>
                    </li>
                    <li class="order"><i class="fa fa-truck"></i> Order <i class="fa fa-caret-down"></i>
                        <span class="down">
                            <ul class="dropdown">
                                <li><a href="${createLink(controller: 'order', action: 'viewOrderHistory')}" title="Your Order History"><i class="fa fa-history"></i> Order History</a></li>
                                <li><a href="#" title="Track Your Order"><i class="fa fa-globe"></i> Track Order</a></li>
                            </ul>
                        </span>
                    </li>

                </g:if>
                <g:else>

                    <li><a href="#loginBox" id="loginHref" title="User Login"><i
                            class="fa fa-user-o"></i><span class="text">LOGIN</span></a>
                    </li>
                </g:else>
                <li><a href="#login" title="Wishlist"
                       onclick="addToCart('wishlist', null, '${g.createLink(controller:'cart',action:'checkWishlist')}')"
                       ><i class="fa fa-heart-o"></i> <span class="text">Wishlist</span></a>
                </li>
        <%   def cartlist=Cart.findAllByCustomerAndIsDeletedAndStatusIsNull(session?.user,false)
                def cartListSize=cartlist?.size()%>
                <li class="cart"><span class="productNo">${cartListSize}</span><a href="#"
                                    onclick="addToCart('cart', null, '${g.createLink(controller:'cart',action:'checkCartList')}')"
                                    ><span class="shopping" title="Shopping Cart"><img
                            src="${request.contextPath}/ecommThemes/images/cart1.png" alt=""/></span></a>
                    <ul class="cartDrop">
                        <span class="fa fa-caret-up"></span>
                        <g:if test="${session?.user}">
                            <g:if test="${cartListSize==0}">
                            <li class="noItem">
                                <span class="sadImage">
                                    <img  src="${request.contextPath}/ecommThemes/images/sad.jpg" alt="">
                                </span>
                                <span class="detail">
                                    <span class="head">Sorry User</span>
                                    <span class="body">You have no item added to your list.</span>
                                </span>
                            </li>
                            </g:if>
                            <g:else>
                                <%
                                    CartService cartService = new CartService()
                                    def carts=cartService.cartListForUser(session?.user)
                                    EcommService ecommService = new EcommService()
                                    def itemListCart=ecommService.itemsInCartList(carts)
                                %>

                        <g:each in="${(itemListCart)}" var="cartList" status="i">
                            <li class="cartItem">
                                <span class="image">
                                    <img  src="${createLink(controller:'product', action:'showImage', id: "${cartList?.getAt('productId')}")}" alt="">
                                </span>
                                <span class="detail">
                                    <span class="pName">${(cartList?.getAt('productName'))}</span>
                                    <span class="pPrice">‎रु ${(cartList?.getAt('productPrice'))}</span>
                                </span>
                            </li>
                        </g:each>

                        <li class="viewAll" title="View Cart List">
                            <a href="#"
                               onclick="addToCart('cart', null, '${g.createLink(controller:'cart',action:'checkCartList')}')"
                            ><span>View All</span>
                            </a>
                        </li>
                            </g:else>
                        </g:if>
                        <g:else>
                            <li class="noItem">
                                <span class="sadImage">
                                    <img  src="${request.contextPath}/ecommThemes/images/sad.jpg" alt="">
                                </span>
                                <span class="detail">
                                    <span class="head">Not Logged In</span>
                                    <span class="body">Please Log in for more features.</span>
                                </span>
                            </li>
                        </g:else>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!--/header-middle-->
    <div class="headBottomWrap">
        <div class="search">
            <g:form controller="ecomm" action="search">
            %{--<div class="search_box">--}%
                <button><i class="fa fa-search"></i></button>
                <input class="awesomplete"
                       data-minchars="1"
                       data-maxitems="5"
                       data-list="${productName}" placeholder="Search by Product.." name="search" type="search"/>

            </g:form>
        </div>
    </div>
</div>
<g:render template="/layouts/login"/>

<g:layoutBody/>
<div id="footer">
    <div class="allCat">
        <g:set var="categories" value="${allMap?.keySet()}"/>
        <g:each in="${categories}" var="category">
            <div class="column">
                <div class="catHeading">${(category)}</div>
                <g:set var="subcategoriesMap" value="${allMap?.getAt(category)}"/>
                <g:set var="subcategories" value="${subcategoriesMap?.keySet()}"/>
                <g:each in="${subcategories}" var="subcategory">
                    <div class="subCat"><a href="#">${subcategory}</a></div>
                </g:each>
            </div>
        </g:each>
    </div>
    <div class="message">
        <div class="heading">
            Welcome User
        </div>
        <div class="text">
            We are glad to welcome you to our website.
            we can help you find what you are searching for.
            Search for the product you like, add to cart, add to wishList, view the reviews and rating for the product.
            For the purchase you are assigned an agent nearest to the location you have provided. The agent contacts you and confirm the purchase then you can track for you order.
            Please don't forget to rate and review for the product.
            Enjoy shopping and contact us for more information and provide feedback on your experience so that we could improve on the faults for better and secure purchasing of goods.
        </div>
    </div>
    <div class="info">
        <ul>
            <li class="icon">
                <span><i class="fa fa-search"></i></span>
            </li>
            <li class="text">
                <span class="big"> Search </span>
                <span class="small"> product </span>
            </li>
            <li class="angleRight">
                <span><i class="fa fa-angle-double-right"></i> </span>
            </li>
            <li class="icon">
                <span><i class="fa fa-cart-plus"></i></span>
            </li>
            <li class="text">
                <span class="big"> Add </span>
                <span class="small"> to cart </span>
            </li>
            <li class="angleRight">
                <span><i class="fa fa-angle-double-right"></i> </span>
            </li>
            <li class="icon">
                <span><i class="fa fa-money"></i></span>
            </li>
            <li class="text">
                <span class="big"> Order </span>
                <span class="small"> product </span>
            </li>
            <li class="angleRight">
                <span><i class="fa fa-angle-double-right"></i> </span>
            </li>
            <li class="icon">
                <span><i class="fa fa-user-secret"></i></span>
            </li>
            <li class="text">
                <span class="big"> Contact </span>
                <span class="small"> agent </span>
            </li>
            <li class="angleRight">
                <span><i class="fa fa-angle-double-right"></i> </span>
            </li>
            <li class="icon">
                <span><i class="fa fa-truck"></i></span>
            </li>
            <li class="text">
                <span class="big"> Track </span>
                <span class="small"> Order </span>
            </li>
            <li class="angleRight">
                <span><i class="fa fa-angle-double-right"></i> </span>
            </li>
            <li class="icon">
                <span><i class="fa fa-archive"></i></span>
            </li>
            <li class="text">
                <span class="big"> Product </span>
                <span class="small"> delivered </span>
            </li>
        </ul>
    </div>
    <div class="contact">
        <ul class="box">
            %{--<li class="text"><span>Connect us with</span></li>--}%
            <li class="icon" title="facebook"><span><i class="fa fa-facebook"></i> </span></li>
            <li class="icon" title="twitter"><span><i class="fa fa-twitter"></i> </span></li>
            <li class="icon" title="instagram"><span><i class="fa fa-instagram"></i> </span></li>
            <li class="icon" title="google plus"><span><i class="fa fa-google"></i> </span></li>
        </ul>
        <g:if test="${session?.user}">
        <ul class="option">
            <a href="${createLink(controller: 'order', action: 'viewOrderHistory')}"><li title="Order History"><span class="icon"><i class="fa fa-history"></i></span><span class="name">Order History</span></li></a>
            <a href="${createLink(controller: 'order', action: 'viewOrderHistory')}"><li title="Track Order"><span class="icon"><i class="fa fa-globe"></i></span><span class="name"> Track Order </span></li></a>
            <a href="${createLink(controller: 'order', action: 'viewOrderHistory')}"><li title="Profile & Settings"><span class="icon"><i class="fa fa-user"></i></span><span class="name"> Profile & Settings</span></li></a>
        </ul>
        </g:if>
    </div>
    <div class="footerBottom" >
        <div class="mainAttraction">
            <ul>
                <li class="header">Main Attractions</li>
                <li class="attractions"><span><a href="#">Pashmina</a></span></li>
                <li class="attractions"><span><a href="#">Rings</a></span></li>
                <li class="attractions"><span><a href="#">Neckless</a></span></li>
                <li class="attractions"><span><a href="#">Stones</a></span></li>
                <li class="attractions"><span><a href="#">Gems</a></span></li>
            </ul>
        </div>
        <div class="contactUs">
            <ul>
                <li class="header">Contact Us</li>
                <li class="attractions"><span><i class="fa fa-map-marker"></i> Nayabazar, Kathmandu ,Nepal</span></li>
                <li class="attractions"><span><i class="fa fa-envelope"></i>Stones&handicrafts@gmail.com</span></li>
                <li class="attractions"><span><i class="fa fa-phone"></i> +9779834523443 | +9779853232354</span></li>
            </ul>
        </div>
        <div class="feedback">
            <ul>
                <li class="header">Feedback</li>
                <li class="attractions"><span>Subject</span>
                    <input type="text"/> </li>
                <li class="attractions"><span>Message</span>
                    <textarea></textarea>
                </li>
                <li class="button"><span class="this">Submit</span></li>
            </ul>
        </div>
    </div>
    <div class="bottom">
        <div class="top">
            <span><a href="#"> About Us </a></span>
            <span> | </span>
            <span><a href="#"> Our Website </a></span>
            <span> | </span>
            <span><a href="#"> Terms & Policies </a></span>
            <span> | </span>
            <span><a href="#"> Certificates </a></span>
            <span> | </span>
            <span><a href="#"> Purchase Policies </a></span>
        </div>
        <div class="bot"><span>©Stones&handicrafts 2017</span></div>
    </div>
</div>
<script>
    $(window).scroll(function() {
        if ( $(window).scrollTop() > 100 ) {
            $('#header .headTopWrap').slideUp(200);
            $('.iconSidebar').css('top' , '15px')(200);
        } else {
            $('#header .headTopWrap').slideDown(200);
            $('.iconSidebar').css('top' , '45px')(200);
        }
    });
</script>
<script type="text/javascript">
    $('body').prepend('<a href="#" class="back-to-top" title="Back to top"><i class="fa fa-arrow-up"></i> </a>');

    var amountScrolled = 300;

    $(window).scroll(function() {
        if ( $(window).scrollTop() > amountScrolled ) {
            $('a.back-to-top').fadeIn('slow');
        } else {
            $('a.back-to-top').fadeOut('slow');
        }
    });

    $('a.back-to-top, a.simple-back-to-top').click(function() {
        $('html, body').animate({
            scrollTop: 0
        }, 700);
        return false;
    });
</script>
<script>
    $(document).ready(function(){
        $('#header .welcome').mouseenter(function(){
            $(this).slideDown(300,function(){
                $('#header .welcome .down').slideDown(300,function(){
                    $(this).mouseleave(function(){
                        $('this').hide();
                    });
                });
            });
            $(this).mouseleave(function(){
                $('#header .welcome .down').mouseenter(function(){
                    $(this).show();
                });
                $('#header .welcome .down').hide();
            });
        });
        $('#header .order').mouseenter(function(){
            $(this).slideDown(300,function(){
                $('#header .order .down').slideDown(300,function(){
                    $(this).mouseleave(function(){
                        $('this').hide();
                    });
                });
            });
            $(this).mouseleave(function(){
                $('#header .order .down').mouseenter(function(){
                    $(this).show();
                });
                $('#header .order .down').hide();
            });
        });

        $('#header .cart').mouseenter(function(){
            $(this).slideDown(300,function(){
                $('#header .cart .cartDrop').slideDown(300,function(){
                    $(this).mouseleave(function(){
                        $('this').hide();
                    });
                });
            });
            $(this).mouseleave(function(){
                $('#header .cart .cartDrop').mouseenter(function(){
                    $(this).show();
                });
                $('#header .cart .cartDrop').hide();
            });
        });
    });
</script>
<script>
    $(document).ready(function(){
        $('.category').mouseenter(function(){
            var id= $(this).attr('id');
            $('.' + id).show();
            $('#' + id).mouseleave(function(){
                $('.subCategory.' + id).mouseenter(function(){
                    $('.' + id +'Active').addClass('activeCategory');
                    $(this).show();
                });
                $('.' + id).mouseleave(function(){
                    $('.' + id +'Active').removeClass('activeCategory');
                    $('.' + id).hide();
                });
                $('.' + id).hide();
            });
        });

    });
</script>

<script>
    $(document).ready(function(){
        $("a[href$='#loginBox']").click(function(){
            $('#loginBox').fadeIn(200);
            $('#login1').slideDown(300);
        });
        $('#topMask').click(function(){
            $('#loginBox').fadeOut(300);
            $('#login1').slideUp(300);
        });
        $('#logClose').click(function(){
            $('#loginBox').fadeOut(300);
            $('#login1').slideUp(300);
        });
    });
</script>
<script>
    $(document).ready(function(){
        $('a[href$="#registerBox"]').click(function(){
            $('#loginBox').fadeOut(300);
            $('#login1').slideUp(300);
            $('#registerBox').fadeIn(300);
            $('.register').slideDown(300);
        });
        $('#registerMask').click(function(){
            $('#registerBox').fadeOut(300);
            $('.register').slideUp(300);
        });
        $('#registerBox .registerClose').click(function(){
            $('#registerBox').fadeOut(300);
            $('.register').slideUp(300);
        });
        $('#registerBox .haveAcc').click(function(){
            $('#registerBox').fadeOut(300);
            $('.register').slideUp(300);
            $('#loginBox').fadeIn(300);
            $('#login1').slideDown(300);
        });
    });
</script>

</body>
</html>