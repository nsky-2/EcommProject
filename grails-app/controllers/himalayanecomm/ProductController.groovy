package himalayanecomm

import HMEcomm.Product
import HMEcomm.Ratings
import HMEcomm.Reviews
import HMEcomm.SubCategory
import org.apache.mahout.cf.taste.common.TasteException
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity
import org.apache.mahout.cf.taste.model.DataModel
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood
import org.apache.mahout.cf.taste.recommender.RecommendedItem
import org.apache.mahout.cf.taste.recommender.Recommender
import org.apache.mahout.cf.taste.similarity.UserSimilarity
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class ProductController {
    def productService
    def subCategoryService

    def index() {}

    def addProduct(){
        def category=subCategoryService.categoryDropdown()
        println "category=$category"

        def subCategory=subCategoryService.subCategoryDropdown()
        println "subCategory=$subCategory"

        [subCategory:subCategory,category:category]
    }

    def subcat(){
        println "params.category = $params.category"
        def subC = subCategoryService.subCategoryByCategory(params.category)
        println "subC = $subC"
        render (template: "selectSubCategory", model: [subCategory: subC])
    }

    def insertProduct(){
        String imageUploadPath=grailsApplication.config.imageUpload.path
        MultipartHttpServletRequest mpt = (MultipartHttpServletRequest)request;
        CommonsMultipartFile file =(CommonsMultipartFile) mpt.getFile("photo");

        def filename= ''

        try{
            if(file && !file.empty)
            {
                filename= params.code+"_0001.jpg"
                file.transferTo(new File("${imageUploadPath}/${filename}"))
                println "file = $filename"
            }

        }
        catch (Exception e)
        {
            log.error("Your exception here",e)
        }
        if(productService.saveProduct(params, filename)){
            def product=Product.list()
            println "product = $product"
            render (view: 'viewProduct',model: [product:product, imgPath:imageUploadPath])
//            render "success"
        }
        else{
            render "Error"
        }


    }

    def showImage() {
        println "params = $params"
        def productInstance = Product.findByIdAndIsDeleted(params?.id.toLong(),false)
        println "productInstance = $productInstance?.photo"
//  write the image to the output stream
        String imageUploadPath=grailsApplication.config.imageUpload.path
        def file = new File("${imageUploadPath}/${productInstance?.photo}")
        println "file = $file"
        response.setContentType("application/jpg")
        OutputStream out = response.getOutputStream();
        out.write(file.bytes);
        out.close();
        println "out = $out"
//        response.outputStream << productInstance.photo
//        response.outputStream.flush()
    }

//    def showImage(){
//        Product product=Product.list()
//        println "product = $product"
//        [product:product]
//    }

    def viewProduct(){
        def product=Product.createCriteria().list {
            eq('isDeleted',false)
        }
        println "product = $product"
        [product:product]
    }

    def updateProduct(){
        def category=subCategoryService.categoryDropdown()
        println "category=$category"

        def subCategory=subCategoryService.subCategoryDropdown()
        println "subCategory=$subCategory"

        Product product=Product.findById(params?.productID.toLong())
        println "product = $product"


        [subCategory:subCategory,category:category, product: product]
    }

    def editProduct(){
        String imageUploadPath=grailsApplication.config.imageUpload.path
        MultipartHttpServletRequest mpt = (MultipartHttpServletRequest)request;
        CommonsMultipartFile file =(CommonsMultipartFile) mpt.getFile("photo");

        def filename= ''

        try{
            if(file && !file.empty)
            {
                filename= params.code+"_0001.jpg"
                file.transferTo(new File("${imageUploadPath}/${filename}"))
                println "file = $filename"
            }

        }
        catch (Exception e)
        {
            log.error("Your exception here",e)
        }
        if(productService.editProduct(params, filename))
        {
            def product=Product.list()
            println "product=$product"
            render (view: "viewProduct", model: [product: product])
        }
    }

    def deleteProduct(){
        Product product=Product.findById(params?.productID?.toLong())
        println "product=$product"
        product.isDeleted = 'true'
        if(product.save(flush: true ,failOnError: true)){
            redirect(controller: 'product',action: 'viewProduct')
        }
        else
        {
            render "not deleted"
        }
    }

    def rateAndReview(){
        def productId=params?.productId
        Product product=Product.findById(params?.productId.toLong())
        println "product = $product"

        Ratings ratings=new Ratings()
        def rate=params?.rating
        println "rate = $rate"
        ratings.rate=rate
        ratings.product=product
        ratings.customer=session?.user


        Reviews reviews=new Reviews()
        reviews.comment=params?.review
        reviews.status="NotApproved"
        reviews.product=product
        reviews.customer=session?.user
        if(reviews.save(flush: true, failOnError: true) && ratings.save(failOnError: true, flush: true)){
            redirect(controller: "ecomm" , action: "productDetail", params: [productId:productId])
        }
        else
        {
            render "boo :("
        }
    }






}
