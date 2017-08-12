package HMEcomm

/**
 * Created by sumit on 5/21/2017.
 */
class Cart {
    int quantity
    boolean isDeleted

    Product product
    Customer customer
    String status
    String orderId

    static constraints = {
//        customer nullable: true
        status nullable: true
        orderId nullable: true
        isDeleted defaulValue:false

    }

}
