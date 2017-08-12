package himalayanecomm

import HMEcomm.Customer

class CustomerController {

    def index() {}

    def userCheck()
    {
        println "CustomerController.loginCustomer"
        def uname=params?.username
        println "uname = $uname"
        def pword=params?.password
        println "pword = $pword"
        println "params = $params"

        Customer customer=Customer.findByUsernameAndPasswordAndIsDeleted(uname, pword, false)
        if(customer)
            render "valid"
        else
            render "invalid"
    }

    def loginCustomer(){
        println "CustomerController.loginCustomer"
        def uname=params?.username
        println "uname = $uname"
        def pword=params?.password
        println "pword = $pword"
        println "params = $params"

        Customer customer=Customer.findByUsernameAndPasswordAndIsDeleted(uname, pword, false)
        println "customer = $customer"
        if(customer) {
            session.user = customer
            if (params.addToCart == 'true'){
                redirect(controller: "ecomm", action: "addToCart")
            } else if(params.viewCart == 'true'){
                redirect(controller: "cart", action: "cartList")
            }else {
                redirect(controller: "ecomm", action: "initial")
            }
        }
        else
        {
            render "error"
        }
    }

    def createCustomer() {
        Customer customer = new Customer()
        customer.title=params?.title
        customer.firstName = params?.firstName
        customer.lastName = params?.lastName
        customer.email = params?.email
        customer.username = params?.username
        customer.password = params?.password
        customer.country = params.country
        customer.phone = params?.contact

        if(customer.save(flush: true, failOnError: true)) {
            println "customer = $customer"
            redirect(controller: 'ecomm',action: 'initial')
//            render "Successfully Created"
        }
    else
        {
            redirect(controller: 'ecomm',action: 'errorPage')
        }
    }

    def logout(){

            session.user=null
            session.invalidate()
            redirect(controller: 'ecomm', action: "initial")
        }

    def viewCustomer(){
        def customer=Customer.findAllByIsDeleted(false)
        println "customer = $customer"
        [customer:customer]
    }

    def customerDetail(){
        Customer customer=Customer?.findById(params?.customerId.toLong())
        println "customer = $customer"
        [customer:customer]

    }

    def editPersonalInfo()
    {
        Customer customer
        customer=Customer?.findById(params?.customerId?.toLong())
        customer.firstName=params?.firstName
        customer.lastName=params?.lastName
        customer.email=params?.email
        customer.username=params?.username
        customer.country=params?.country
        customer.phone=params?.phone

        if(customer.save(flush: true, failOnError: true)) {
            println "customer = $customer"
            redirect(controller: 'order',action: 'viewOrderHistory')
//            render "Successfully Created"
        }
        else
        {
            redirect(controller: 'ecomm',action: 'errorPage')
        }

    }

    def changePassword(){
        Customer customer=Customer.findById(params?.customerId?.toLong())
        def oldPassword=params?.password
        if(customer?.password==oldPassword){
            customer.password=params?.newPassword
            if(customer.save(flush: true, failOnError: true))
            {
                redirect(controller: 'order',action: 'viewOrderHistory')

            }

        }
        else
        {
            redirect(controller: 'order',action: 'viewOrderHistory', params: [access: "false"])

        }
    }

    def changeAddressInfo(){
        Customer customer=Customer.findById(params?.customerId?.toLong())
        customer.country=params?.country
        customer.state=params?.state
        customer.city=params?.city
        customer.address=params?.address
        customer.postalCode=params?.postalCode
        customer.email=params?.email
        customer.phone=params?.phone
        if(customer.save(flush: true, failOnError: true))
        {
            redirect(controller: 'order',action: 'viewOrderHistory')

        }
        else
        {
            redirect(controller: 'order',action: 'viewOrderHistory', params: [access: "false"])

        }

    }

//    def rateAndReview(){
//        def id=session?.user?.id
////        Customer customer=Customer.findById(id)
////        customer.
//    }


}
