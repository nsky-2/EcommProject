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
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom">Slider Image</a></div>

    <h1>Slider Image</h1>
</div>
<div>
    <a href="${createLink(controller: 'slider', action: 'addSlider')}">
        <i class="icon icon-plus-sign">Add Slider Image</i>
    </a>
</div>
<br>
<br>


<!--End-breadcrumbs-->
<div class="widget-content nopadding">
    <table class="table table-bordered data-table">
        <thead>
        <tr>
            <th> S. No.</th>
            <th> Slider Title</th>
            <th>Image</th>
            <th>Status</th>
            <th>Action</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${slider}" status="i" var="slide">
        <tr>
            <td>${(i+1)}</td>
            <td>${(slide?.title)}</td>
            <td><img src="${createLink(controller:'product', action:'showImage', id: "${slide.id}")}" width='150' height='150'/></td>
            <td>${(slide?.status)}</td>
            <td><a href="${createLink(controller:'slider' ,action:'updateSlider',params: [sliderId:slide.id ])}"><i class="icon-pencil"> Edit</i></a> / <a href="${createLink(controller:'slider' ,action:'deleteSlider',params: [sliderId: slide.id ])}"><i class="icon icon-trash" >Delete</i></a> </td>

        </tr>
        </g:each>
        </tbody>

        %{--</tr>--}%
        %{--</tbody>--}%
        %{--<g:each in="${(product)}" status="i" var="pro">--}%
            %{--<tr>--}%
                %{--<td>${(pro.code)}</td>--}%
                %{--<td>${(pro.name)}</td>--}%
                %{--<td>${pro.description}</td>--}%
                %{--<td>${pro.price}</td>--}%
                %{--<td>${pro.totalQuantity}</td>--}%
                %{--<td>${pro.availableQuantity}</td>--}%
                %{--<td>${pro.availability}</td>--}%
                %{--<td><img src="${createLink(controller:'product', action:'showImage', id: "${pro.id}")}" width='150' height='150'/></td>--}%
                %{--<td><a href="${createLink(controller:'product' ,action:'updateProduct',params: [productID:pro.id ])}">Edit</a> / <a href="${createLink(controller:'product' ,action:'deleteProduct',params: [productID: pro.id ])}">Delete</a> </td>--}%
            %{--</tr>--}%
        %{--</g:each>--}%
    </table>
</div>
</body>
</html>