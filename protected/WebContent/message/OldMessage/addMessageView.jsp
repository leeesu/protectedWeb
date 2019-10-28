<%@ page contentType="text/html; charset=euc-kr" %>
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

		<!--  ///////////////////////// CSS ////////////////////////// -->
			<style>
		       body > div.container{
		        	border: 3px solid #D6CDB7;
		            margin-top: 10px;
		       }
		        
		       button {
			        width:150px; height:40px;
		       }
		    </style>

		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
  		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	</head>
	
	<body>
	
		<jsp:include page="/layout/toolbar.jsp" />
		
		<div class="container">
		
			<h1 class="bg-primary text-center">�� �� �� ��</h1>
			
			<form id ="uploadForm" class="form-horizontal">
			<input type="hidden" name="senderId" value="${ sessionScope.user.id }"/>
			<input type="hidden" name="messageStatus" value="0"/>
			<input type="hidden" name="delCode" value="0"/>
			
 				<div class="form-group">
 					<div class="col-sm-2">
 						<p>�޴���</p>
 					</div>
 					<div class="col-sm-10">
 						<c:if test="${ param.receiveId != null }">
							<input type="text" class="form-control" name="receiverId" value="${ param.receiveId }"/>
						</c:if>
						<c:if test="${ param.receiveId eq null }">
							<input type="text" class="form-control" name="receiverId" value=""/>
						</c:if>
					</div>
				</div>
						
				<br/>
				<br/>
				<br/>		
								
				<div class="form-group">
					
					<div class="col-sm-2">
						<p>����</p>
					</div>
					<div class="col-sm-10" style="float:left">
						<input type="text" class="form-control" name="messageTitle" value="" placeholder="������ �Է��ϼ���">
					</div>
				
				</div>
				
				<br/>
				<br/>
				<br/>
				<hr/>
				<br/>
				
				<div class="form-group">
					<textarea class="form-control" rows="20" placeholder="1000�� �̸����� �ۼ����ּ���" 
					id="messageContent" name="messageContent" value="" required></textarea>
				</div>
				<br/>
				<br/>
				<hr/>
				<br/>
				<br/>
				
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-4 text-center">
						<input type="submit" id="submit" class="btn btn-primary" value="����">
						<a class="btn btn-primary btn" href="#" role="button">���</a>
					</div>
				</div>
				
				<br/>
				<br/>
				<br/>
				<br/>
				
			</form>
	
		</div>
	
	<!-- JavaScript ���� -->
	<script type="text/javascript">
		
		function fncAddMessage(){
			//Form ��ȿ�� ����
			var content = $("input[name='messageContent']").val();

			
// 			if(reportContent == null || reportContent.length<1){
// 				alert("������ �Է��� �ּ���.");
// 				return;
// 			}
			
// 			if(reportContent.length>1000){
// 				alert("������ 1õ�� �̸����� �ۼ��� �ּ���.")
// 				return;
// 			}
			
			$("#uploadForm").attr("method", "POST").attr("action", "/message/addMessage");
// 			alert("������ �����Ͽ����ϴ�");
		}

			$(function(){
				$('#submit').on('click',function(){
// 					alert("ssss");
					fncAddMessage();
				});
			});
			
			
			$(function(){
				$('a[href="#"]').on('click',function(){
					$("form")[0].reset;
				});
			});


	
		
		
		</script>
	</body>

</html>
