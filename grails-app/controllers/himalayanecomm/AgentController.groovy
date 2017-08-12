package himalayanecomm

import HMEcomm.Cart
import HMEcomm.OrderPlaced
import HMEcomm.Product
import HMEcomm.User
import sun.management.Agent

import javax.persistence.criteria.Order

class AgentController {

    def index() {}

    def viewAgent(){
        def agents=User?.findAllByRoleAndIsDeleted("AGENT",false)
        println "agents = $agents"
        [agents:agents]
    }

    def addAgent(){
        User agent=User.findById(params?.agentId?.toLong())
        println "agent = $agent"
        [agent:agent]
    }

    def createAgent(){
        User user
        if(params.agentId){
            user=User.findById(params?.agentId)
        }
        else {
            user = new User()
        }
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
        user.role="AGENT"

        if (user.save(flush: true, failOnError: true))
        {
            println "user = $user"
            def agentId=user?.id
            def done="Created"
            redirect(controller: 'agent',action: 'agentDetails',params: [done:done,agentId:agentId ])
        }
        else
        {
            def done=""
            redirect(controller: 'agent',action: 'viewAgent',params: [done:done])
        }
    }

    def agentDetails(){
        User agent=User.findById(params?.agentId.toLong())
        println "agent = $agent"
        [agent:agent]
    }

    def editAgent(){

    }

    def agentMain(){
        def order=OrderPlaced.findAllByUserAndStatusAndIsDeleted(session?.user,"Processing",false)
        def numberOfOrders=order.size()
        println "numberOfOrders = $numberOfOrders"
        println "order = $order"
        [order:order,numberOfOrders:numberOfOrders]
    }

    def newTask(){
        def order=OrderPlaced.findAllByUserAndStatus(session?.user,"Processing")
        println "order = $order"
        [order:order]
    }

    def changeStatus(){
        OrderPlaced order= OrderPlaced?.findById(params?.orderId?.toLong())
        println "order = $order"
        [order:order]
    }

    def changesMadeInTheStatus(){
        OrderPlaced order=OrderPlaced?.findById(params?.orderId?.toLong())
        order.status=params?.status
        if(order.save(flush: true, failOnError: true))
        {
            def cartList = Cart.findAllByOrderId(order?.orderID?.toString())
            cartList.each { cartItem ->
                cartItem.status = "Processing"
                cartItem.save(flush: true, failOnError: true)
            }
            redirect(controller: 'agent',action: 'taskHistory')
        }
        else{
            redirect(controller: 'agent',action: 'newTask')
        }
    }

    def taskHistory(){
        def order=OrderPlaced?.findAllByUser(session?.user)
        [order:order]
    }

    def deleteAgent(){
        User agent=User.findById(params?.agentId?.toLong())
        println "agent=$agent"
        agent.isDeleted = 'true'
        if(agent.save(flush: true ,failOnError: true)){
            redirect(controller: 'agent',action: 'viewAgent')
        }
        else
        {
            redirect(controller: 'ecomm',action: 'errorPage')
        }
    }
}
