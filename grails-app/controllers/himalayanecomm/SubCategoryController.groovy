package himalayanecomm

import HMEcomm.Category
import HMEcomm.SubCategory

class SubCategoryController {
    def subCategoryService

    def index() {}

    def addSubCategory(){
        def categ=subCategoryService.categoryDropdown()
        println "category=$categ"
        [category:categ]
    }

    def insertSubCategory(){
        if(subCategoryService.saveSubCategory(params))
        {
            def subCategory=SubCategory.list()
            println "SubCategory=$SubCategory"
            render (view: "viewSubCategory", model: [subCategory:subCategory])
        }
        else
        {
            render "error"
        }
    }

    def viewSubCategory(){
        def subCategory=SubCategory.createCriteria().list {
            eq('deleted',false)
        }
        println "subCategory=$subCategory"
        [subCategory:subCategory]
    }

    def updateSubCategory(){
        def category=subCategoryService.categoryDropdown()
        println "category=$category"

        SubCategory subCategory=SubCategory.findById(params?.SubCategoryID?.toLong())
        println "subCategory=$subCategory"
        [subCategory:subCategory,category: category]
    }

    def editSubCategory(){
        if(subCategoryService.editSubCategory(params))
        {
            def subCategory=SubCategory.list()
            println "Category=$subCategory"
            render (view: "viewSubCategory", model: [subCategory:subCategory])
        }
    }

    def deleteSubCategory(){
        SubCategory subCategory=SubCategory.findById(params?.SubCategoryID?.toLong())
        println "subCategory=$subCategory"
        subCategory.deleted=true
        if(subCategory.save(flush: true ,failOnError: true)){
            redirect(controller: 'subCategory',action: 'viewSubCategory')
        }
        else
        {
            render "not deleted"
        }
    }

}
