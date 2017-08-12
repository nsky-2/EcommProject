<%--
  Created by IntelliJ IDEA.
  User: sumit
  Date: 5/20/2017
  Time: 9:40 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="finalSidebar"/>
</head>
<body>
<div id="sidebar">
    <div class="header">Main Category</div>
    <g:set var="categories" value="${allMap?.keySet()}"/>
    <g:each in="${categories}" var="category" status="i">
        <div class="subCategory category${i + 1}Data">
            <g:set var="subcategoriesMap" value="${allMap?.getAt(category)}"/>
            <g:set var="subcategories" value="${subcategoriesMap?.keySet()}"/>
            <g:each in="${subcategories}" var="subcategory">
                <ul class="itemList">
                    <li class="header">${subcategory}</li>
                    <g:set var="products" value="${subcategoriesMap?.getAt(subcategory)}"/>
                    <g:each in="${products}" var="product">
                        <li class="product">
                            <a href="${(createLink(controller: 'ecomm', action: 'productDetail', params: [productId: product?.id]))}"
                               class="linkTest">${product?.name}
                            </a>
                        </li>
                    </g:each>
                    <li class="borderBottom"></li>
                </ul>
            </g:each>
        </div>
        <ul class="sidebar">
            <li class="category category${i + 1}DataActive" id="category${i + 1}Data">${(category)}</li>
        </ul>
    </g:each>
</div>

<div id="productBody">
    <div id="image_slider">
        <div id="ei-slider" class="ei-slider">
            <ul class="ei-slider-large">
                <li>
                    <img src="${request.contextPath}/ecommThemes/images/large/Slider1.jpg" alt="image06"/>
                </li>
                <li>
                    <img src="${request.contextPath}/ecommThemes/images/large/slider2.jpg" alt="image01" />
                </li>
                <li>
                    <img src="${request.contextPath}/ecommThemes/images/large/Slider6.jpg" alt="image02" />
                </li>
                <li>
                    <img src="${request.contextPath}/ecommThemes/images/large/Slider8.jpg" alt="image03"/>
                </li>
                <li>
                    <img src="${request.contextPath}/ecommThemes/images/large/Slider9.jpg" alt="image04"/>
                </li>
                <li>
                    <img src="${request.contextPath}/ecommThemes/images/large/Slider10.jpg" alt="image05"/>
                </li>
                <li>
                    <img src="${request.contextPath}/ecommThemes/images/large/Slider7.jpg" alt="image07"/>
                </li>
            </ul><!-- ei-slider-large -->
            <ul class="ei-slider-thumbs">
                <li class="ei-slider-element">Current</li>
                <li><a href="#">Slide 6</a><img src="${request.contextPath}/ecommThemes/images/thumbs/Slider1.jpg" alt="thumb06" /></li>
                <li><a href="#">Slide 1</a><img src="${request.contextPath}/ecommThemes/images/thumbs/slider2.jpg" alt="thumb01" /></li>
                <li><a href="#">Slide 2</a><img src="${request.contextPath}/ecommThemes/images/thumbs/Slider6.jpg" alt="thumb02" /></li>
                <li><a href="#">Slide 3</a><img src="${request.contextPath}/ecommThemes/images/thumbs/Slider8.jpg" alt="thumb03" /></li>
                <li><a href="#">Slide 4</a><img src="${request.contextPath}/ecommThemes/images/thumbs/Slider9.jpg" alt="thumb04" /></li>
                <li><a href="#">Slide 5</a><img src="${request.contextPath}/ecommThemes/images/thumbs/Slider10.jpg" alt="thumb05" /></li>
                <li><a href="#">Slide 7</a><img src="${request.contextPath}/ecommThemes/images/thumbs/Slider7.jpg" alt="thumb07" /></li>
            </ul><!-- ei-slider-thumbs -->
        </div><!-- ei-slider -->
    </div>
    %{--</div>--}%

    <div class="productHeaderName"><span title="featured"> Featured <i class="fa fa-angle-right"></i> </span></div>
    <div id="item">
        <ul id="content-slider" class="content-slider">
            <g:each in="${(product)}" var="pro" status="i">
                <li class="main">
                    <div class="product_wrapper">
                        <div class="image">
                            <img src="${createLink(controller:'product', action:'showImage', id: "${pro.id}")}" alt="dress">
                        </div>
                        <div class="product_description">
                            <div class="name">${(pro?.name)}</div>
                            <div class="rating">
                                <fieldset class="ratingDisplay" value="">
                                    <input type="radio" name="rating" value="5" /><label class = "full" for="star5"></label>
                                    <input type="radio" name="rating" value="4.5" /><label class="half" for="star4half"></label>
                                    <input type="radio" name="rating" value="4" /><label class = "full" for="star4" ></label>
                                    <input type="radio" name="rating" value="3.5" /><label class="half" for="star3half"></label>
                                    <input type="radio" name="rating" value="3" /><label class = "full" for="star3"></label>
                                    <input type="radio" name="rating" value="2.5" /><label class="half" for="star2half"></label>
                                    <input type="radio" name="rating" value="2" /><label class = "full" for="star2"></label>
                                    <input type="radio" name="rating" value="1.5" /><label class="half" for="star1half"></label>
                                    <input type="radio" name="rating" value="1" /><label class = "full" for="star1"></label>
                                    <input type="radio" name="rating" value="0.5" /><label class="half" for="starhalf"></label>
                                </fieldset>                            </div>
                            <div class="price">?? ${(pro.price)}
                            %{--<span class="discount">?? 15000</span>--}%
                            </div>

                        </div>
                        <div class="product-details">
                            <ul>
                                <li title="Add to cart"><a onclick="addToCart('cart', ${pro?.id}, '${g.createLink(controller:'ecomm',action:'addToCart')}')" href="#popCart" ><i class="fa fa-shopping-cart"></i></a></li>
                                <li title="Add to wishlist"><a onclick="addToCart('wishlist', ${pro?.id}, '${g.createLink(controller:'ecomm',action:'addToCart')}')" ><i class="fa fa-heart"></i></a></li>
                                <li title="View detail info"><a href="${createLink(controller: 'ecomm', action:'productDetail',params:[productId:pro?.id] )}"><i class="fa fa-info-circle"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </g:each>
        </ul>
    </div>

