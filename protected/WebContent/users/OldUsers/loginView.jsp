<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="848949930774-4ka6kl79kq1fv7h3q89leonj9ki1o6v7.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js"></script>
	
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
            margin-top: 10px;
         }
        
		#kakao-login-btn { 
			width:104px; height:40px;
		 }
		 
		button {
			width:150px; height:40px;
		}
    </style>
	
</head>

<body>
	
	<jsp:include page="/layout/loginToolbar.jsp"></jsp:include>
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
	   	 	
	 	 	<div class="col-md-12">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">�� &nbsp;&nbsp;�� &nbsp;&nbsp;��</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="id" class="col-sm-4 control-label">�� �� ��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="id" id="id"  placeholder="���̵�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="pw" class="col-sm-4 control-label">�� �� �� ��</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="pw" id="pw" placeholder="�н�����" >
					    </div>
					  </div>
					  
					 </form>
					 
					 
					  <div class="row" style="padding-left: 38%; padding-right: 22%;">
					      <span style="width:104px" class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></span>
					      <span id="naver_id_login"></span>
					      <span>
					        <a style="width:600px" id="kakao-login-btn"></a>
						    <a href="http://developers.kakao.com/logout"></a>
							    <script type='text/javascript'>
							    Kakao.init('3eef0ec25dbea51f4703e0c90c3ebb54');
	
						        Kakao.Auth.createLoginButton({
						          container: '#kakao-login-btn',
						          size : 'small',
						          success: function(authObj) {
						        	  Kakao.API.request({
						                  url : "/v2/user/me",
						                  success : function(result){
						                     var info=JSON.stringify(result);
						                     $(location).attr('href', '/users/kakao?kakao='+result.id);
						                  }
						               })
						          },
						          fail: function(err) {
						             alert(JSON.stringify(err));
						          }
						        });
	
							    </script>	
					    	</span>
					    </div>
						
						<p/>
						<p/>

					    <div class="signIn" style="padding-left: 35%; padding-right: 30%;" align="center">
					      <button type="button" id="login" class="btn btn-primary"  >�� &nbsp;�� &nbsp;��</button>
					      <button type="button" id="regist" class="btn btn-primary"  >ȸ &nbsp;�� &nbsp;�� &nbsp;��</button>
					    </div>

			

			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
 	
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script type="text/javascript">

		//============= "�α���"  Event ���� =============
		$( function() {
			
			$("#id").focus();
			$("#login").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#id").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#pw").focus();
					return;
				}
				
				var chkLogin={id:id, pw:pw};
// 				alert("ajax id : "+id);
// 				alert("ajax pw : "+pw);
				$.ajax({
					
					type : "POST",
					contentType : "application/json",
					url : "/users/json/login",
					data : JSON.stringify(chkLogin),
					datatype : "json",
					success : function(response){
// 						alert("pw : "+JSON.stringify(response))
						if(response.pw == pw && response.id == id){
// 							alert("���ͼ� : "+response.pw);
							alert(response.nickname+" �� ȯ���մϴ�!");
							$('form').attr('method', 'POST').attr('action', '/users/login').submit();
						}
						if(response.pw != pw || response.id != id){
// 							alert(response.pw);
							alert("���̵� Ȥ�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
							$("form")[0].reset();
							return;
							$("#id").focus();
						}
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});

			});
			
		});
		
		$(document).ready(function(){
			$("#pw").keyup(function(key){
				if(key.keyCode==13){
					$("#login").click();
				}
			})
		})
		
		$(function(){
			$(".g-signin2").on("click", function(){
				onSignIn(googleUser);
			})
		});
			
		function onSignIn(googleUser) {
			// Useful data for your client-side scripts:
			var profile = googleUser.getBasicProfile();
			alert("ID: " + profile.getId()); // Don't send this directly to your server!
			
			// The ID token you need to pass to your backend:
			var id_token = googleUser.getAuthResponse().id_token;
			alert("ID Token: " + id_token);
			        
			$(location).attr('href', '/users/google?google='+profile.getId()+"&idToken="+id_token);
		}

		var naver_id_login = new naver_id_login("qhgCBZA6iuY4bImpUhhX", "http://localhost:8080/users/callback.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 2,40);
	  	naver_id_login.setDomain("http://localhost:8080/");
	  	naver_id_login.setState(state);
// 	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
		      


		//============= ȸ��������ȭ���̵� =============
		$( function() {
			$("#regist").on("click" , function() {
				self.location = "/users/addUsersBase"
			});
		});
		
	</script>	

</body>

</html>