package himalayanecomm

import HMEcomm.Customer

class CustomerService {

    def serviceMethod() {

    }

    def loggedInCheck(customer){
//        Customer customer=session?.user
        println "customer = $customer"
        if(customer){
            println "hello!! logged in"
            return true
//            redirect(controller: "ecomm", action: "addToCart")
        }
        else
        {
            println "Login man"
            return false
//            render template: "/layouts/login"
        }
    }
}
