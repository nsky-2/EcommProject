package HMEcomm

/**
 * Created by sumit on 2/11/2017.
 */
class SubCategory {
    String name
    String code
    String description
    boolean deleted

    static belongsTo = [category:Category]

    static  hasMany = [product:Product]
}
