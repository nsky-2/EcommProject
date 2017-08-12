package himalayanecomm

import HMEcomm.Cart
import HMEcomm.Product
import HMEcomm.Wishlist

class CartService {

    def cartListForUser(user) {
        return Cart.findAllByCustomerAndIsDeletedAndStatusIsNull(user,false)
    }

    def wishListForUser(user) {
        return Wishlist.findAllByCustomerAndIsDeleted(user,false)
    }

    def saveToCart(productId, type, quantity, customer){
//        println "params = $params"
        def product = Product.findById(productId)
        println "product = $product"

        if(type == 'cart'){
            Cart cart = Cart.findByProductAndCustomerAndStatusIsNull(product, customer)
            println "cart = $cart"
            if(cart){
                return false
//                render "already in cart"
            } else {
                cart = new Cart()
                cart.customer=customer
                cart.product = product
                cart.quantity = quantity?Integer.parseInt(quantity):1
                if(cart.save(flush: true, failOnError: true)){
                    println "cart = $cart"
                    return true
//                    render "added to cart"
                }
            }
        } else if(type == 'wishlist'){
            Wishlist wishlist= Wishlist.findByProductAndCustomer(product,customer)
            println "wishlist = $wishlist"
            if(wishlist){
                return false
//                render "already in wishlist"
            } else {
                wishlist = new Wishlist()
                wishlist.product = product
                wishlist.customer = customer
//                wishlist.quantity = Integer.parseInt(quantity)
                if(wishlist.save(flush: true, failOnError: true)){
                    println "wishlist = $wishlist"
                    return true
//                    render "added to wishlist"
                }
            }
        }

    }
}
