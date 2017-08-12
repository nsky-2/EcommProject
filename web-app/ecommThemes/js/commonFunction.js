/**
 * Created by sumit on 7/3/2017.
 */

function addToCart(type, productId, url){
    //alert("add to cart isssss ======= " +productId)
    var quantity = $('#quantityForm :input[name="quantity"]').val()
    $.ajax({
        type : "post",
        data : {productId: productId, quantity: quantity, type: type},
        url : url,
        success : function (data){
            console.log("on success")
            console.log("test==============" +data)
            if(data == "added to cart"){
                console.log("added to cart")
                $('#anchorCart').click();
            } else if(data == 'already in cart'){
                console.log("already in cart")
                //$('#popCart .cartMessage span').text('Product is already in the cart')
                $('#anchorCart').click();
            }else if(data == "added to wishlist"){
                console.log("added to wishlist")
                $('#anchorWishlist').click();
            } else if(data == 'already in wishlist'){
                console.log("already in cart")
                //$('#popWish .cartMessage span').text('Product is already in the wishlist')
                $('#anchorWishlist').click();
            } else if(data == 'login'){
                console.log("show login popup man!!")
                $('#loginHref').click();
            } else if (data == 'cart list') {
                console.log("now showing cartlist")
                //$('#divCreateLink').show();
                //$('#createLinkCartList').click();
                window.location.href = '/HimalayanEcomm/cart/cartList';

            }else if(data == 'wish list'){
                console.log("now showing wishlist")
                window.location.href = '/HimalayanEcomm/cart/wishList';
            }
        }
    });
}
