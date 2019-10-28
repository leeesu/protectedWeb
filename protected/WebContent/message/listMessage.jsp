<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->

<!DOCTYPE html>
<html>

<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>보호할개 · 마이페이지 </title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/apps/email.css">
    
      	<style type="text/css">
 		
 		@font-face {
    		font-family: 'YouandiModernTR';
   		 	font-style: normal;
    		font-weight: normal;
    		src: url(/resources/font/Youandi_Modern_TextRegular.woff) format('woff');
		}
    	
    	#mainNav, body, .nav-link, .dropdown-item, .navbar-brand, h2, h3, h4, p, a, th, td {
    		font-family: 'YouandiModernTR', sans-serif !important;
    	} 	
		
		.navbar-brand{
			font-weight: bold;
		}
		
		.swal-button {
		  background-color: #f04f23;
		  border: 1px  #f04f23;
		}
		
		.swal-button:hover {
		  background-color: #f04f23;
		  border: 1px  #f04f23;
		}
		
		.swal-button--cancel {
		    color: white;
		    background-color: #f04f23;
		}
		
		html {
	 		scroll-behavior: smooth;
		}
	
  	</style>
    
    <jsp:include page="/layout/toolbar.jsp"></jsp:include>
</head>

<body> 

<!--====================================================
                         MAIN NAVBAR
======================================================-->        
	<div class="hero-wrap hero-bread" style="padding-bottom: 60px; padding-top : 60px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2">Message</span><span> List</span>
					</p>
					<font size="7">쪽지함</font>
				</div>
			</div>
		</div>
	</div>
<!--====================================================
                        PAGE CONTENT
======================================================-->
<div class="container" style="min-height:500px;">
    <div class="page-content d-flex align-items-stretch">
    <input type="hidden" id="myId" name="senderNick" value="${ sessionScope.user.nickname }"/>

        <!--***** SIDE NAVBAR *****-->
		<jsp:include page="/users/mypage/userSideBar.jsp"></jsp:include>

            <!--***** MAILBOX *****-->     
            <div class="row" id="emails">
                <form name="pageForm">
            	</form>
                <div class="mail-box">
                    <aside class="sm-side"> 
                        <div class="inbox-body">
                            <a href="#messageModal" data-toggle="modal" title="Compose" class="btn btn-compose">쪽지작성 </a>
                            <!-- Modal -->
                            
                            <!-- /.modal -->
                        </div>
                        <ul class="inbox-nav inbox-divider">
<!--                             <li> -->
<!--                                 <a href="/message/listMessage?searchCondition=all"><i class="fa fa-envelope-o"></i> 전체쪽지함</a> -->
<!--                             </li> -->
                            <li>
                                <a href="/message/listMessage?searchCondition=send"><i class="fa fa-envelope-o"></i> 보낸쪽지함</a>
                            </li>
                            <li>
                                <a href="/message/listMessage?searchCondition=receive"><i class="fa fa-envelope-o"></i> 받은쪽지함 <span class="label label-danger pull-right received"></span></a>
                            </li>
<!--                             <li> -->
<!--                                 <a href="/message/listMessage?searchCondition=delete"><i class=" fa fa-trash-o"></i> Trash</a> -->
<!--                             </li> -->
                        </ul>  
                    </aside>
                    <aside class="lg-side"> 
                        <div class="inbox-body">
                            <div class="mail-option"> 
<!--                                 <div class="btn-group hidden-phone"> -->
<!--                                     <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false"> -->
<!--                                          <input type="checkbox" class="mail-checkbox mail-group-checkbox"> All  -->
<!--                                          <i class="fa fa-angle-down "></i> -->
<!--                                      </a> -->
<!--                                     <ul class="dropdown-menu drop-inbox"> -->
<!--                                         <li><a href="#"><i class="fa fa-pencil"></i> All</a></li> -->
<!--                                         <li><a href="#"><i class="fa fa-ban"></i> None</a></li> -->
<!--                                         <li><a href="#"><i class="fa fa-book"></i> Read</a></li> -->
<!--                                         <li class="divider"></li> -->
<!--                                         <li><a href="#"><i class="fa fa-trash-o"></i> Unread</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->

