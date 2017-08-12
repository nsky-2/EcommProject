package himalayanecomm

import HMEcomm.Reviews

class ReviewController {

    def index() {}

    def reviewList()
    {
        def reviews=Reviews.findAllByStatus("NotApproved")
        def noOfReviews=reviews?.size()
        println "reviews = $reviews"
        [reviews:reviews , noOfReviews:noOfReviews]
    }

    def approveReview(){
        def reviews=Reviews.findById(params?.reviewId)
        reviews.status="Approved"
        if (reviews.save(flush: true, failOnError: true)){
            redirect(controller: "review", action: "allReviewList")
        }
    }

    def allReviewList()
    {
        def reviews=Reviews.findAll()
        [reviews:reviews]
    }
}