</div>


<div id="productBodyFull">
    <div class="productHeaderName"><span title="Latest"> Latest <i class="fa fa-angle-right"></i> </span></div>
    <div id="item1">
        <ul id="content-slider1" class="content-slider">
            <g:each in="${(latestProduct)}" var="pro" status="i">

                <li class="main">

                    <div class="product_wrapper">
                        <div class="image">
                            <img src="${createLink(controller:'product', action:'showImage', id: "${pro.id}")}" alt="dress">
                        </div>
                        <div class="product_description">
                            <div class="name">${(pro?.name)}</div>
                            <div class="rating">
                                <fieldset class="ratingDisplay" value="">
                                    <input type="radio" name="rating" value="5" /><label class = "full" for="star5"></label>
                                    <input type="radio" name="rating" value="4.5" /><label class="half" for="star4half"></label>
                                    <input type="radio" name="rating" value="4" /><label class = "full" for="star4" ></label>
                                    <input type="radio" name="rating" value="3.5" /><label class="half" for="star3half"></label>
                                    <input type="radio" name="rating" value="3" /><label class = "full" for="star3"></label>
                                    <input type="radio" name="rating" value="2.5" /><label class="half" for="star2half"></label>
                                    <input type="radio" name="rating" value="2" /><label class = "full" for="star2"></label>
                                    <input type="radio" name="rating" value="1.5" /><label class="half" for="star1half"></label>
                                    <input type="radio" name="rating" value="1" /><label class = "full" for="star1"></label>
                                    <input type="radio" name="rating" value="0.5" /><label class="half" for="starhalf"></label>
                                </fieldset>
                            </div>
                            <div class="price">?? ${(pro.price)} <span class="discount">?? 15000</span></div>

                        </div>
                        <a href="${createLink(controller: "ecomm", action: "productDetail")}">
                        <div class="product-details">
                            <ul>
                                <li title="Add to cart"><a onclick="addToCart('cart', ${pro?.id}, '${g.createLink(controller:'ecomm',action:'addToCart')}')" href="#popCart" ><i class="fa fa-shopping-cart"></i></a></li>
                                <li title="Add to wishlist"><a onclick="addToCart('wishlist', ${pro?.id}, '${g.createLink(controller:'ecomm',action:'addToCart')}')" ><i class="fa fa-heart"></i></a></li>
                                <li title="View detail info"><a href="${createLink(controller: 'ecomm', action:'productDetail',params:[productId:pro?.id] )}"><i class="fa fa-info-circle"></i></a></li>
                            </ul>
                        </div>
                        </a>
                    </div>
                </li>
            </g:each>
        </ul>
    </div>
    <div class="productHeaderName"><span title="Trending"> Trending <i class="fa fa-angle-right"></i> </span></div>
    <div id="item2">
        <ul id="content-slider2" class="content-slider">
            <g:each in="${(trendingProducts)}" var="pro" status="i">
                <li class="main">
                    <div class="product_wrapper">
                        <div class="image">
                            <img src="${createLink(controller:'product', action:'showImage', id: "${pro.id}")}" alt="dress">
                        </div>
                        <div class="product_description">
                            <div class="name">${(pro?.name)}</div>
                            <div class="rating">
                                <fieldset class="ratingDisplay" value="">
                                    <input type="radio" name="rating" value="5" /><label class = "full" for="star5"></label>
                                    <input type="radio" name="rating" value="4.5" /><label class="half" for="star4half"></label>
                                    <input type="radio" name="rating" value="4" /><label class = "full" for="star4" ></label>
                                    <input type="radio" name="rating" value="3.5" /><label class="half" for="star3half"></label>
                                    <input type="radio" name="rating" value="3" /><label class = "full" for="star3"></label>
                                    <input type="radio" name="rating" value="2.5" /><label class="half" for="star2half"></label>
                                    <input type="radio" name="rating" value="2" /><label class = "full" for="star2"></label>
                                    <input type="radio" name="rating" value="1.5" /><label class="half" for="star1half"></label>
                                    <input type="radio" name="rating" value="1" /><label class = "full" for="star1"></label>
                                    <input type="radio" name="rating" value="0.5" /><label class="half" for="starhalf"></label>
                                </fieldset>
                            </div>
                            <div class="price">?? ${(pro.price)}
                            %{--<span class="discount">?? 15000</span>--}%
                            </div>

                        </div>
                        <div class="product-details">
                            <ul>
                                <li title="Add to cart"><a onclick="addToCart('cart', ${pro?.id}, '${g.createLink(controller:'ecomm',action:'addToCart')}')" ><i class="fa fa-shopping-cart"></i></a></li>
                                <li title="Add to wishlist"><a onclick="addToCart('wishlist', ${pro?.id}, '${g.createLink(controller:'ecomm',action:'addToWishlist')}')" ><i class="fa fa-heart"></i></a></li>
                                <li title="View detail info"><a href="${createLink(controller: 'ecomm', action:'productDetail',params:[productId:pro?.id] )}"><i class="fa fa-info-circle"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </g:each>
        </ul>
    </div>