<!--                                 <div class="btn-group hidden-phone"> -->
<!--                                     <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false"> -->
<!--                                      More -->
<!--                                      <i class="fa fa-angle-down "></i> -->
<!--                                  </a> -->
<!--                                     <ul class="dropdown-menu drop-inbox"> -->
<!--                                         <li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li> -->
<!--                                         <li><a href="#"><i class="fa fa-ban"></i> Spam</a></li> -->
<!--                                         <li class="divider"></li> -->
<!--                                         <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                                 <div class="btn-group"> -->
<!--                                     <a data-toggle="dropdown" href="#" class="btn mini blue"> -->
<!--                                      Move to -->
<!--                                          <i class="fa fa-angle-down "></i> -->
<!--                                     </a> -->
<!--                                     <ul class="dropdown-menu drop-inbox"> -->
<!--                                         <li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li> -->
<!--                                         <li><a href="#"><i class="fa fa-ban"></i> Spam</a></li> -->
<!--                                         <li class="divider"></li> -->
<!--                                         <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
 		           
                                    	<div class="col-md-6" align="left">
					    					<p style="font-weight: bold;">
					    						전체  ${resultPage.totalCount } 건
					    					</p>
					   					</div>
                            </div>
                            <c:if test="${resultPage.totalCount == 0}">
								<div class="row">
									<div class="col-md-9" align="center" style="height: 500px; padding-top: 250px;">
										<p>쪽지함에 쪽지가 없습니다<p/>
									<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
									<input type="hidden" id="currentPage" name="currentPage" value="" />					
									</div>
								</div>
							</c:if>
							<c:if test="${resultPage.totalCount != 0 }">
                            <table class="table table-inbox table-hover">
								<thead>
									<tr align="center">
									    <td class="inbox-small-cells" width="50px">
<!--                                             <input type="checkbox" class="mail-checkbox" id="allCheck"> -->
                                        </td>
                                        <c:if test="${ search.searchCondition=='all' || search.searchCondition=='delete'  }">
											<th width="90px" class="text-center">보낸사람</th>
											<th width="90px" class="text-center">받은사람</th>
										</c:if>
										<c:if test="${ search.searchCondition=='send' }">
											<th width="170px" class="text-center">받은사람</th>
										</c:if>
										<c:if test="${ search.searchCondition=='receive' }">
											<th width="170px" class="text-center">보낸사람</th>
										</c:if>
										<th width="300px" class="text-center">제목</th>
										<th width="200px"  class="text-center" align="center" class="text-center">보낸일</th>
										<th width="200px"  class="text-center" align="center" class="text-center">받은일</th>
										<c:if test="${ search.searchCondition == 'receive' }">
										<th  class="text-center" width="75px">더보기</th>
										</c:if>
										<c:if test="${ search.searchCondition != 'receive' }">
										<th width="75px"></th>
										</c:if>
									</tr>
								</thead>
                                <tbody>
                                	<c:set var="i" value="0" />
                                	<form role="form" class="form-horizontal" name="mailSearchForm">
                                	<input type="hidden" name="searchCondition" value="${ search.searchCondition }">
                             	
                                	<input type="hidden" id="currentPage" name="currentPage" value="" />		
									<c:forEach var="message" items="${list}">
										<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="messageViewModal" class="modal fade messageViewModal" style="display: none;">
			                                <div class="modal-dialog">
			                                    <div class="modal-content">
			                                        <div class="modal-body">
					                                        <div class="row" style="position: relative; height: 25px;">
					                                        	<div class="modalMessageNo" style="display: none;"></div>
																<div class="col-md-6"
																	style="position: absolute; left: 0px; bottom: 0px;">제목 | <span class="messageTitle"></span></div>
																			
																<div class="col-md-6" align="right"
																	style="position: absolute; right: 0px; bottom: 0px;">
																	보낸일 | <span class="sendDate"> </span>
																</div>
															</div>
			                                                <div class="row messageId" style="position: relative; height: 25px;">
																<div class="col-md-6"
																	style="position: absolute; left: 0px; bottom: 0px;">보낸사람 | <span class="senderNick"></span></div>
																			
																<div class="col-md-6" align="right"
																	style="position: absolute; right: 0px; bottom: 0px;">받은사람 | <span class="receiverNick"> </span></div>
															</div>
															<br/>
			                                                <div class="form-group">
			                                                    <label class="col-lg-2 control-label">내용</label>
			                                                    <hr/>
																<div class="content col-lg-8" >
																	<span class="messageContent"></span>
																</div>
																<hr/>
			                                                </div>
								
			                                                <div class="row form-group">
			                                                    <div class="offset-lg-2 col-lg-12" align="right" style="padding-right: 0;">
			                                                        <button class="btn btn-send ml-3 " data-dismiss="modal"  style="background-color:red;">확인</button>
