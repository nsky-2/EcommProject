package HMEcomm

/**
 * Created by sumit on 2/10/2017.
 */
class Product {
    String code
    String name
    String description
    double price
    int availableQuantity
    int totalQuantity
    String photo
    String availability
    boolean isDeleted
    Date dateCreated
//    Date dateUpdated
    Date lastUpdated


    static belongsTo = [subCategory:SubCategory, category:Category]
//    static hasMany = [reviews:Reviews]
    Ratings ratings
    Reviews reviews
    static constraints = {
        photo(nullable:true, maxSize: 1024 * 1024 * 2 /* 2MB */)
        dateCreated nullable: true, default:null
        lastUpdated nullable: true, default:null
        reviews nullable: true
        ratings nullable: true
    }
}

