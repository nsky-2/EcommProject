package himalayanecomm

import HMEcomm.Category

class CategoryService {

    def saveCategory(def params) {
        println "${params?.id}"
//        if (params?.id == null) {}
        Category category = new Category()
//            Category category=Category.findById(params?.id)

//            category.id = params.id
        category.name = params?.name
        category.description = params?.desc
        category.code = params?.code

        if (category.save(flush: true, failOnError: true)) {
            return true
        } else {
            return false
        }

//        else
//        {
//            Category category=Category.findById(params?.id)
//            category.code=params?.code
//            category.name=params?.name
//            category.description=params?.desc
//            if (category.save(flush: true, failOnError: true)) {
//                return true
//            } else {
//                return false
//            }
//        }
    }

    def updateCategory(def params){
        Category category=Category.findById(params?.id)
        category.code=params?.code
        category.name=params?.name
        category.description=params?.desc
        if (category.save(flush: true, failOnError: true)) {
            return true
        } else {
            return false
        }
    }


}


