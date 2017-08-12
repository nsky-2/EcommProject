package HMEcomm

/**
 * Created by sumit on 2/11/2017.
 */
class User {
    String username
    String password
    String role
    String firstName
    String lastName
    String emailID
    String contactNo
    String country
    String city
    String state
    String address
    String postalCode
    boolean isDeleted

    static hasMany = [orderPlaced: OrderPlaced]

    static constraints = {
        username unique: true, nullable: false
        password nullable: false

    }

    def getFullName(){
        return (firstName +" " + lastName)
    }
}
