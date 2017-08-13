package himalayanecomm

import HMEcomm.Category
import HMEcomm.Product
import HMEcomm.SubCategory


class EcommService {

    def cartService

    def allMap() {
        def resultMap = [:]
        def category=Category.createCriteria().list {
            eq('deleted', false)
        }
        category.each {cat ->
            def subMap = [:]
            def subcategory = SubCategory.findAllByCategoryAndDeleted(cat, false)
            subcategory.each {subCat ->
                def product = Product.findAllByCategoryAndSubCategoryAndIsDeleted(cat, subCat, false)
                subMap.put(subCat.name, product)
            }
            resultMap.put(cat.name, subMap)
        }
        return resultMap
    }

    def itemsInCartList(carts){
        def allMap=allMap()

        println "cart = $carts"
        def itemListCart=[]
        def grandTotal=0

        carts.each {cart->
            int total= (cart?.product?.price)*(cart?.quantity)
            def cartItemMap=[:]
            cartItemMap.put('productId',cart?.product?.id)
            cartItemMap.put('productName',cart?.product?.name)
            cartItemMap.put('productCode',cart?.product?.code)
            cartItemMap.put('productPrice', cart?.product?.price)
            cartItemMap.put('productAvailableQuantity',cart?.product?.availableQuantity)
            cartItemMap.put('quantity',cart?.quantity)
            cartItemMap.put('total',total)
            grandTotal+=total
            itemListCart.add(cartItemMap)
        }

        return itemListCart
    }
}
