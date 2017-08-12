package himalayanecomm

import HMEcomm.Category

class CategoryController {
    def categoryService

    def index() {}

    def addCategory(){

    }

    def addCategoryRevisited(){
//        def category=Category.all
    }

    def insertCategory(){

        if(categoryService.saveCategory(params)){
            def category=Category.list()
            println "Category=$category"
            render (view: "viewCategory", model: [category:category])
        } else {
            render "error"
        }
    }

    def viewCategory(){
        def category=Category.createCriteria().list {
            eq('deleted', false)
        }
        println "category=$category"
        [category:category]

    }

    def updateCategory(){
        Category category=Category.findById(params?.categoryID?.toLong())
        println "category=$category"
        [category:category]
    }

    def editCategory(){
//        Category category=Category.findById(params?.categoryID?.toLong())
//        println "category=$category"
//        [category:category]
//        render (view: "addCategoryRevisited", model: [category: category])

        if(categoryService.updateCategory(params)){
            def category=Category.list()
            println "Category=$category"
            render (view: "viewCategory", model: [category:category])
        }
        else
        {
            render "error"
        }


    }

    def deleteCategory(){
        Category category=Category.findById(params?.categoryID?.toLong())
        println "category=$category"
        category.deleted=true
        if(category.save(flush: true ,failOnError: true)){
            redirect(controller: 'category',action: 'viewCategory')
        }
        else
        {
            render "not deleted"
        }

    }




}
