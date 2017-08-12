package HMEcomm

/**
 * Created by sumit on 2/14/2017.
 */
class Customer {
    String title
    String firstName
    String lastName
    String email
    String username
    String password
    String phone
    String address
    String country
    String state
    String city
    String postalCode
    boolean isDeleted

    Cart cart
    Wishlist wishlist
    OrderPlaced orderPlaced
    static constraints = {
        state nullable: true
        city nullable: true
        postalCode nullable: true
        isDeleted defaultValue:false
        email email: true
        address nullable: true
        cart nullable: true
        wishlist nullable: true
        orderPlaced nullable: true
        ratings nullable: true
        reviews nullable: true


    }
    Reviews reviews
    Ratings ratings

    def getFullName(){
        return (firstName + " " + lastName)
    }

}
