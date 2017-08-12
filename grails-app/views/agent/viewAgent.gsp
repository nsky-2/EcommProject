<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="adminNav"/>
    <title></title>
</head>

<body>


  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Tables</a> </div>
    <h1>Agent Table</h1>
  </div>
  <div class="container-fluid">
    <hr>
      <div>
          <a href="${createLink(controller: 'agent', action: 'addAgent')}">
              <i class="icon icon-plus-sign">Add Agent</i>
          </a>
      </div>
    <div class="row-fluid">
      <div class="span12">
		<div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Data table</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table" id="allAgentView">
              <thead>
                <tr>
                    <th>S.No.</th>
                    <th> Name</th>
                    <th>Email ID</th>
                    <th>Contact No.</th>
                    %{--<th>Email ID</th>--}%
                    %{--<th>Total</th>--}%
                    <th>Country</th>
                    <th colspan="2">Actions</th>
                </tr>
                </thead>
                <tbody>
                    <g:each in="${agents}" status="i" var="agent">
                        <tr>
                            <td>${i+1}</td>
                            <td>${agent?.fullName}</td>
                            <td>${agent?.emailID}</td>
                            <td>${agent?.contactNo}</td>
                            <td>${agent?.country}</td>
                            <td><a href="${createLink(controller: 'agent',action: 'agentDetails',params: [agentId:agent?.id])}"><i class="icon icon-info-sign"> &nbsp; View</i></a></td>
                            <td><a href="${createLink(controller: 'agent',action: 'deleteAgent',params: [agentId:agent?.id])}"><i class="'icon icon-trash">&nbsp;Delete</i></a></td>
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
        $('#allAgentView').DataTable();
    });
</script>
</body>
</html>