</div>

<div hidden="hidden">
    <a id="anchorCart" href="#popCart"/>
</div>
<div hidden="hidden">
    <a id="anchorWishlist" href="#wish-box" class="login-window"/>
</div>
<div id="popCart">
    <span class="cartIcon"><i class="fa fa-cart-plus"></i> </span>
    <span class="cartMessage"><span>An item is add to the cart.</span> Click <a href="${createLink(controller: 'cart', action: 'cartList')}">here</a> to view your cart list</span>
    <span class="cartPopClose">X</span>
</div>
<div id="popAlreadyInCart">
    <span class="cartIcon"><i class="fa fa-cart"></i> </span>
    <span class="cartMessage">This item is already in the cart. Click <a href="${createLink(controller: 'cart', action: 'cartList')}">here</a> to view your cart list</span>
    <span class="cartPopClose">X</span>
</div>
<div id="popWish">
    <span class="cartIcon"><i class="fa fa-heart-o"></i> </span>
    <span class="cartMessage">An item is add to the WishList. Click <a href="${createLink(controller: 'cart', action: 'wishList')}">here</a> to view your Wish list</span>
    <span class="cartPopClose">X</span>
</div>
<div id="popAlreadyInWish">
    <span class="cartIcon"><i class="fa fa-heart-o"></i> </span>
    <span class="cartMessage">This item is already in the WishList. Click <a href="${createLink(controller: 'cart', action: 'wishList')}">here</a> to view your Wish list</span>
    <span class="cartPopClose">X</span>
