<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="finalSidebar"/>
    <title> Store </title>
</head>
<body>
<div id="cartBodyWrap">
<div class="cartWrapper">
    <div class="header">You've ordered...</div>
    <div class="tableWrapper">
        <table>

            <tr>
                <th class="id">S.N.</th>
                <th></th>
                <th>Name</th>
                <th>Code No.</th>
                <th>Price</th>
                <th class="centerText">Quantity</th>
                <th class="centerText">Total</th>
            </tr>
            <g:each in="${(itemListCart)}" var="cartList" status="i">
                <tr>
                    <td class="id">${(i+1)}</td>
                    <td class="productImage"><img src="${createLink(controller:'product', action:'showImage', id: "${cartList?.getAt('productId')}")}" width='150' height='150'/></td>
                    <td>${(cartList?.getAt('productName'))}</td>
                    <td>${(cartList?.getAt('productCode'))}</td>
                    <td>${(cartList?.getAt('productPrice'))}</td>
                    <td class="centerText">${(cartList?.getAt('quantity'))}</td>
                    <td class="centerText">${(cartList?.getAt('total'))}</td>
                    %{--<td><div class="comment"><a href="${(createLink(controller: 'cart', action:'deleteFromCart', params: [cartListId:cartList.getAt('productId')]))}"><i class="fa fa-trash-o"></i></a></div></td>--}%
                </tr>
            </g:each>

            <tr>
                <td colspan="5"></td>
                <td class="total">Grand Total</td>
                <td class="grandTotal">${(grandTotal)}</td>
                %{--<td><div class="checkout"><a href="#" onclick="placeOrder()">Check out</a></div></td>--}%
            </tr>
        </table>
    </div>

</div>
    <div class="orderSummary">
        <div class="name">Order Summary</div>
        <g:each in="${(itemListCart)}" var="cartList" status="i">
            <ul class="order">
                <li class="product"><span>${(cartList?.getAt('productName'))}</span></li>
                <li class="price">?? ${(cartList?.getAt('productPrice'))}</li>
            </ul>
        </g:each>
        <div class="bottom"><span class="total">Total</span><span class="price">?? 3245235</span></div>
        <div class="orderDate">Ordered Date<span>2017/05/23 11:23PM</span></div>
        <div class="orderStatus">Ordered Status<span>Pending</span></div>
        <div class="agentName">
            Agent Detail
            <ul>
                <li class="names">Name</li>
                <li class="info">Agent Name</li>
                <li class="names">Contact No.</li>
                <li class="info"> 97429743</li>
                <li class="names"> E-mail</li>
                <li class="info"> something@gmail.com</li>
            </ul>
        </div>
    </div>
</div>
%{--</div>--}%
<!----SCRIPT---->
<script type="text/javascript" src="${request.contextPath}/ecommThemes/js/sidebar.js"></script>

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
</body>
</html>
		