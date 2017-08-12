package HMEcomm

/**
 * Created by sumit on 2/10/2017.
 */
class Category {
    String code;
    String name
    String description
    boolean deleted

    static hasMany = [subcategory:SubCategory, product:Product]
}
