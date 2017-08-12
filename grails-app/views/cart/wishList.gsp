<%--
  Created by IntelliJ IDEA.
  User: sumit
  Date: 5/29/2017
  Time: 10:49 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="finalSidebar"/>
    <title> Store </title>
</head>

<body>
<div id="cartBodyWrap">
    <div class="cartWrapper">
        <div id="breadcrumbs"><span class="home">Home</span> <span class="icon"><i class="fa fa-angle-double-right"></i> </span> <span class="first">My Wishlist</span></div>

        <div class="header">My Wishlist</div>
    <g:if test="${itemWishlist.size() == 0}">

            <div id="noOrderHistory">
                <div class="bodyMain">
                    <span><img src="${request.contextPath}/ecommThemes/images/sad.jpg"></span>
                    <div class="textBig">Sorry user</div>
                    <div class="textMid">Your WishList is currently empty. </div>
                    <div class="textBot">Click below to shop more...</div>
                    <div class="btn"><a href="${createLink(controller: 'ecomm', action: 'initial')}" ><span>Continue Shopping</span></a></div>
                </div>
            </div>
    </g:if>
    <g:else>
        <div class="tableWrapper">
            <table>

                <tr>
                    <th></th>
                    <th>Name</th>
                    <th>Code No.</th>
                    <th>Price</th>
                    <th></th>
                </tr>
                <g:each in="${(itemWishlist)}" var="wishList" status="i">
                    <tr>
                        <td><img src="${createLink(controller:'product', action:'showImage', id: "${wishList?.getAt('productId')}")}" width='150' height='150'/></td>
                        <td>${(wishList?.getAt('productName'))}</td>
                        <td>${(wishList?.getAt('productCode'))}</td>
                        <td>${(wishList?.getAt('productPrice'))}</td>
                        <td class="delete"><a href="${(createLink(controller: 'cart', action:'deleteFromWishlist', params: [cartListId:wishList.getAt('productId')]))}"><i class="fa fa-trash-o"></i></a>
                            <a href="#" title="Add to Cart" class="wish"><i class="fa fa-shoppint-cart"></i> </a>

                        </td>

                    </tr>
                </g:each>
            </table>
        </div>
    </div>
    <div class="orderSummary">
        <div class="name">Wishlist Summary</div>
        <g:each in="${(itemWishlist)}" var="cartList" status="i">
            <ul class="order">
                <li class="product"><span>${(cartList?.getAt('productName'))}</span></li>
                <li class="price">रु ${(cartList?.getAt('productPrice'))}</li>
            </ul>
        </g:each>
        %{--<div class="bottom"><span class="total">Total</span><span class="price">रु 3245235</span></div>--}%
        <div class="checkout" title="Add all to cart"><a href="#">Add all to Cart</a>
            </div>
    </div>
    </g:else>
</div>
<!----SCRIPT---->
</body>
</html>
