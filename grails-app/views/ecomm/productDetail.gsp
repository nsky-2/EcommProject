<%--
  Created by IntelliJ IDEA.
  User: sumit
  Date: 5/21/2017
  Time: 9:17 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="finalSidebar"/>
    <title>Stones&Handicrafts</title>

</head>

<body>
<div id="productDetailBody">
    <div class="productInfo1">
        <div class="productName">Product you may like</div>
        <g:set var="recomm" value="${productList?.size()>0?productList:topTwoRecomm}"/>
        <g:each in="${recomm}" var="pro">
            <div class="product">
                <a href="${createLink(controller: 'ecomm', action:'productDetail',params:[productId:pro?.id] )}">
                    <div class="image">
                        <img  src="${createLink(controller:'product', action:'showImage', id: "${pro?.id}")}"/>

                    </div>
                    <div class="detailInfo">
                        <ul>
                            <li class="productName"><span>${(pro?.name)}</span></li>
                            <li class="productPrice"><span>रु ${(pro?.price)}</span></li>
                            %{--<li class="productDiscount"><span>रु 54000</span></li>--}%
                            <li class="rating">
                                <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                            </li>
                        </ul>
                    </div>
                </a>
            </div>
        </g:each>

    </div>
    <div class="productInfo">
        <div class="productDetail">
            <div class="productImage">
                <img  src="${createLink(controller:'product', action:'showImage', id: "${product?.id}")}"/>

            </div>
            <div class="productInformation">
                <ul>
                    <li class="productName"><span>${(product?.name)}</span></li>
                    <li class="productPrice"><span>‎रु ${(product?.price)}</span></li>
                    <li class="productModel">Model No. :<span class="modelNo"> ${(product?.code)}</span></li>
                    <g:if test="${availableQuantity > 0}">
                        <li>${product?.availability}: ${availableQuantity}</li>
                        <li class="productQuantity"><span class="qty">Quantity : </span>
                            <span class="fa minus"> - </span>
                            <input type="number" max="${availableQuantity}" min="1" value="1" class="fieldQuantity">
                            <span class="fa plus" > + </span>
                        </li>
                    </g:if>
                    <g:else>
                        <li>OUT OF STOCK</li>
                    </g:else>
                    <li class="addToCart"><a class="login-window" title="Add to cart" onclick="addToCart('cart', ${product?.id}, '${g.createLink(controller:'ecomm',action:'addToCart')}')"><div class="button"><i class="fa fa-shopping-cart"></i>Add to cart</div></a></li>
                    <li class="buyProduct"><a class="login-window" title="Buy Product"><div class="button"><i class="fa fa-inr"></i>Buy</div></a></li>
                    <li hidden="hidden"><a id="anchorCart" href="#cart-box" class="login-window"/></li>
                    <li  hidden="hidden"> <a id="anchorWishlist" href="#wish-box" class="login-window"/></li>
                    <li class="wishList"><a  class="login-window" title="Add to WishList"onclick="addToCart('wishlist', ${product?.id},'${g.createLink(controller:'ecomm',action:'addToCart')}')"><i class="fa fa-heart-o"></i><span> Add to wishlist</span></a></li>
                    <g:if test="${session?.user}">
                    <li class="rateProduct">
                        <span class="rate">Rate and Review</span>
                        <g:form controller="product" action="rateAndReview" method="post" params="[productId: product?.id]">
                        <div id="rateAndReview">
                            <span class="fa fa-caret-up"></span>
                            <div>Rate the product</div>
                            <span class="rating">
                                <fieldset id="rating">
                                    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome"></label>
                                    <input type="radio" id="star4half" name="rating" value="4.5" /><label class="half" for="star4half" title="Pretty good"></label>
                                    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good"></label>
                                    <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
                                    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
                                    <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
                                    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
                                    <input type="radio" id="star1half" name="rating" value="1.5" /><label class="half" for="star1half" title="nice"></label>
                                    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="good"></label>
                                    <input type="radio" id="starhalf" name="rating" value="0.5" /><label class="half" for="starhalf" title="poor"></label>

                                </fieldset>
                            </span>
                            <div class="rev">Write your review</div>
                            <div class="reviewBox">
                                <textarea placeholder="Enter your review.." name="review"></textarea>
                            </div>
                            <div class="btn">
                               <g:submitButton name="submit"> Submit</g:submitButton>
                            </div>
                            <div class="note">
                                Dear user your review will be approved by the admin. In case of inappropriate use of language your review will not be posted.
                            </div>
                        </div>
                        </g:form>
                    </li>
                    </g:if>
                </ul>
            </div>
        </div>

        <!---CART BOX--->
        <div id="cart-box" class="cartBox">
            <span class="close">&times;</span>
            <i class="fa fa-check"></i>
            <h1>Product added to cart</h1>
            <p>Click <a href="${createLink(controller: 'cart', action: 'cartList')}">Here</a> to view the cart list or to remove product from the cart.</p>
        </div>
        <!--CART BOX END --->
        <!---CART BOX--->
        <div id="wish-box" class="cartBox">
            <div class="btn_close1">x</div>
            <i class="fa fa-check"></i>
            <h1>Product added to wishlist</h1>
            <p>Click <a href="${createLink(controller: 'cart', action: 'wishList')}">Here</a> to view the wishlist or to remove product from the wishlist.</p>
        </div>
        <!--CART BOX END --->

        <div class="productDescription">
            <ul>
                <li class="productName"><span>Description</span></li>
                <li class="rate">
                    %{--${product?.ratings?.rate}--}%
                    <fieldset class="ratingDisplay" value="${ratedValue}">
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
                    <span class="rates">${product?.ratings?.rate}</span>
                </li>
                <li><span>${(product?.description)}</span></li>
            </ul>
        </div>
        <div class="productReview">
            <ul>
                <li class="productName"><span>Review</span></li>
                <g:each in="${reviews}" status="i" var="approvedReview">
                <li class="userReview">
                    <div class="userReviewBody">
                        <div class="header">
                            <span class="userName">${reviews?.customer?.fullName}</span>
                            <span class="postDate">${i+10}/${i+2}/2017</span>
                        </div>
                        <div class="userBody">
                            ${reviews?.comment}
                        </div>
                    </div>
                </li>
                </g:each>

                %{--<li class="comment">--}%
                    %{--<input type="text" value="" name="comment" placeholder="Post your review about the product"/>--}%
                    %{--<span class="commentButton"><a href="#" class="btnn"><i class="fa fa-comment"></i></a></span>--}%
                %{--</li>--}%
            </ul>
        </div>
    </div>

