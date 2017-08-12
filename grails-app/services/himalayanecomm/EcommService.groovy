package himalayanecomm

import HMEcomm.Category
import HMEcomm.Product
import HMEcomm.SubCategory

class EcommService {

    def allMap() {
        def resultMap = [:]
        def category=Category.createCriteria().list {
            eq('deleted', false)
        }
        category.each {cat ->
            def subMap = [:]
            def subcategory = SubCategory.findAllByCategoryAndDeleted(cat, false)
            subcategory.each {subCat ->
                def product = Product.findAllByCategoryAndSubCategoryAndIsDeleted(cat, subCat, false)
                subMap.put(subCat.name, product)
            }
            resultMap.put(cat.name, subMap)
        }
        return resultMap
    }
}
