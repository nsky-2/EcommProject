package himalayanecomm

import HMEcomm.OrderPlaced
import HMEcomm.User

class AdminController {


    def index() {

    }

    def adminLogin(){}

    def validateUser(){
        def uname=params?.username
        println "uname = $uname"
        def passwd=params?.password
        println "passwd = $passwd"


        User user=User.findByUsernameAndPasswordAndIsDeleted(uname,passwd,false)
        println "user = $user"
        if(user)
        {
            session.user =user
            if(user?.role=='ADMIN') {
                redirect(controller: 'admin', action: 'adminMain')
            }
            else if (user?.role=='AGENT')
                    {
                        redirect(controller: 'agent', action: 'agentMain')
                    }

        }
        else
        {
            render (view: "adminLogin", model: [access:"false"])
        }


    }

    def save() {

    }

    def adminMain(){
        def order=OrderPlaced.findAllByStatusAndIsDeleted("Pending",false)
        def numberOfOrders=order.size()
        println "numberOfOrders = $numberOfOrders"
        println "order = $order"
        [order:order,numberOfOrders:numberOfOrders]
    }

    def upload(){

    }

    def logout(){
            session.user=null
            session.invalidate()
            redirect(controller: 'admin',action: 'adminLogin')
    }

    def profile(){
        User user=User.findById(session?.user?.id)
        [user:user]
    }

    def editProfile(){
        User user=User.findById(params?.userId?.toLong())
        [user:user]
    }

    def saveProfile(){
        User user
        user=User.findById(params?.userId.toLong())
        user.firstName=params?.firstName
        user.lastName=params?.lastName
        user.contactNo=params?.contactNo
        user.emailID=params?.email
        user.username=params?.username
        user.password=params?.username
        user.address=params?.address
        user.city=params?.city
        user.state=params?.state
        user.postalCode=params?.postalCode
        user.country=params?.country
        if(user?.role=="ADMIN")
        {
            user.role="ADMIN"
        }
        else{
            user.role="AGENT"
        }
        if(user.save(flush: true,failOnError: true))
                {
                        redirect(controller: 'admin', action: 'profile')
                }
        else
        {
            redirect(controller: 'admin',action: 'adminMain')
        }

    }
}
