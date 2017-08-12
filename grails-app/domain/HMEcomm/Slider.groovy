package HMEcomm

/**
 * Created by sumit on 7/4/2017.
 */
class Slider {
    String title
    String photo
    String status //active or disabled
    boolean isDeleted


    static constraints = {
        photo(nullable:true, maxSize: 1024 * 1024 * 2 /* 2MB */)
        isDeleted defaultValue: false
    }
}