<!-- 			                                                        <button class="btn btn-send ml-3 sendMessage" style="background-color:red;">답장하기</button> -->
			                                                    </div>
			                                                </div>
			                                        </div>
			                                    </div>
			                                    <!-- /.modal-content -->
			                                </div>
			                                <!-- /.modal-dialog -->
			                            </div>
                                    <tr style="height:46px;">
                                        <td class="inbox-small-cells text-center" width="50px">
<%--                                         	<c:if test="${ search.searchCondition != 'delete' }"> --%>
<!-- 			                                <div class="btn-group"> -->
<!-- 			                                    <a data-original-title="trash" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips"> -->
<!-- 													<i class=" fa fa-trash"></i> -->
<!-- 												</a> -->
<!-- 			                                </div> -->
<%-- 			                                </c:if> --%>
                                            <input type="hidden" name="messageNo" value="${ message.messageNo }">
                                        </td>
                                        <c:if test="${ search.searchCondition=='all' || search.searchCondition=='delete'  }">
											<td  class="text-center" width="85px">${ message.senderNick }</td>
											<td class="text-center" width="85px">${ message.receiverNick }</td>
										</c:if>
										<c:if test="${ search.searchCondition=='send' }">
											<td class="text-center" width="170px">${ message.receiverNick }</td>
										</c:if>
										<c:if test="${ search.searchCondition=='receive' }">
											<td class="text-center" width="170px">${ message.senderNick }</td>
										</c:if>
                                        <td class="view-message text-center" width="300px"> 
                                       		${ message.messageTitle }
                                        	<input type="hidden" name="messageContent" value="${ message.messageContent }"/>
                                        </td>
                                        <td class="view-message text-center" width="200px"> 
											<fmt:formatDate value="${ message.sendDate }" pattern="yyyy-MM-dd"/>
										</td>
                                        <td class="view-message text-center" width="200px" id="receiveDate">
                                        <c:if test="${ message.messageStatus == 0 }">
                                        	읽지 않음
                                        </c:if>
                                        <c:if test="${ message.messageStatus != 0 }">
                                        	<fmt:formatDate value="${ message.receiveDate }" pattern="yyyy-MM-dd"/>
                                        </c:if>
                                        </td>
                                        <td class="view-message text-center" width="75px" >
<%--                                         	<c:if test="${ search.searchCondition=='receive' }"> --%>
                                        	<a href=".messageViewModal" id="confirmMSG" data-toggle="modal" title="Compose" class="btn btn-compose">
                                        		더보기
                                        	</a>
<%--                                         	</c:if>                                        	 --%>
<%--                                         	<c:if test="${ search.searchCondition=='receive' }"> --%>
<!--                                         	<a></a> -->
<%--                                         	</c:if> --%>
<%--                                         	<c:if test="${ search.searchCondition=='delete' }"> --%>
<!-- 	                                        	<div class="btn-group"> -->
<!-- 				                                    <a data-original-title="trash" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips"> -->
<!-- 														<i class=" fa fa-trash deleteMessage"></i> -->
<!-- 													</a> -->
<!-- 				                                </div> -->
<%--                                         	</c:if> --%>
                                        </td>
                                    </tr>
									</c:forEach>
									</form>
                                </tbody>
                            </table>
                            <div style="padding-left: 250px;">
                            	<jsp:include page="/common/pageNavigator_new.jsp"/>
                            </div>
                            </c:if>
                        </div>
                    </aside>
                </div>
            </div> 
        </div>
     </div>
     <div style="min-height: 50px;">
     </div>
    
    <jsp:include page="/common/modal/modalMessage.jsp"></jsp:include>
    <jsp:include page="/layout/footer.jsp"></jsp:include>

    <!--Global Javascript -->
    <script src="/resources/newTemplate/admin/js/jquery.min.js"></script>
    <script src="/resources/newTemplate/admin/js/popper/popper.min.js"></script>
    <script src="/resources/newTemplate/admin/js/tether.min.js"></script>
    <script src="/resources/newTemplate/admin/js/bootstrap.min.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.cookie.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.validate.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/chart.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/front.js"></script> 
    
    <!--Core Javascript -->
    <script>
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("input[name='searchCondition']").val('${search.searchCondition}')
		$("form[name='mailSearchForm']").attr("method", "POST").attr("action","/message/listMessage").submit();
	}
	$('tr').on("click", "#confirmMSG", function() {
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		if(dd<10) {
		    dd='0'+dd
		} 
		if(mm<10) {
		    mm='0'+mm
		} 
		today = yyyy+'-' + mm+'-'+dd;
		$(    $(this).parent().parent().children(  "td:nth-child(5)"   )   ).text(today);
// 		changeCount();
		
	});
	
