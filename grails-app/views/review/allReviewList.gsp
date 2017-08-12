<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminNav"/>
    <title></title>
</head>

<body>


<div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Review List</a> </div>
    <h1>Review List</h1>
</div>
<div class="container-fluid">
    <hr>

    <div class="row-fluid">
        <div class="span12">
            <div class="widget-box">
                <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                    <h5>Data table</h5>
                </div>
                <div class="widget-content nopadding">
                    <table class="table" id="reviewList">
                        <thead>
                        <tr>
                            <th>S.No.</th>
                            <th> Customer</th>
                            <th>Product</th>
                            %{--<th>Rating</th>--}%
                            <th>Review</th>
                            <<th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${reviews}" status="i" var="review">
                            <tr>
                                <td>${i+1}</td>
                                <td><a href="${createLink(controller: 'customer',action: 'customerDetail', params: [customerId:buyer?.id])}"> ${review?.customer?.fullName}</a></td>
                                <td><img src="${createLink(controller:'product', action:'showImage', id: "${review?.product?.id}")}" width='150' height='150'/></td>
                                %{--<td>${review}</td>--}%
                                <td>${review?.comment}</td>
                                <td>${review?.status}</td>
                                %{--<td><a href="${createLink(controller: 'review',action: 'approveReview',params: [reviewId:review?.id])}"><i class="icon icon-correct"> &nbsp; Approve</i></a></td>--}%
                                %{--<td><a href="${createLink(controller: 'agent',action: 'deleteReview',params: [agentId:review?.id])}"><i class="'icon icon-trash">&nbsp;Delete</i></a></td>--}%

                            </tr>
                        </g:each>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('#reviewList').DataTable();
    });
</script>

</body>
</html>