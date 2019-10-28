<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button" ).on("click" , function() {
					self.location = "/users/updateUsers?id=${user.id}"
				});
		});
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">ȸ��������ȸ</h3>
	       <h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	
		<div class="row">
			<div style="float:left" class="col-md-4">
				<c:if test="${user.profile!=null }">
				<div class="col-xs-12 col-md-4">
					<img src="/resources/file/fileUser/${user.profile}" style="max-height: 250px; max-width: 250px">
				</div>
				</c:if>
				<c:if test="${user.profile==null}">
				<div class="col-xs-12 col-md-4">
					<img src="/resources/file/others/anonymous-250.jpg">
				</div>
				</c:if>
			</div>
				
				<div style="float:right; min-width:65%" class="col-md-8"> 
			
					<div class="row">
				  		<div class="col-xs-4 col-md-6"><strong>�� �� ��</strong></div>
						<div class="col-xs-8 col-md-6">${user.id}</div>
					</div>
					
					<hr/>
					
					<div class="row">
				  		<div class="col-xs-4 col-md-6"><strong>�� �� ��</strong></div>
						<div class="col-xs-8 col-md-6">${user.nickname}</div>
					</div>
					
					<hr/>
					
					<div class="row">
				  		<div class="col-xs-4 col-md-6"><strong>ȸ �� ��</strong></div>
						<div class="col-xs-8 col-md-6">${user.userName}</div>
					</div>
					
					<hr/>
					
					<div class="row">
				  		<div class="col-xs-4 col-md-6"><strong>ȸ�����</strong></div>
						<div class="col-xs-8 col-md-6">${user.levels}(${user.levelPoint})</div>
					</div>
					
					<hr/>
				
				</div>
		
		</div>
		
		<hr/>
	
		
		<div class="page-header">
	       <h3 class=" text-info">�󼼺���</h3>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>e-mail</strong></div>
			<div class="col-xs-8 col-md-4">${user.email}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${user.userAddr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�޴���ȭ</strong></div>
			<div class="col-xs-8 col-md-4">${user.phone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���¹�ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${user.account}</div>
		</div>
		
		<hr/>
		
			
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">ȸ����������</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
 	<jsp:include page="/layout/footer.jsp" />

</body>

</html>