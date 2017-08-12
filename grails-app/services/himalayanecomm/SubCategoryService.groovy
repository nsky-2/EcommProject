package himalayanecomm

import HMEcomm.Category
import HMEcomm.SubCategory

class SubCategoryService {

    def serviceMethod() {
    }

    def categoryDropdown(){
        def catlist = []
        catlist.add("Select...")
        def categoryList =  Category.createCriteria().list {
            notEqual('deleted',true)
        }
        categoryList.each {
            catlist.add(it?.name)
        }
        return catlist

    }

    def subCategoryDropdown(){
        def subcatlist =[]
        subcatlist.add("Select...")
        def subCategoryList = SubCategory.createCriteria().list {
            notEqual('deleted',true)
        }
        subCategoryList.each {
            subcatlist.add(it?.name)
        }
        return subcatlist
    }

    def saveSubCategory(def params){

        Category category = Category.findByName(params.category)
        SubCategory subCategory = new SubCategory()
        subCategory.code = params?.code
        subCategory.name = params?.name
        subCategory.description = params?.desc
        subCategory.category = category

        if (subCategory.save(flush: true, failOnError: true)) {
            return true
        } else {
            return false
        }
    }

    def editSubCategory(def params)
    {
        SubCategory subCategory=SubCategory.findById(params?.id)
        Category category=Category.findByName(params?.category)
        subCategory.code=params?.code
        subCategory.name=params?.name
        subCategory.description=params?.desc
        subCategory.category=category


        if (subCategory.save(flush: true, failOnError: true)) {
            return true
        } else {
            return false
        }
    }

    def subCategoryByCategory(def cat){
        Category category = Category.findByNameAndDeleted(cat, false);
        println "category = $category"
        def subCategory = SubCategory.findAllByCategoryAndDeleted(category, false).name
        println "subCategory = $subCategory"
        return subCategory
    }

}
