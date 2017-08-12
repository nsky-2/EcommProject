<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminNav"/>
    <title></title>
</head>

<body>

<!--main-container-part-->
%{--<div id="content">--}%
<!--breadcrumbs-->
<div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom">View Category</a></div>

    <h1>View Product</h1>
</div>
<div class="addButton">
    <a href="${createLink(controller: 'product', action: 'addProduct')}">
  Add Product
    </a>
</div>

<!--End-breadcrumbs-->
<div class="widget-content nopadding">
    <table class="table " id="allProductView">
        <thead>
        <tr>
            <th> Code</th>
            <th> Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Total Quantity</th>
            <th>Available Quantity</th>
            <th>Availability</th>
            %{--<th>Action</th>--}%
            <th>Photo</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>


        <g:each in="${(product)}" status="i" var="pro">
            <tr>
                <td>${(pro.code)}</td>
                <td>${(pro.name)}</td>
                <td>${pro.description}</td>
                <td>${pro.price}</td>
                <td class="aQty">${pro.totalQuantity}</td>
                <td class="tQty">${pro.availableQuantity}</td>
                <td >${pro.availability}</td>
                <td class="image"><img src="${createLink(controller:'product', action:'showImage', id: "${pro.id}")}" width='150' height='150'/></td>
                <td><a href="${createLink(controller:'product' ,action:'updateProduct',params: [productID:pro.id ])}"><i class="icon icon-pencil"></i>Edit</a> / <a href="${createLink(controller:'product' ,action:'deleteProduct',params: [productID: pro.id ])}"><i class="icon icon-trash"></i>Delete</a> </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<script>
    $(document).ready(function(){
        $('#allProductView').DataTable();
    });
</script>
</body>
</html>