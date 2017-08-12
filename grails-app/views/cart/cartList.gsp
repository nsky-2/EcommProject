<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="finalSidebar"/>
    <title> Store </title>
</head>
<body>
<span class="iconSidebar" ><span title="Category Menu"><i class="fa fa-bars"></i></span></span>
<div class="sidebarWrap">
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
</div>

<div id="cartBodyWrap">
    <div class="cartWrapper">
        <div id="breadcrumbs"><span class="home">Home</span> <span class="icon"><i class="fa fa-angle-double-right"></i> </span> <span class="first">Cart List</span></div>

        <div class="header">Cart List</div>
    <g:if test="${itemListCart.size() == 0}">
        <div id="noOrderHistory">
            <div class="bodyMain">
                <span><img src="${request.contextPath}/ecommThemes/images/sad.jpg"></span>
                <div class="textBig">Sorry user</div>
                <div class="textMid">Your cart is currently empty. </div>
                <div class="textBot">Click below to shop more...</div>
                <div class="btn"><a href="${createLink(controller: 'ecomm', action: 'initial')}" ><span>Continue Shopping</span></a></div>
            </div>
        </div>
    </g:if>
    <g:else>
        <div class="tableWrapper">

    <table>
                <tr>
                    %{--<th class="id">S.N.</th>--}%
                    <th>Product</th>
                    <th>Name</th>
                    <th>Code No.</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th class="centerText">Total</th>
                    <th></th>
                </tr>
                <g:each in="${(itemListCart)}" var="cartList" status="i">
                    <tr>
                        %{--<td class="id">${(i+1)}</td>--}%
                        <td class="productImage"><img src="${createLink(controller:'product', action:'showImage', id: "${cartList?.getAt('productId')}")}" width='150' height='150'/></td>
                        <td>${(cartList?.getAt('productName'))}</td>
                        <td>${(cartList?.getAt('productCode'))}</td>
                        <td>‎रु ${(cartList?.getAt('productPrice'))}</td>
                        <td class="quantity">
                            <span class="fa minus"> - </span>
                            <input type="number"  max="${(cartList?.getAt('productAvailableQuantity'))}" min="1" value="1" class="fieldQuantity"/>
                            <span class="fa plus" > + </span>
                        </td>
                        <td class="centerText">‎रु ${(cartList?.getAt('total'))}</td>
                        <td class="delete"><a title="Delete" href="${(createLink(controller: 'cart', action:'deleteFromCart', params: [cartListId:cartList.getAt('productId')]))}"><i class="fa fa-trash-o"></i></a>
                            <a onclick="addToCart('wishlist', ${cartList?.getAt('productId')}, '${g.createLink(controller:'ecomm',action:'addToCart')}')" title="Add to WishList" class="wish"><i class="fa fa-heart-o"></i> </a>
                        </td>
                    </tr>
                </g:each>

                <tr>
                    <td colspan="4"></td>
                    <td class="total"> Grand Total</td>
                    <td class="grandTotal" colspan="2">‎रु ${(grandTotal)}</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="orderSummary">
        <div class="name">Order Summary</div>
        <g:each in="${(itemListCart)}" var="cartList" status="i">
            <ul class="order">
                <li class="product"><span>${(cartList?.getAt('productName'))}</span></li>
                <li class="price">रु ${(cartList?.getAt('productPrice'))}</li>
            </ul>
        </g:each>
        <div class="bottom"><span class="total">Total</span><span class="price">रु ${(grandTotal)}</span></div>
        <div class="checkout" title="Order Product"><a href="${createLink(controller: 'order', action: 'placeOrder')}">Order Now</a>
            %{--onclick="placeOrder()--}%
        </div>
    </div>
</g:else>
</div>
<script>
    $(document).ready(function() {
        $(".quantity .fa").on("click", function() {
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
        $('.iconSidebar').click(function(){
            $('.sidebarWrap').toggle();
            $(this).toggleClass('active');
        });
    });
</script>
<script>
    function placeOrder(){

        $.ajax({
            type : "post",
            url : "${createLink(controller: 'order', action: 'placeOrder')}",
//            success : function (data){
//                if(data == 'order placed successfully'){
//                   alert("Your order has been placed successfully!!");
//                        window.location.href = '/HimalayanEcomm/order/viewOrderHistory';
//                    window.reload();
                }
            }
        });
    }
</script>
</body>
</html>
		