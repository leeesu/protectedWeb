<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
<title>보호할개 · 분양실종</title>
	<meta charset="utf-8">
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		
		
 	  	html { 
 	 		scroll-behavior: smooth; 
 		} 

 		h3{ 
 			padding-bottom: 0px; 
 			padding-top: 10px !important;
 		} 
		
		.getadopt {
			padding-top: 10px;
			padding-left: 10px;
			padding-right: 10px;
			background-color: white;
		}
		
 		.listImg {
 			max-height: 330px;  
 			min-height: 330px;  
 			min-width: wrap; 
 			max-width: wrap; 
 			display: block; 
 		} 

		form {
			text-align: left;
		}
		
		.form-group {
			display: inline-block;
			right: 0%;
			text-align: right;
		}
		
		select, #searchKeyword {
			height: 33px;
		}
		
		#searchKeyword {
			height: 40px;
			width: 150px;
			border : 1px solid #D3D3D3;
			padding-left: 5px;
/*  			display: none;  */
		}
		
		#searchSubmmit {
 			width : 60px; 
			height : 40px;
/* 			border-radius : 50px;  */
  			border-radius : 0px 15px 15px 0px;  
			border : 1px solid #f04f23;
		}
		
		#write {
/*  			width : 60px;  */
			height : 40px;
/*   			border-radius : 15px;   */
			border : 1px solid #f04f23;
		}
		
		#areaCondition {
			height : 40px;
			border-radius : 15px 0px 0px 15px;
			padding-left: 10px;
			border-color: #D3D3D3;
			border-right: 0px;
/*  			display: none;  */
		}
		
		#searchCondition {
			height : 40px;
			padding-left: 5px;
			border-color: #D3D3D3;
			border-right: 0px;
/*  			display: none;  */
		}
		
		.col-md-6 {
			padding-left: 30px !important;
			padding-right: 30px !important;
		}
/* 		.swal-text{ */
/*         font-size : 25px */
/*         } */


    </style>
<jsp:include page="/layout/toolbar.jsp"></jsp:include>
</head>

<body class="goto-here">
   	
    <div class="hero-wrap hero-bread" style="padding-bottom: 60px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">Adopt</span> <span>Missing</span></p>
            <font size="7">분양게시판</font>
          </div>
        </div>
      </div>
    </div>

	<div class="sectionContainer ">	
    <section class="ftco-section bg-light" style="padding-bottom: 0px; padding-top : 20px;">   


	<div class="container"  style="padding-left: 0px; padding-right : 0px;">
	<input type="hidden" id="boardCode" value="${param.boardCode }">
	<input type="hidden" id="levels" value="${user.levels }">
	<input type="hidden" id="sessionId" value="${user.id }">
<%-- 	<input type="hidden" id="totalCount" value="${resultPage.totalCount}"> --%>


		<div class="row">
	    
		    <div class="col-md-12 text-left">
		    	<p style="padding-left: 15px;font-weight: bold;" id="total">
		    		전체  ${resultPage.totalCount } 건
		    	</p>
		    </div>
		    <div class="col-md-6" id="justify" align="left">
<%-- 			    <c:if test="${ user.id ne null }"> --%>
<!-- 			    	<button type="button" class="btn btn-default" style="height: 40px;"><font size="3px">작성</font></button> -->
						<button type="button" id="write" class="btn btn-default " style="padding-bottom: 6px;margin-left: 0px;">
<!-- 							<span class="fas fa-pencil-alt"></span> -->
							작성
						</button>
