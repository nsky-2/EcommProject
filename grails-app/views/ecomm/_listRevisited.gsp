<table>
    <g:set var="categories" value="${allMap?.keySet()}"/>
    <g:each in="${categories}" var="category">
        <tr>
            <td>Category: ${category}</td>
        </tr>
        <g:set var="subcategoriesMap" value="${allMap?.getAt(category)}"/>
        <g:set var="subcategories" value="${subcategoriesMap?.keySet()}"/>
        <g:each in="${subcategories}" var="subcategory">
            <tr>
                <td>Subcategory: ${subcategory}</td>
            </tr>
            <g:set var="products" value="${subcategoriesMap?.getAt(subcategory)}"/>
            <g:each in="${products}" var="product">
                <tr>
                    <td>Product: ${product}</td>
                </tr>
            </g:each>
        </g:each>
    </g:each>
    <tr></tr>
</table>