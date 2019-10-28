 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	    <title>보호할개 · 투표</title>
    <!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		#checkPostTitle{
	      width:300px;
	      padding:0 5px;
	      overflow:hidden;
	      text-overflow:ellipsis;
	      white-space:nowrap;
	  } 
		select, #searchKeyword {
			height: 33px;
		}
		
		#searchKeyword {
			height: 40px;
			width: 150px;
			border : 1px solid #D3D3D3;
			padding-left: 5px;
		}
		
		#searchSubmmit {
 			width : 60px; 
			height : 40px;
 			border-radius : 0px 15px 15px 0px; 
			border : 1px solid #f04f23;
		}
		
		#write {
 			width : 40px; 
			height : 40px;
 			border-radius : 15px; 
			border : 1px solid #f04f23;
		}
		
		#voteCondition {
			height : 40px;
			border-radius : 15px 0px 0px 15px;
			padding-left: 10px;
			border-color: #D3D3D3;
			border-right: 0px;
		}
		
		#searchCondition {
			height : 40px;
			padding-left: 5px;
			border-color: #D3D3D3;
			border-right: 0px;
		}
    </style>
    
 	<!-- ToolBar Start ///////////////////////////////////// -->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!--ToolBar End /////////////////////////////////////  --> 
    
  </head>
  <body class="goto-here">
    <div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">Support</span> <span>Apply</span></p>
            <font size="7">투표게시판</font>
          </div>
        </div>
      </div>
    </div>
	<br/><p/>
	<div class="sectionContainer ">
    <section class="ftco-section bg-light" style="padding-bottom: 0px; padding-top : 20px;">   

		 <form class="form-inline" name="detailForm">
		    	<div class="container" >
		    	
				<!--검색 부터 -->		    	
		    		<div class="row" > 
					    <div class="col-md-12 text-left">
					    	<p style="font-weight: bold;">
					    		전체  ${resultPage.totalCount } 건
					    	</p>
					    </div>
					<div class="col-md-6" id="justify" align="left">
		    		<button type="button" id="btnAdd" class="btn btn-default" style="float: left" >작성</button>
			 		</div>
			 		 	<div class="col-md-6" align="right">
						<div class="form-group" style="padding-left: 160px">
						    <select  id="voteCondition" name="voteCondition" >
								<option value="0" ${ ! empty search.voteCondition && search.voteCondition==0 ? "selected" : "" }>전체</option>
								<option value="1" ${ ! empty search.voteCondition && search.voteCondition==1 ? "selected" : "" } >투표중</option>
								<option value="2" ${ ! empty search.voteCondition && search.voteCondition==2 ? "selected" : "" } >투표완료</option>
							</select>   

						    <select  name="searchCondition" id="searchCondition" >
								<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" } >제목</option>
								<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
							</select>
	
						    <label class="sr-only" for="searchKeyword"> 검색어</label>
						    <input type="text"  id="searchKeyword" name="searchKeyword"  placeholder="검색어를 입력하세요." value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
								<button type="button" id="searchSubmmit" class="btn btn-default searchSubmmit" style="padding-bottom: 6px;margin-left: 0px;">
							<span class="fas fa-search"></span>
						</button>
						</div>
				</div>
			    	</div>    
    		    	<br/>
    		    	
			 	<c:if test="${resultPage.totalCount eq 0 }">
			 		<jsp:include page="/common/searchResult.jsp"></jsp:include>
			 	</c:if>
				<!-- 썸네일 부터 -->
		    		<div class="row">
		    			<div class="col-md-10 col-lg-12 order-md-last">
		    				<div class="row" id="thumbnailRow">
			    			<c:set var="i" value="0" />
							  <c:forEach var="funding" items="${list}">
				    			<div class="col-sm-6 col-md-6 col-lg-4 ftco-animate" >
				    				<div class="desc-comp-offer-cont" style="padding-top:10px; background-color: white">
				    					<input type="hidden" value="${funding.postNo }" />		    					
				    				
				    					 <!-- 투표종료 -->
										 <c:if test ="${!(funding.statusCode eq 1) }">
										 &emsp;조회수 ${funding.voteViewCount }
				                        <a href="#" class="img-prod"><img src="/resources/file/fileSF/end.png" style=" min-height:210px; max-height:210px; max-width:330px; min-width:330px; width:100%;background:url('/resources/file/fileSF/${funding.mainFile}') no-repeat center center;background-size:cover;" onerror="this.src='http://placehold.it/400x400'" />
				    					</a>
				    					</c:if>
				    					
										 <!-- 투표중 -->
										 <c:if test ="${funding.statusCode eq 1 }">		
										  &emsp;조회수 ${funding.voteViewCount }
										<a href="#" class="img-prod"><img class="img-fluid" src="/resources/file/fileSF/${funding.mainFile}" alt="Colorlib Template" style="min-height:210px; max-height:210px; min-width:330px; max-width:330px;" >
				    					<input type="hidden" value="${funding.postNo }" />		    					
				    					</a>
				    					</c:if>		
				    						    					
				    					<div class="text py-3 px-3">
				    					<div id="checkPostTitle">
				    					<font size="5"><b>${funding.postTitle}</b></font>
				    					</div>
										<div class="row" style="position:relative;height:35px;">
										         <div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" > <font size="3">${funding.nickname}</font></div>
										         <div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " ><font size="4"><b><strong style="color:#f04f23">${funding.voteRate}%</strong></b></font></div>
										 </div>										   				
										 <!-- 투표종료 -->
										 <c:if test ="${!(funding.statusCode eq 1) }">
										   <div class="progress">												 
										   <div class="progress-bar" role="progressbar" style="width:${funding.voteRate}%; background-color:#e8cec8!important;"></div>
										   </div>	
											 <div align="right">    						
											<font size="5"  style="color:#d43333"><b>종료</b></font> 	
											</div>
										 </c:if>
										 
										 <!-- 투표중 -->
										 <c:if test ="${funding.statusCode eq 1 }">										 
										   <div class="progress">												 
										   <div class="progress-bar " role="progressbar" style="width:${funding.voteRate}%; background-color:#e66447!important;" ></div>
										   </div>											 
											 <div align="right">						
											<font size="5" >D- ${funding.voteRemainDate }</font> 	
											</div>
										</c:if>
										
				    					</div>
				    				</div>
				    			</div>
				    			</c:forEach>    
				    		</div>	
				    	</div>
		    		</div>	
		    	</div>
		    <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->		    	
		    <input type="hidden" id="currentPage" name="currentPage" value=""/>	  
		    <input type="hidden" id="statusConde" name="statusConde" value="${funding.statusConde}"/>	  
		 </form>

    </section></div>
		<!--     ================ start footer Area  ================= -->
		<!--     footer Start ///////////////////////////////////// -->
		 	     <jsp:include page="/layout/footer.jsp"></jsp:include> 
		<!--    	footer End /////////////////////////////////////   -->
		<!--     ================ End footer Area  ================= -->
  

  <!-- loader -->
  <!-- loader -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============
	function fncGetList(currentPage) {
	   	
	   	$("#currentPage").val(currentPage)
	   	$("form").attr("method" , "POST").attr("action" , "/funding/listVoting").submit();
	 
	}

	$(document).ready(function(){
		$('#searchKeyword').keydown( function(e) {
			if(e.keyCode == 13) {
				fncGetList(1);
			}
		});
	});
	
	var page = 1;
	
    $(function(){
    	

        $(window).scroll(function(){    
       	//             scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다. 
					 if( $(this).scrollTop() +  $(this).height() + 484 > $(document).height() ){	
        	            	//alert("zz")

        	            		page++;
        					$.ajax(
        							{
        								url : "/funding/json/listVoting/" ,
        								method : "POST" ,
        								data : JSON.stringify({
        									searchCondition : $("#searchCondition").val(),
        									searchKeyword : $("#searchKeyword").val(),
        									currentPage : page,
        									voteCondition : $("#voteCondition").val()
        								}) ,
        								dataType : "json" ,
        								headers : {
        									"Accept" : "application/json",
        									"Content-Type" : "application/json"
        								},
        								error: function(request, status, error){ 
        									console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        						        },
        								success : function(JSONData,status) {
        									var funding = JSONData.list;
        									var display ="";
        									
        									 $.each(funding, function(index, funding){
        										 display +="<div class=\"col-sm-6 col-md-6 col-lg-4 ftco-animate\">"+
												 "<div class=\"desc-comp-offer-cont\" style=\"padding-top:10px\">";	
        								
        										if(funding.statusCode !=1){
         									     display += "&emsp;조회 "+funding.voteViewCount+
         					                        		"<a href=\"#\" class=\"img-prod\"><img src=\"/resources/file/fileSF/end.png\" style=\" min-height:210px; max-height:210px; max-width:330px; min-width:330px; width:100%;background:url('/resources/file/fileSF/"+funding.mainFile+"') no-repeat center center;background-size:cover;\" onerror=\"this.src='http://placehold.it/400x400'\" />"+
         					    							"<input type=\"hidden\" value=\""+funding.postNo+"\" /></a> ";	    																
        										}
        										
        										 else{
            									     display += "&emsp;조회 "+funding.voteViewCount+
			          					                        "<a href=\"#\" class=\"img-prod\"><img class=\"img-fluid\" src=\"/resources/file/fileSF/"+funding.mainFile+"\"  style=\"min-height:210px; max-height:210px; min-width:330px; max-width:330px;\" >"+
			          					    					"<input type=\"hidden\" value=\""+funding.postNo+"\" /></a> ";	    																
         										}
        											display += "<div class=\"text py-3 px-3\"><div id=\"checkPostTitle\">	<font size=\"5\"><b>"+funding.postTitle+"</b></font></div>"+
        					    						       "<div class=\"row\" style=\"position:relative;height:35px;\">"+						        										
	        											       "<div class=\"col-xs-8 col-md-8\" style=\"position:absolute; left:0px; bottom:0px;\" > <font size=\"3\">"+funding.nickname+"</font></div>"+
	        											       "<div class=\"col-xs-4 col-md-4\" align=\"right\" style=\"position:absolute; right:0px; bottom:0px; \" ><font size=\"4\"><b><strong style=\"color:#f04f23\">"+funding.voteRate+"%</strong></b></font></div></div>";										   				
        											 
       					    				
         										if(funding.statusCode !=1){
          									     	display +=  "<div class=\"progress\"> <div class=\"progress-bar\" role=\"progressbar\" style=\"width:"+funding.voteRate+"%; background-color:#e8cec8!important;\"></div>"+
											   					 "</div> <div align=\"right\"> <font size=\"5\"  style=\"color:#d43333\"><b>종료</b></font> </div>";	    																
         										}
         										 else{
             									     display += "<div class=\"progress\"> <div class=\"progress-bar \" role=\"progressbar\" style=\"width:"+funding.voteRate+"%; background-color:#e66447!important;\" ></div>"+
      											   				"</div> <div align=\"right\"><font size=\"5\" >D- "+funding.voteRemainDate+"</font></div>";	    																
          										}	        											       
							
	         										display += "</div></div></div>";	
        									 });
	         										
	         										$("#thumbnailRow").append(display);
	         									 	$( ".img-prod" ).on("click" , function() {
	         											$(self.location).attr("href","/funding/getVoting?postNo="+$(this).children("input").val());
	         										});   
	         									
        						}
        							
        					});
        			}

        });
    });
    	
		//============= "검색"  Event  처리 =============	
		 $( "#searchSubmmit" ).on("click" , function() {
			    fncGetList(1);
		});
		//============= "투표중/투표완료"  Event   처리 =============
		$( "#voteCondition" ).change(function(){
				fncGetList('1');
		});    
		//============= 썸네일 사진 클릭 Event  처리 =============	
	 	$( ".desc-comp-offer-cont" ).on("click" , function() {
			$(self.location).attr("href","/funding/getVoting?postNo="+$(this).children("input").val());
		});   
	
        //============= 작성 Event  처리 =============   
        $( document).on("click",'#btnAdd' , function() {
        	if(${user == null}){       		
        		$("#login-modal").modal('show');  		
        	}else if(${user.levelPoint eq 0}){
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
        	
        	}else{
        	
			   		 $.ajax( 
								{
						        	url : "/funding/json/addVoting",
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									error:function(request,status,error){
			                            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			                           },
									success : function(JSONData , status) {
					
						                if(JSONData ==1 ) {
						      			  swal({
						      			   title : "한달에 한번만 글 작성 가능합니다.",
						   		           text: "이미 한달안에 글을 작성하였습니다.",
						   		           dangerMode: true,
						   		           buttons: {
						   							 catch: {
						   							 	text: "확인"
						   							 }
						   				   },			   
						   		      });            	 

						                } else {
					        				$(self.location).attr("href","/funding/getTerms?termsTitle=SFPost&postNo=0");
			
						                } 
									}
									
							});
			   		 
			        }
           });
        
		//============= autocomplete Event  처리 =============			
	      $("#searchKeyword").on("keyup", function(){
	          
	          var search = {searchKeyword : $("#searchKeyword").val(), searchCondition : $("#searchCondition").val()};
	          var convertSearch = JSON.stringify(search);
	          
	          $.ajax({
	             url : "/funding/json/autocomplete/",
	             method : "POST",
	             dataType : "json",
	             data :  convertSearch ,
	             contentType: "application/x-www-form-urlencoded; charset=euc-kr",
	             headers : {
	                "Accept" : "application/json",
	                "Content-Type" : "application/json;charset=euc_kr"
	             },
	             success : function(JSONData, status){
	            	 //alert(JSONData)
	                $("#searchKeyword").autocomplete({
	                   source : JSONData
	                });
	             }
	          });		
	      });	

</script>
  </body>
  </html>