</div>
<script>
    jQuery('.slider').lbSlider({
        leftBtn: '.sa-left',
        rightBtn: '.sa-right',
        visible:4,
        itemSlide:1
    });
    jQuery('.slider1').lbSlider1({
        leftBtn: '.sa-left1',
        rightBtn: '.sa-right1',
        visible:5,
        itemSlide:1
    });
    jQuery('.slider2').lbSlider1({
        leftBtn: '.sa-left2',
        rightBtn: '.sa-right2',
        visible:5,
        itemSlide:1
    });
</script>

<script type="text/javascript">
    $(function() {
        $('#ei-slider').eislideshow({
            animation			: 'center',
            autoplay			: true,
            slideshow_interval	: 3000,
            titlesFactor		: 0
        });
    });
</script>
<script>
    $(document).ready(function(){
        $("a[href$='#popCart']").click(function(){
            $('#popCart').slideDown(100);
            $('#popCart .cartIcon').animate({
                left : '30px'
            })(150);
        });
        $('#popCart .cartPopClose').click(function(){
            $('#popCart').slideUp(100);
            $('#popCart .cartIcon').animate({
                left : '0px'
            })(150);
        });
        $("a[href$='#popWish']").click(function(){
            $('#popWish').slideDown(100);
            $('#popWish .cartIcon').animate({
                left : '30px'
            })(150);
        });
        $('#popWish .cartPopClose').click(function(){
            $('#popWish').slideUp(100);
            $('#popWish .cartIcon').animate({
                left : '0px'
            })(150);
        });
        $("a[href$='#popAlreadyInCart']").click(function(){
            $('#popAlreadyInCart').slideDown(100);
            $('#popAlreadyInCart .cartIcon').animate({
                left : '30px'
            })(150);
        });
        $('#popAlreadyInCart .cartPopClose').click(function(){
            $('#popAlreadyInCart').slideUp(100);
            $('#popAlreadyInCart .cartIcon').animate({
                left : '0px'
            })(150);
        });
        $("a[href$='#popAlreadyInWish']").click(function(){
            $('#popAlreadyInWish').slideDown(100);
            $('#popAlreadyInWish .cartIcon').animate({
                left : '30px'
            })(150);
        });
        $('#popAlreadyInWish .cartPopClose').click(function(){
            $('#popAlreadyInWish').slideUp(100);
            $('#popAlreadyInWish .cartIcon').animate({
                left : '0px'
            })(150);
        });
    });
</script>
<script>
    $(document).ready(function(){
        $("#content-slider").lightSlider({
            loop:false,
            keyPress:true
        });
        $("#content-slider1 , #content-slider2").lightSlider({
            loop:false,
            keyPress:true,
            item : 5.7

        });
    });
</script>

</body>
</html>