// 	$(function(){
// 		$("#messageViewModal").on("load", function(){
// 			var messageNo=$(this).parents().children("td").children("input[name='messageNo']").val();
// 			alert(messageNo);
// 			debugger;
// 			self.location="/message/getMessage?messageNo="+messageNo;
// 		})
// 	});

// 	$(document).ready(function(){
// 		$(".messageViewModal").on('show.bs.modal', function(event){
// 			var messageTitle=$(event.relatedTarget).data('messageTitle');
// 			var messageContent=$(event.relatedTarget).data('messageContent');
// 			var sendDate=$(event.relatedTarget).data('sendDate');
// 			var senderId=$(event.relatedTarget).data('senderId');
// 			var receiverId=$(event.relatedTarget).data('receiverId');
			
// 		})
// 	})

// 	$(function(){
// 		$(".sendMessage").on("click", function(){
// 			var sendId=$(this).parents().parents().parents().children(".messageId").children().children(".sendId").text().trim();
// 			alert(sendId);
// 		})
// 	})
	
	$(function(){
		$('td:contains("더보기")').on('click', function(){
			var messageNo=$(this).parents().children("td").children("input[name='messageNo']").val();
// 			alert(messageNo);
			$.ajax({
				url : "/message/json/getMessage/"+messageNo,
				method : "GET",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
// 					alert(JSON.stringify(JSONData))
// 					var sendDate=JSONData.sendDate;
// 					alert(sendDate);
					$(".messageTitle").text(JSONData.message.messageTitle);
					$(".messageContent").text(JSONData.message.messageContent);
					$(".sendDate").text(JSONData.sendDate);
					$(".senderNick").text(JSONData.message.senderNick);
					$(".receiverNick").text(JSONData.message.receiverNick);
					changeCount();
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	})
	
		$(function() {

			$(document).ready(function(){
				changeCount();
			});

		});
		function changeCount(){
			var nickname=$("#myId").val();
			var rcvNick=JSON.stringify({nickname:nickname});
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/message/json/getReceiveTotalCount",
				data : rcvNick,
				datatype : "json",
				success : function(response){
	//					alert(response);
					if(nickname != null && response != 0){
						$(".received").show();
						$(".received").text(response);
						console.log(response);
					}
					if(nickname != null && response == 0){
						$(".received").hide();
					}
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}

			});
		}
// 		$(function(){
// 			$(".submit").on("click", function(){
// 				swal({
// 					text : "쪽지를 전송하였습니다.",
// 					buttons : {
// 						catch : {
// 							text : "확인"
// 						}
// 					}
// 				})
// 				.then((A) => {
// 					if(A) {
// 						$(".sendMessage").attr("method", "POST").attr("action", "/message/addMessage").submit();
// 						$("#messageModal").modal('hide');
// 					}
// 				})
// 			})
// 		})
		
		$(function(){
			$("#allCheck").on("click", function(){
				if($("#allCheck").prop("checked")){
					$("input[name='checkDel']").prop("checked",true);
				}else{
					$("input[name='checkDel']").prop("checked",false);
				}
			})
		})
		
		$(function(){
			$(".fa-trash").on("click", function(){
					var messageNo=$(this).parents().parents().parents(".inbox-small-cells").children("input[name='messageNo']").val();
					var result=confirm("삭제하시겠습니까?")
					if(result){
						self.location=("/message/updateMessage?messageNo="+messageNo);
					}
			})
		})
		
		

    </script>
    
</body>

</html>