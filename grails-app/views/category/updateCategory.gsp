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
        <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom">Update Category</a></div>

        <h1>Update Category</h1>
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
                        <g:form action="editCategory" class="form-horizontal" params="[categoryID:category?.id]">
                        %{--<div class="control-group">--}%

                        %{--<div class="controls">--}%
                        %{--<input type="hidden" id="mask-phone" class="span8 mask text" name="id" value="${category?.id}"  readonly>--}%
                        %{--</div>--}%
                        %{--</div>--}%
                            <g:hiddenField name="id" value="${category?.id}"/>
                            <div class="control-group">
                                <label for="normal" class="control-label">Code</label>
                                <div class="controls">
                                    <input type="text" id="mask-phone" class="span8 mask text" name="code" value="${category?.code}">
                                </div>
                            </div>
                            <!-- <div class="control-group">
				 <label for="normal" class="control-label">Parent Id</label>
				<div class="controls">
				<input type="text" id="mask-phoneInt" class="span8 mask text">
				</div>
			</div> -->
                            <div class="control-group">
                                <label for="normal" class="control-label">Name</label>
                                <div class="controls">
                                    <input type="text" id="mask-phoneExt" class="span8 mask text" name="name" value="${category?.name}">
                                </div>
                            </div>
                            <!-- <div class="control-group">
              <label for="normal" class="control-label">Version</label>
              <div class="controls">
                <input type="text" id="mask-phoneInt" class="span8 mask text">
				</div>
			</div> -->
                            <!-- <div class="control-group">
				 <label for="normal" class="control-label">Classifier</label>
				<div class="controls">
					<input type="text" id="mask-phoneInt" class="span8 mask text">
				</div>
			</div> -->
                            <div class="control-group">
                                <label for="normal" class="control-label">Description</label>
                                <div class="controls">
                                    <textarea class="textarea_editor span8" rows="6" placeholder="Enter text ..." name="desc">${category?.description}</textarea>
                                </div>
                            </div>

                            <div class="form-actions">
                                <div class="span9">
                                </div>
                                <button type="submit" class="btn btn-success">Save</button>
                                <a href="${createLink(controller: 'category',action: 'viewCategory')}" class="btn btn-danger">Cancel</a>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Footer-part-->

</body>
</html>
