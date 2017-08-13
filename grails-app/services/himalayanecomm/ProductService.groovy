package himalayanecomm

import HMEcomm.Cart
import HMEcomm.Category
import HMEcomm.Product
import HMEcomm.SubCategory

class ProductService {

    def serviceMethod() {

    }

    def saveProduct(def params, def fileName){
        Category category=Category.findByName(params?.category)
        SubCategory subCategory=SubCategory.findByName(params?.subCategory)
        Product product=new Product()
        product.code=params?.code
        product.name=params?.name
        product.description=params?.desc
        product.price=Double.parseDouble(params?.price)
        product.availableQuantity=Integer.parseInt(params?.availableQty)
        product.totalQuantity=Integer.parseInt(params?.totalQty)
//        def uploadedPic = params.photo
//        product.photo=uploadedPic.getBytes()
        product.photo=fileName
        product.availability=params?.availability
        product.category=category
        product.subCategory=subCategory
//        CommonsMultipartFile file = params.list("photo")?.getAt(0)



        if(product.save(flush: true, failOnError: true))
        {
           return true
        }
        else
        {
            return false
        }


    }

    def editProduct(def params, def fileName){
        Product product=Product.findById(params?.id)
        Category category=Category.findByName(params?.category)
        SubCategory subCategory=SubCategory.findByName(params?.subCategory)
        product.code=params?.code
        product.name=params?.name
        product.description=params?.desc
        product.price=Double.parseDouble(params?.price)
        product.availableQuantity=Integer.parseInt(params?.availableQty)
        product.totalQuantity=Integer.parseInt(params?.totalQty)
//        def uploadedPic = params.photo
//        product.photo=uploadedPic.getBytes()
        product.photo=fileName
        product.availability=params?.availability
        product.category=category
        product.subCategory=subCategory
//        CommonsMultipartFile file = params.list("photo")?.getAt(0)



        if(product.save(flush: true, failOnError: true))
        {
            return true
        }
        else
        {
            return false
        }



    }

    def numberOfItemsAvailable(Product product){
        List<Cart> cartList = Cart.findAllByProductAndIsDeleted(product, false)
        int orderedCount = cartList.size()
        int totalCount = product.availableQuantity
        int availbaleCount = totalCount - orderedCount
        return availbaleCount
    }
}
