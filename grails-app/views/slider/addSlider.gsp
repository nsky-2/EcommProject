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
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="tip-bottom"> Add Slider Image</a></div>

    <h1>Add Slider Image</h1>
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
                    <g:form action="insertSliderImage" class="form-horizontal" params="">
                    %{--<div class="control-group">--}%

                    %{--<div class="controls">--}%
                    %{--<input type="hidden" id="mask-phone" class="span8 mask text" name="id" value="${category?.id}"  readonly>--}%
                    %{--</div>--}%
                    %{--</div>--}%
                        %{--<g:hiddenField name="id" value="${category?.id}"/>--}%
                        <div class="control-group">
                            <label for="normal" class="control-label">Slider Title</label>
                            <div class="controls">
                                <input type="text" id="mask-phone" class="span8 mask text" name="title" value="">
                            </div>
                        </div>
                        <!-- <div class="control-group">
             <label for="normal" class="control-label">Parent Id</label>
            <div class="controls">
            <input type="text" id="mask-phoneInt" class="span8 mask text">
            </div>
        </div> -->
                        <div class="control-group">
                            <label for="normal" class="control-label">Add Image</label>
                            <div class="controls">
                                <input type="file" name="image" id="image"/>
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
                                <div class="controls">
                                    <label>
                        <g:radioGroup name="status"
                                      labels="['Active', 'Disabled']"
                                      values="['Active', 'Disabled']">

                            <p>${it.label}: ${it.radio}</p>
                        </g:radioGroup>
                        </label>
                        </div>
                        </div>

                        <div class="form-actions">
                            <div class="span9">
                            </div>
                            <button type="submit" class="btn btn-success">Save</button>
                            <a href="${createLink(controller: 'slider',action: 'sliderView')}" class="btn btn-danger">Cancel</a>
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
