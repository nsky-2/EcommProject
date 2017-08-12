
 <%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="adminNav"/>
    <title></title>

    <script type="text/javascript">
        $(document).ready(function(){
            console.log("here >>>>>>>>>>>>>")

            $("#catDropdown").change(function(){
                var cat = $('#catDropdown').val();
                console.log("cat ============== " + cat)
                $.ajax({
                    type : "post",
                    data : {category: cat},
                    url : "${g.createLink(controller:'product',action:'subcat')}",
                    success : function (data){

                        console.log("on success")
                        console.log(data)
                        $("#subCatSelect").html('');
                        $("#subCatSelect").html(data);
                    }
                });


            });
            %{--$('#username').blur(function(){--}%
            %{--console.log("inside blur")--}%
            %{--var user = $('#username').val();--}%
            %{--alert(user);--}%
            %{--$.ajax({--}%
            %{--type : "post",--}%
            %{--data : {user: user},--}%
            %{--url : "${g.createLink(controller:'main',action:'checkUsername')}",--}%
            %{--success : function (data){--}%

            %{--console.log("on success")--}%
            %{--console.log(data)--}%
            %{--if(data == "Username OK") {--}%
            %{--$('#btnSubmit').prop("disabled", false)--}%
            %{--} else {--}%
            %{--$('#errorMsg').html(data);--}%
            %{--$('#btnSubmit').prop("disabled", true)--}%
            %{--}--}%
            %{--}--}%
            %{--});--}%
            %{--});--}%
        });

    </script>

</head>
<body>
<!--main-container-part-->
%{--<div id="content">--}%
    <!--breadcrumbs-->
    <div id="content-header">
        <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom">Add Product</a></div>

        <h1>Add Product</h1>
    </div>

    <!--End-breadcrumbs-->
    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span2">
            </div>
            <div class="span8">
                <div class="widget-box">
                    <div class="widget-title">

                    </div>
                    <div class="widget-content nopadding">
                        <g:uploadForm action="insertProduct" class="form-horizontal" enctype="multipart/form-data">
                            <div class="control-group">
                                <label for="normal" class="control-label">Category</label>
                                <div class="controls">
                                    <g:select name="category" id="catDropdown" from="${category}" class="form-control"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="normal" class="control-label">Sub Category</label>
                                <div id="subCatSelect" class="controls">
                                    <g:select name="subCategory"  from="${subCategory}" class="form-control"></g:select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="normal" class="control-label">Code</label>
                                <div class="controls">
                                    <input type="text" id="mask-phone" class="span8 mask text" name="code">
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="normal" class="control-label">Name</label>
                                <div class="controls">
                                    <input type="text" id="mask-phoneExt" class="span8 mask text" name="name">
                                </div>
                            </div>
                            %{--<div class="control-group">--}%
                                %{--<label for="normal" class="control-label">Version</label>--}%
                                %{--<div class="controls">--}%
                                    %{--<input type="text" id="mask-phoneInt" class="span8 mask text">--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            <div class="control-group">
                                <label for="normal" class="control-label">Description</label>
                                <div class="controls">
                                    <textarea class="textarea_editor span8" rows="6" name="desc" placeholder="Enter text ..."></textarea>
                                </div>
                            </div>


                            <div class="control-group">
                                <label for="normal" class="control-label">Price</label>
                                <div class="controls">
                                    <input type="text" id="mask-ssn" class="span8 mask text" name="price">
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="normal" class="control-label">Total Quantity</label>
                                <div class="controls">
                                    <input type="text" id="mask-productKey" class="span8 mask text" name="totalQty">
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="normal" class="control-label">Available Quantity</label>
                                <div class="controls">
                                    <input type="text" id="mask-date" class="span8 mask text" name="availableQty">
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <label>
                                    <g:radioGroup name="availability"
                                                  labels="['Available', 'Out of Stock']"
                                                values="['Available', 'Out of Stock']">

                                        <p>${it.label}: ${it.radio}</p>
                                    </g:radioGroup>
                                    </label>
                                    %{--<label>--}%
                                        %{--<input type="radio" name="radios" />--}%
                                        %{--Available</label>--}%
                                    %{--<label>--}%
                                        %{--<input type="radio" name="radios" />--}%
                                        %{--Out Of Stock</label>--}%
                                </div>
                                </div>
                            %{--<div class="control-group">--}%
                                %{--<label class="control-label">Availability</label>--}%
                                %{--<div class="controls">--}%
                                    %{--<label>--}%
                                        %{--<input type="checkbox" name="radios" />--}%
                                    %{--</label>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            <div class="control-group">
                                <label for="normal" class="control-label">Add Picture</label>
                                <div class="controls">
                                    <input type="file" name="photo" id="photo"/>
                                </div>
                            </div>

                            <div class="form-actions">
                                <div class="span9">
                                </div>
                                <button type="submit" class="btn btn-success">Save</button>
                                <a href="${createLink(controller: 'product',action: 'viewProduct')}" class="btn btn-danger">Cancel</a>
                            </div>
                        </g:uploadForm>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>