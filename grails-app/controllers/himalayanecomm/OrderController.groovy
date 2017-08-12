package himalayanecomm

import HMEcomm.Cart
import HMEcomm.Customer
import HMEcomm.OrderPlaced
import HMEcomm.User
import sun.management.Agent

import javax.persistence.criteria.Order
import java.text.SimpleDateFormat

class OrderController {
    def cartService
    def ecommService

    def check(){
        Date date=new Date()
        SimpleDateFormat dateFormatter= new SimpleDateFormat("yyyyMMdd-hhmmss")
        def format=dateFormatter.format(date)
        println "format = $format"

    }

    def placeOrder(){
//        Date formarttedDate= new Date()
        def mili = System.currentTimeMillis()
//        SimpleDateFormat dateFormatter= new SimpleDateFormat("yyyyMMdd-hhmmss")
        def customer = session.user
        def orderid= customer.id + "_" + mili
        println "orderid = $orderid"
        def cartList = cartService.cartListForUser(customer)

        OrderPlaced order = new OrderPlaced()
        order.status = 'Pending'
        order.customer = customer
        order.cart = cartList?.id?.toString()?.replaceAll('\\[','')?.replaceAll('\\]', '')
        order.OrderID=orderid
        order.orderedPlacedDate=new Date()
        if (order.save(flush: true, failOnError: true)){
            cartList.each {cartItem ->
                cartItem.status = 'Pending'
                cartItem.orderId = orderid
                cartItem.save(flush: true, failOnError: true)
            }
        }
        println "Successful = Successful"
//        render "order placed successfully"
        redirect(controller: "order", action: 'viewOrderHistory')
    }

    def viewOrderHistory(){
        def allMap=ecommService.allMap()
        def id=session?.user?.id
        def customer=Customer?.findById(id)
        println "customer = $customer"
        def order= OrderPlaced.findAllByCustomer(customer)
        println "order = $order"
        def cart= order.cart?.toList()
        println "cart = $cart"
        def itemListCart=[]
        def grandTotal=0
        if(cart?.size()>0) {
            cart.get(0).split(',')?.each { cartItem ->
                def cartt = Cart.findById(cartItem?.toLong())
                println "cartt = $cartt"
                int total = (cartt?.product?.price) * (cartt?.quantity)
                grandTotal += total
            }
        }
//        cartList.each {cartItem ->
//            cartItem.
//        }
        [order:order,customer:customer, allMap:allMap, itemListCart:itemListCart,grandTotal: grandTotal]
    }

    def viewAllOrders(){
        def orderedAll= OrderPlaced.createCriteria().list {
            eq('isDeleted',false)
        }
        def order=OrderPlaced.findAllByStatusAndIsDeleted("Pending",false)
        def numberOfOrders=order.size()
        println "numberOfOrders = $numberOfOrders"
        println "ordered = $orderedAll"
        println "order = $order"
        [order: order,orderedAll:orderedAll,numberOfOrders:numberOfOrders]
    }

    def detailsForAgentSelection(){
        OrderPlaced order= OrderPlaced.findById(params?.orderId.toLong())
        def country=order?.customer?.country
        def user=User.findAllByCountryAndRole(country,"agent")
        println "user = $user"
        [order:order,user:user]
    }

    def assignAgent(){
        User user=User.findByFirstName(params?.agent)
        OrderPlaced order= OrderPlaced.findById(params?.orderId.toLong())
        order.user=user
        order.status="Processing"
        if(order.save(flush: true, failOnError: true))
        {
            def cartList = Cart.findAllByOrderId(order?.orderID?.toString())
            cartList.each { cartItem ->
                cartItem.status = "Processing"
                cartItem.save(flush: true, failOnError: true)
            }

            redirect(controller: 'order',action: 'viewAllOrders')
        }
        else{
            render"Error"
        }


    }

    def itemsInOrderList(){
        def allMap=ecommService.allMap()
        def order=OrderPlaced.findAllById(params?.orderID.toLong())
        def cart= order.cart?.toString()?.trim()?.replaceAll('\\[','')?.replaceAll('\\]', '').split(',')
        println "cart = $cart"
        def itemListCart=[]
        def grandTotal=0
        cart.each {cartItem ->
            def cartt = Cart.findById(cartItem?.toLong())
            println "cartt = $cartt"
            def cartItemsInOrderMap=[:]
            int total= (cartt?.product?.price)*(cartt?.quantity)
            cartItemsInOrderMap.put('productId',cartt?.product?.id)
//                cartItemMap.put('productPic',cart?.product?.photo)
            cartItemsInOrderMap.put('productName',cartt?.product?.name)
            cartItemsInOrderMap.put('productCode',cartt?.product?.code)
            cartItemsInOrderMap.put('productPrice', cartt?.product?.price)
            cartItemsInOrderMap.put('quantity',cartt?.quantity)
            cartItemsInOrderMap.put('total',total)
            grandTotal+=total
            itemListCart.add(cartItemsInOrderMap)
        }
//        cartList.each {cartItem ->
//            cartItem.
//        }
        [order:order, allMap:allMap, itemListCart:itemListCart,grandTotal:grandTotal]
    }

    def newOrders(){
        def order=OrderPlaced.findAllByStatusAndIsDeleted("Pending",false)
        def numberOfOrders=order.size()
        println "numberOfOrders = $numberOfOrders"
        println "order = $order"
        [order:order,numberOfOrders:numberOfOrders]

    }
}
