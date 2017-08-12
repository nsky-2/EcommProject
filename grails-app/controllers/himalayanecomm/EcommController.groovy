package himalayanecomm

import HMEcomm.Cart
import HMEcomm.Category
import HMEcomm.Customer
import HMEcomm.OrderPlaced
import HMEcomm.Product
import HMEcomm.Ratings
import HMEcomm.Reviews
import HMEcomm.SubCategory
import HMEcomm.Wishlist
import org.apache.mahout.cf.taste.common.TasteException
//import org.apache.mahout.cf.taste.impl.model.file.FileDataModel
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity
import org.apache.mahout.cf.taste.model.DataModel
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood
import org.apache.mahout.cf.taste.recommender.RecommendedItem
import org.apache.mahout.cf.taste.recommender.Recommender
import org.apache.mahout.cf.taste.similarity.UserSimilarity
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel

import javax.persistence.criteria.Order

class EcommController {
    def ecommService
    def customerService
    def cartService

    def index() {
//        def map = ecommService.allMap()
//
//        println "map = $map"
//
//        [map: map]

    }

    def loginCustomer(){
        def uname=params?.username
        println "uname = $uname"
        def pword=params?.password
        println "pword = $pword"

        Customer customer=Customer.findByUsernameAndPasswordAndIsDeleted(uname, pword, false)
        println "customer = $customer"
        if(customer) {
            session.user = customer
            redirect(controller: "ecomm", action: "initial")
        }

    }

    def categorySidebar(){
        def allMap=ecommService.allMap()
        [allMap:allMap]
    }

    def categorySidebarv2(){
        def allMap=ecommService.allMap()
        [allMap:allMap]
    }

    def finalSidebar(){

    }

    def initial(){
        def customer=(session?.user)
//        println "customer = $customer"
        def customerName=customer?.firstName
        println "customerName = $customerName"
        def allMap=ecommService?.allMap()
        def category=Category.findAll()
        def subCategory= SubCategory.findAll()
        def product=Product.findAll()
        println "product = $product"
        def productNameList=product?.name
        def categoryNameList=category?.name
        def subCategoryNameList=subCategory?.name
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -1);
        Date lowerLimit = cal.getTime();
        Date higherLimit = new Date()
        def latestProduct = Product.findAllByLastUpdatedBetween(lowerLimit, higherLimit).sort {it.lastUpdated}
        Collections.reverse(latestProduct)
        println "latestProduct = $latestProduct"
        def order = Cart.createCriteria().list {
            projections {
                groupProperty ('product', 'product')
                count ('id', 'productCount')
            }
            order('productCount', 'desc')
            maxResults(5)
        }
        def trendingProducts = []
        order.each {
            trendingProducts.add(it?.getAt(0))
        }
        println "order ==== $order"
        println "trendingProducts = $trendingProducts"

        def cartlist=Cart.findAllByCustomerAndIsDeletedAndStatusIsNull(customer,false)
        def cartListSize=cartlist?.size()
        println "cartListSize = $cartListSize"
        [customerName:customerName,product:product, latestProduct:latestProduct, trendingProducts:trendingProducts, allMap: allMap, productName:productNameList, categoryName:categoryNameList, subCategoryName:subCategoryNameList]
    }

    def productDetail(){
        println "EcommController.productDetail"
        println "params = $params"
        def allMap=ecommService?.allMap()
        def productId=params?.productId?.toLong()
        println "productId = $productId"

        def product=Product.findById(productId)
        println "product = $product"
        def category=product.category
        def topTwoRecomm=product.createCriteria().list(max: 3) {
            eq("category",category)
            ne('id', productId)
        }
        println "topTwoRecomm = $topTwoRecomm"

        dbToCsv()

        def customer=session?.user
        def productList = []
        if(customer){
            productList = productRecommendation(3)
        }

        def rate=Ratings.findByCustomerAndProduct(customer,product)
        def ratedValue= rate?.rate
        println "rate = $ratedValue"

        def reviews=Reviews.findByProductAndStatus(product,"Approved")
        println "reviews = $reviews"
        [product:product, topTwoRecomm:topTwoRecomm, allMap: allMap, ratedValue:ratedValue, reviews:reviews, productList:productList]
    }

    def productInfoo(){
        def allMap=ecommService?.allMap()
        [allMap:allMap]
    }

    def addToCart(){
        println "EcommController.addToCart"
        println "params = $params"
        if(customerService.loggedInCheck(session?.user)){
            if (cartService.saveToCart(params.productId?.toLong(),params.type, params.quantity?.toString(),session.user)){
                println "added"
                render "added to " + params.type
            } else {
                println "alreadyyy"
                render "already in "+params.type
            }
        } else {
            println "template here"
//           render (template: "/layouts/login", model: [addToCart: true])
//            render (template: "/layouts/login", model: [addToCart: true])
            render "login"

        }

    }

    def search(){
        def searched=params?.search
        println "searched = $searched"
        Product product=Product?.findByName(searched)
        println "product = $product"
        def productId= product?.id
        redirect(controller: 'ecomm',action: 'productDetail', params: [productId: productId])

    }

    def errorPage(){

    }

    def whereToGo(){
        if(session?.user?.role=="ADMIN") {
            redirect(controller: 'admin', action: 'adminMain')
        }
        else if (session?.user?.role == "AGENT"){
            redirect(controller: 'agent', action: 'agentMain')
        }
        else{
            redirect(controller: 'ecomm', action: 'initial')

        }
    }

    def productRecommendation(int number){
        long customerId = session?.user?.id
//        customerId = 3
//        number = 1
        def productList = []
        try {
            DataModel model =new FileDataModel(new File("E://data.csv"))
//            ItemSimilarity itemSimilarity = new EuclideanDistanceSimilarity(model)
//            Recommender itemRecommender =new GenericItemBasedRecommender(model, itemSimilarity)
//            List<RecommendedItem> itemRecommendations = itemRecommender.recommend(customerId, number)
//            mRecommendation = $itemRecommendation"

            UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
            UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1, similarity, model);
            Recommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);

            List<RecommendedItem> itemRecommendations = recommender.recommend(customerId, 2);
            println "recommendations = $itemRecommendations"
            //userid=? with two recommednation


            for (RecommendedItem itemRecommendation : itemRecommendations){
                long  productId = itemRecommendation.getItemID()
                Product product = Product.findById(productId)
                productList.add(product)
                println "ERROR = $productId"
                println "itemRecommendation = $itemRecommendation"
            }
            println "userBasedList = $productList"
        } catch (IOException e){
            e.printStackTrace()
        } catch (TasteException e){
            e.printStackTrace()
        }
        return productList
    }


    def dbToCsv(){
        String filename = "F://data.csv";
        try {
            List<Ratings> rs = Ratings.findAll()
            FileWriter fw = new FileWriter(filename);

            rs.each {
                fw.append(it.customer.id.toString());
                fw.append(',');
                fw.append(it.product.id.toString());
                fw.append(',');
                fw.append(it.rate)
                fw.append('\n');
            }
            fw.flush();
            fw.close();
            println("CSV File is created successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