<%-- 			    	</c:if> --%>
			    </div>
			<div class="col-md-6" align="right">
				<form class="form-inline" name="detailForm" style="float: right;">
					<div class="form-group">
			    		<select name="areaCondition" id="areaCondition" >
							<option value="all">전체</option>
							<option value="강원"  ${ ! empty search.areaCondition && search.areaCondition=="강원" ? "selected" : "" }>강원도</option>
							<option value="경기"  ${ ! empty search.areaCondition && search.areaCondition=="경기" ? "selected" : "" }>경기도</option>
							<option value="경상"  ${ ! empty search.areaCondition && search.areaCondition=="경상" ? "selected" : "" }>경상도</option>
							<option value="광주"  ${ ! empty search.areaCondition && search.areaCondition=="광주" ? "selected" : "" }>광주시</option>
							<option value="대전"  ${ ! empty search.areaCondition && search.areaCondition=="대전" ? "selected" : "" }>대전시</option>
							<option value="부산"  ${ ! empty search.areaCondition && search.areaCondition=="부산" ? "selected" : "" }>부산시</option>
							<option value="서울"  ${ ! empty search.areaCondition && search.areaCondition=="서울" ? "selected" : "" }>서울시</option>
							<option value="울산"  ${ ! empty search.areaCondition && search.areaCondition=="울산" ? "selected" : "" }>울산시</option>
							<option value="인천"  ${ ! empty search.areaCondition && search.areaCondition=="인천" ? "selected" : "" }>인천시</option>
							<option value="전라"  ${ ! empty search.areaCondition && search.areaCondition=="전라" ? "selected" : "" }>전라도</option>
							<option value="제주"  ${ ! empty search.areaCondition && search.areaCondition=="제주" ? "selected" : "" }>제주도</option>
							<option value="충청"  ${ ! empty search.areaCondition && search.areaCondition=="충청" ? "selected" : "" }>충청도</option>
						</select>
			    	</div>

			    	<div class="form-group">
						<select name="searchCondition" id="searchCondition" >
							<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
							<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>내용</option>
							<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>견종</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label>
						<input type="text" id="searchKeyword" name="searchKeyword"  placeholder="검색어를 입력하세요."
						    	value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					</div>

<!-- 					<div class="form-group" > -->
						<button type="button" id="searchSubmmit" class="btn btn-default searchSubmmit" style="padding-bottom: 6px;margin-left: 0px;">
							<span class="fas fa-search"></span>
						</button>

<!-- 						<button type="button" class="btn btn-default"  id="search" style="height: 33px;width: 45px;">검색</button> -->
						
<!-- 					</div> -->
			    
			    </form>
		    </div>
		    
		    
		    
			    
		    
		    
		</div>
			    

		
		<div class="row"><div class="col-md-12"></div><br/></div>


      <div class="col-md-12"></div>
      <div class="col-md-12" >
      
      <div class="col-md-12"  style="padding-left: 0px;padding-right: 0px;">
      