</div>
<script>
    $(document).ready(function() {
        $(".productQuantity .fa").on("click", function() {
            var $button = $(this);
            var oldValue = $button.parent().find("input").val();
            if ($button.text() == " + ") {
                var newVal = parseFloat(oldValue) + 1;
            } else {
                if (oldValue > 0) {
                    var newVal = parseFloat(oldValue) - 1;
                } else {
                    newVal = 1;
                }
            }

            $button.parent().find("input").val(newVal);

        });
    });
</script>

<script>
    $(document).ready(function(){
        $('#productDetailBody  .productInformation .rateProduct .rate').click(function(){
            $('#rateAndReview').toggle(200);

        });
    });
</script>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>
    $(document).ready(function () {
        var $rateValue = $('.ratingDisplay').attr('value');
        if( $rateValue <= 5 && $rateValue > 4.5){
            $('.ratingDisplay input[name="' + 'rating' + '"][value="' + 5 + '"]').prop('checked', true);
        }else if($rateValue <= 4.5 && $rateValue > 4){
            $('.ratingDisplay input[name="' + 'rating' + '"][value="' + 4.5 + '"]').prop('checked', true);
        }else if($rateValue <= 4 && $rateValue > 3.5){
            $('.ratingDisplay input[name="' + 'rating' + '"][value="' + 4 + '"]').prop('checked', true);
        }else if($rateValue <= 3.5 && $rateValue > 3){
            $('.ratingDisplay input[name="' + 'rating' + '"][value="' + 3.5 + '"]').prop('checked', true);
        }else if($rateValue <= 3 && $rateValue > 2.5){
            $('.ratingDisplay input[name="' + 'rating' + '"][value="' + 3 + '"]').prop('checked', true);
        }else if($rateValue <= 2.5 && $rateValue > 2){
            $('.ratingDisplay input[name="' + 'rating' + '"][value="' + 2.5 + '"]').prop('checked', true);
        }else if($rateValue <= 2 && $rateValue > 1.5){
            $('.ratingDisplay input[name="' + 'rating' + '"][value="' + 2 + '"]').prop('checked', true);
        }else if($rateValue <= 1.5 && $rateValue > 1){
            $('.ratingDisplay input[name="' + 'rating' + '"][value="' + 1.5 + '"]').prop('checked', true);
        }else if($rateValue <= 1 && $rateValue > 0.5){
            $('.ratingDisplay input[name="' + 'rating' + '"][value="' + 1 + '"]').prop('checked', true);
        }else if($rateValue <= 0.5 && $rateValue > 0){
            $('.ratingDisplay input[name="' + 'rating' + '"][value="' + 0.5 + '"]').prop('checked', true);
        }
    });
</script>
<!----SCRIPT---->

 %{--<script type="text/javascript">--}%
    %{--var _gaq = _gaq || [];--}%
    %{--_gaq.push(['_setAccount', 'UA-36251023-1']);--}%
    %{--_gaq.push(['_setDomainName', 'jqueryscript.net']);--}%
    %{--_gaq.push(['_trackPageview']);--}%

    %{--(function() {--}%
        %{--var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;--}%
        %{--ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';--}%
        %{--var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);--}%
    %{--})();--}%

%{--</script>--}%

%{--<script type="text/javascript">--}%
    %{--var span = document.getElementsByClassName("close")[0];--}%
    %{--span.onclick = function() {--}%
        %{--cart_box.style.display = "none";--}%
    %{--}--}%
%{--</script>--}%

</body>
</html>