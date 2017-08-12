package HMEcomm

class OrderPlaced {

    String status
    String OrderID
    String trackingID
    Customer customer
    String cart
    User user
    Date orderedPlacedDate
    boolean isDeleted

    static constraints = {
        trackingID nullable: true
        user nullable: true



    }
}