<%--       <c:if test="${resultPage.totalCount eq 0 }"> --%>
<!--       	<div id="searchEmpty" align="center" style="height: 400px; padding-top: 150px;"></div> -->
<%--       </c:if> --%>
	
	  <div class="row"  id="listAdoptJSON">
      <c:set var="i" value="0" />

		  <c:forEach var="adopt" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			
			<div class="col-md-4" >
			
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

			<div class="desc-comp-offer-cont">
			<figure class="getadopt">
			<input type="hidden" name="postNo" value="${adopt.postNo}"/>
				<span id="image-box">
					<c:if test="${adopt.statusCode ne 3}">
					  <img class="listImg" style="width:100%;background:url('../resources/file/fileAdopt/${adopt.mainFile}') no-repeat center center;background-size:cover; "   onerror="this.src='http://placehold.it/400x400'"/>
					</c:if>
					<c:if test="${adopt.statusCode eq 3}">
					  <img class="listImg" src="../resources/file/fileAdopt/complete.png" style="width:100%;background:url('../resources/file/fileAdopt/${adopt.mainFile}') no-repeat center center;background-size:cover;" onerror="this.src='http://placehold.it/400x400'" />
					</c:if>
				</span>
			    <span id="textList"><h3 align="center" style="padding-right: 0px;padding-left: 0px;"><b>${adopt.postTitle}</b></h3>
				    <c:if test="${param.boardCode eq 'AD' }">
				   	 	<p align="right" style="padding-bottom: 10px;">
				   	 		<c:if test="${    fn:indexOf(adopt.areaKr,'군') != -1 &&  fn:indexOf(adopt.areaKr,'시') != -1}">
						   	 	<c:if test="${    fn:indexOf(adopt.areaKr,'시') <  fn:indexOf(adopt.areaKr,'군') }">
						   	 		${fn:substring( adopt.areaKr , 0, fn:indexOf(adopt.areaKr,'시')+1 ) }
						   	 	</c:if>
						   	 	<c:if test="${    fn:indexOf(adopt.areaKr,'시') >  fn:indexOf(adopt.areaKr,'군') }">
						   	 		${fn:substring( adopt.areaKr , 0, fn:indexOf(adopt.areaKr,'군')+1 ) }
						   	 	</c:if>
						   	 </c:if>
						   	 <c:if test="${    fn:indexOf(adopt.areaKr,'군') != -1 &&  fn:indexOf(adopt.areaKr,'시') == -1}">
						   	 	${fn:substring( adopt.areaKr , 0, fn:indexOf(adopt.areaKr,'군')+1 ) }
						   	 </c:if>
						   	 <c:if test="${    fn:indexOf(adopt.areaKr,'군') == -1 }">
						   		 ${fn:substring( adopt.areaKr , 0, fn:indexOf(adopt.areaKr,'시')+1 ) }
						   	 </c:if>
				   	 	</p>
				   	</c:if>
				    <c:if test="${param.boardCode eq 'MS' }">
				   	 	<p align="right"><fmt:formatNumber value="${ adopt.dogPay }" pattern="#,###" />원</p>
				   	</c:if>
			   	</span>
			</figure>
			</div>
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
			
			</div>	
		
       </c:forEach>
       </div>
       
       </div>
       </div>
       
       <div class="col-md-12"><br/><br/></div>
       
       
       
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	
 	
 	<c:if test="${resultPage.totalCount eq 0 }">
 		<jsp:include page="/common/searchResult.jsp"></jsp:include>
 	</c:if>
 	
 	</section></div>
 	
 	
 	<jsp:include page="/layout/footer.jsp"></jsp:include>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	

<!-- 	<script src="https://code.jquery.com/jquery-1.10.2.js"></script> -->

<!-- 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
	
