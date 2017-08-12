package himalayanecomm

import HMEcomm.Cart
import HMEcomm.Product
import HMEcomm.Wishlist

class CartController {
    def ecommService
    def customerService
    def cartService

    def index() {}



    def checkCartList(){
        def sessionUser = session?.user
        println "sessionUser = $sessionUser"
        if(customerService.loggedInCheck(sessionUser)){
            render "cart list"
        } else {
            println "Show Popup"
                render "login"
//            render (template: "/layouts/login", model: [viewCart: true])
        }


    }

    def checkWishlist(){
        def sessionUser = session?.user
        if(customerService.loggedInCheck(sessionUser)){
            render "wish list"
        } else {
            render "login"
            println "Show Popup...inside wishlist"
//            render (template: "/layouts/login", model: [viewCart: true])
        }
    }

    def cartList() {
        def allMap=ecommService.allMap()
        def carts=cartService.cartListForUser(session.user)
        println "cart = $carts"
        def itemListCart=[]
        def grandTotal=0

        carts.each {cart->
            int total= (cart?.product?.price)*(cart?.quantity)
            def cartItemMap=[:]
            cartItemMap.put('productId',cart?.product?.id)
//                cartItemMap.put('productPic',cart?.product?.photo)
            cartItemMap.put('productName',cart?.product?.name)
            cartItemMap.put('productCode',cart?.product?.code)
            cartItemMap.put('productPrice', cart?.product?.price)
            cartItemMap.put('productAvailableQuantity',cart?.product?.availableQuantity)
            cartItemMap.put('quantity',cart?.quantity)
            cartItemMap.put('total',total)
            grandTotal+=total
            itemListCart.add(cartItemMap)
        }
//        def

        println "itemListCart = $itemListCart"
        [allMap:allMap, itemListCart:itemListCart, grandTotal:grandTotal]
    }

    def wishList()
    {
        def allMap=ecommService.allMap()
        def wishList=cartService.wishListForUser(session.user)
        def itemWishlist=[]
        wishList.each {cart->
            def wishListItemMap=[:]
            wishListItemMap.put('productId',cart?.product?.id)
            wishListItemMap.put('productName',cart?.product?.name)
            wishListItemMap.put('productCode',cart?.product?.code)
            wishListItemMap.put('productPrice', cart?.product?.price)
//            wishListItemMap.put('quantity',cart?.quantity)
//            wishListItemMap.put('total',total)
//            grandTotal+=total
            itemWishlist.add(wishListItemMap)
        }
        println "itemWishlist = $itemWishlist"
        [allMap:allMap, itemWishlist:itemWishlist]
    }



    def deleteFromCart(){
        def product = Product.findById(params.cartListId?.toLong())
        def productInCart= Cart?.findByProductAndStatusIsNull(product)
        productInCart.isDeleted=true
        println "productInCart = $productInCart"
        if(productInCart.save(flush: true, failOnError: true))
        {
            redirect(controller: 'cart', action: 'cartList')
        }
        else {
            redirect(controller: 'ecomm', action: 'errorPage')

        }
    }

    def deleteFromWishlist(){
        def product = Product.findById(params.cartListId?.toLong())
        def productInWishlist= Wishlist?.findByProductAndCustomer(product,session?.user)
        println "productInWishlist = $productInWishlist"
        productInWishlist.isDeleted=true
        if(productInWishlist.save(flush: true, failOnError: true))
        {
            redirect(controller: 'cart', action: 'wishList')
        }
        else {
            redirect(controller: 'ecomm', action: 'errorPage')

        }
    }
}