<!-- 	<script src="https://code.jquery.com/jquery-1.10.2.js"></script> -->
	
	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	

		console.log($(window).height() );
		console.log($(window).scroll() );
		console.log($(document).height());
		var postNo;
		var postSize = 1;
		var area = '';
		var str = '';
		
		$(function(){
	        $(window).scroll(function(){
	            
	//             scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
	//             if( $(this).scrollTop() == $(document).height() -  $(this).height() ){
	            if( $(this).scrollTop() +  $(this).height() + 484 > $(document).height() ){
	            	postSize++;
	            	listAdopt(postSize,"");
	            }
	        })//스크롤 
	//         listApply(postSize,"");
	    })
	
	
	
		function listAdopt(postSize, str){
			console.log($("#searchCondition").val()+", "+$("#searchKeyword").val()+", "+$('select[name=areaCondition]').val()+", "+$("#boardCode").val()+", "+postSize);
			console.log(typeof $("#searchCondition").val());
			console.log(typeof postSize);
			
			
	  		$.ajax( 
			 		{
						url : "/adopt/json/listAdopt",
						method : "POST" ,
						data : JSON.stringify({
							searchCondition : $("#searchCondition").val(),
							searchKeyword : $("#searchKeyword").val(),
							areaCondition : $('select[name=areaCondition]').val(),
							boardCode : $("#boardCode").val(),
							pazeSize : postSize,
						}) ,
						dataType : "json" ,
						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								  },
						success : function(data , status) {
	// 							console.log(JSON.stringify(data));
	
								var displayValue = '';
								
								if( postSize == 1 ) {

									$('#total').text('전체 '+data.totalCount+' 건');
								}
								for( i=0; i<data.list.length; i++ ){
									
									
									var bCode = data.list[i].areaKr.substring( 0, data.list[i].areaKr.indexOf('시')+1 );
									var sCode = '<img class="listImg" src="../resources/file/fileAdopt/complete.png" style="width:100%;background:url(\'..\/resources\/file\/fileAdopt\/'+data.list[i].mainFile+'\') no-repeat center center;background-size:cover;" onerror="this.src=\'http://placehold.it/400x400\'" />';

									if ( data.list[i].statusCode != 3 ) {
										sCode = '<img class="listImg" style="width:100%;background:url(\'..\/resources\/file\/fileAdopt\/'+data.list[i].mainFile+'\') no-repeat center center;background-size:cover;" onerror="this.src=\'http://placehold.it/400x400\'" />';	
									}	

// 								       <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
									displayValue += '<div class="col-md-4" ><div class="desc-comp-offer-cont">'
														+'<figure class="getadopt">'
														+'<input type="hidden" name="postNo" value="'+data.list[i].postNo+'"/>'
															+'<span id="image-box">'+sCode+'</span>'
														    +'<span id="textList">'
														    	+'<h3 align="center" style="padding-right: 0px;" ><b>'
														   			+data.list[i].postTitle
														   		+'</b></h3>'
														   		+'<p align="right" style="padding-bottom: 10px;">'
														   			+bCode
														   		+'</p>'
														   	+'</span>'
														+'</figure>'
													+'</div></div>'	;
										
						            
								}
								if(str!=""){
									$('#listAdoptJSON').children().remove();
// 									$('.text-primary').text('전체 '+data.totalCount+' 건');
								}
								if( postSize == 1 && data.totalCount == 0 ){
									$('#searchEmpty').remove();	
								
									console.log('결과없음'+data.totalCount);
									if ( $('#searchKeyword').val()==''){
// 										$('#searchEmpty').remove();
										displayValue =   '<div class="col-md-12" id="searchEmpty" align="center" style="height: 300px; padding-top: 100px;">'
														+'<b><font size="5px">검색결과가 없습니다.</font></b>'
								                    	+'</div>';
									}else {
										
// 										$('#searchEmpty').remove();
										displayValue = 
											'<div class="col-md-12" id="searchEmpty" align="center" style="height: 300px; padding-top: 100px;">'
											+'<div align="center" style="display: flex;justify-content: center;align-items: center;"><div id="item">'
											+'<div class="block text-left"><b><font size="5px"><font color="#f04f23"> \''+$('#searchKeyword').val()+'\'</font>'+'에 대한 검색 결과가 없습니다.</font></b></div>'
							        		+'<p align="left"><br/>단어의 철자가 정확한지 확인해 주세요.<br/>'
							        		+'검색어의 단어 수를 줄이거나, 다른 검색어로 검색해 보세요.<br/>'
							        		+'보다 일반적인 검색어로 검색해 주세요.</p></div></div></div>'
					                    	+'</div>';
											
									}
									
								}
								$('#listAdoptJSON').append(displayValue);
								
								
				
							
						},
						error: function(request, status, error){ 
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				        }
				
			});

 		}
	
		$(document).ready(function() {
			//엔터검색
			$('#searchKeyword').keydown( function(e) {
				if(e.keyCode == 13) {
// 					postSize = 1;
// 					listAdopt(postSize,"dd");
					fncGetList(1);
// 					console.log("엔터 "+$( '#searchKeyword').val());
//  					return;
// 					if ( $( '#searchKeyword').val().trim() == '' || $( '#searchKeyword').val().trim() == null ){
// 						$("#searchKeyword").focus();
// 						return;
// 					}else {
// 						fncGetList(1); 
// 					}
				}
			});
        });

		
		$(function() {
			
			
			
			
			
			$( "#searchSubmmit" ).on("click" , function() {
// 			$( "button:contains('검색')" ).on("click" , function() {
				if ( $( '#searchKeyword').val() == '' ){
					$("#searchKeyword").focus();
					return;
				}
				fncGetList(1);
			});
			
			
			
			
			// 상세조회
// 			$(document).on("click")
			$( "#listAdoptJSON" ).on("click", ".getadopt" , function() {
				self.location ="/adopt/getAdopt?postNo="+$(this).children( $('input')).val().trim();
			});
			
			// 글 등록하기
			$( "button:contains('작성')" ).on("click" , function() {
				var lv = $('#levels').val();
				var id = $('#sessionId').val();
				var role = '${sessionScope.user.role}';
				console.log(lv);
				if(lv == '미인증회원' ){
		              swal({
		                   title: "인증회원만 작성 가능합니다.",
		                   text: "인증하기를 누르면 인증페이지로 이동합니다.",
		                   icon: "warning",
		                   buttons: ["닫기", "인증하기"],
		                   dangerMode: true     
		                 })
		                 .then((willDelete) => {
		                   if (willDelete) {
		                        self.location = "/users/addUsersAddition.jsp"
		                        }
		        	 });   
					return;
				} else if (${sessionScope.user == null}) {
					$("#login-modal").modal('show'); 
					
					return;
				} else if (role == 'admin') {
					swal({
		                   text: "운영자는 작성할 수 없습니다.",
		                   icon: "warning",
		                   buttons: { cancel:"확인"},
		                   dangerMode: true     
		             });
					return;
				}

				self.location = "/adopt/addAdopt?boardCode=${param.boardCode}"
			});
			
			$( "font:contains('분양게시판')" ).on("click" , function() {
				self.location = "/adopt/listAdopt?boardCode=${param.boardCode}"
			});
			
// 			$( "#searchSubmmit" ).on("click" , function() {
				
// 				if (   $('#searchSubmmit').css( 'border-radius'  ) == '0px 50px 50px 0px' ) {
// 					$('#searchSubmmit').css( 'border-radius','50px' );
// 				} else {
// 					$('#searchSubmmit').css( 'border-radius','0px 50px 50px 0px' );
// 				}
				
// 				$('#areaCondition').toggle( 'slow' );
// 				$('#searchCondition').toggle( 'slow' );
// 				$('#searchKeyword').toggle( 'slow' );
// 			});

		});	
	
	
		$('select[name=areaCondition]').change( function(){
			console.log("지역 체인지");
		
			postSize = 1;
			listAdopt(postSize,"dd");
		});
		
		
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/adopt/listAdopt?boardCode=AD").submit();
		}
		
// 		if ( $('#totalCount').val() == 0){
// 			$('#searchEmpty').html( 
// // 					'<div class="col-md-12"><div class="block text-center"><b><font size="5px" color="#f04f23"> \''+$('#searchKeyword').val()+'\'</font>'+'에 대한 검색 결과가 없습니다.</b>'
// 					'<div align="center" style="display: flex;justify-content: center;align-items: center;"><div id="item">'
// 					+'<div class="block text-left"><b><font size="5px"><font color="#f04f23"> \''+$('#searchKeyword').val()+'\'</font>'+'에 대한 검색 결과가 없습니다.</font></b></div>'
//             		+'<p align="left"><br/>단어의 철자가 정확한지 확인해 주세요.<br/>'
//             		+'검색어의 단어 수를 줄이거나, 다른 검색어로 검색해 보세요.<br/>'
//             		+'보다 일반적인 검색어로 검색해 주세요.</p></div></div></div>'			
// 			);
// 		}
		
// 		if(${search.areaCondition != null }){
// 			$('select[name=areaCondition]').val('${search.areaCondition}').prop('selected', true);
// 		}
	
	</script>
	
	
	
</body>

</html>