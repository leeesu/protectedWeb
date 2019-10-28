<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- //////////////////////  DAY FORMAT ///////////////////////// -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보호할개 · 스토어</title>
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>




<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style>
body {
	border: 0px;
	border-spacing: 0px;
}

#postTitle {
	padding-left: 120px;
	padding-right: 120px;
}

#id {
	padding-left: 80px;
	padding-right: 80px;
}

#no {
	padding-left: 50px;
	padding-right: 50px;
	font-size: x-small;
}

#countfont {
	font-size: x-small;
}

#boardfont {
	font-size: x-small;
	padding-left: 50px;
	padding-right: 50px;
}

table {
	width: 1000px;
}

#searchKeyword {
			height: 40px;
			width: 150px;
			border : 1px solid #D3D3D3;
			padding-left: 5px;
			border-right: 0px;
}

#searchSubmmit {
	width: 60px;
	height: 40px;
	border-radius: 0px 15px 15px 0px;
	border: 1px solid #D3D3D3;
	margin-left: 0px;
}

#searchCondition {
	height: 40px;
	border-radius: 15px 0px 0px 15px;
	border-right:0px; 
}

#selectPageSize {
	height: 30px;
}

#newstd {
	min-width: 251px;
	max-width: 251px;
}

.btn-default {
	height: 30px;
	color: white;
}

th {
	background-color: #F0F0F0;
}

.form-group4 {
	padding-right: 30px;
}

.navigation {
	margin-left: 450px;
	margin-bottom: 200px;
}

#setting{
	margin-top:70px;
}
.form-group {
			display: inline-block;
			right: 0%;
			text-align: right;
		}
/* .form-inline{ */
/* 	margin-right:190px;} */
</style>

	<!-- //////////////////////ToolBar Start ///////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!--/////////////////////// ToolBar End ////////////////////////////////-->

</head>

<body>

<body class="goto-here">
	<div class="hero-wrap hero-bread"
		style="padding-bottom: 30px; padding-top: 60px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p>
						<span class="mr-2">Protectedog</span> <span>Store</span>
					</p>
					<font size="7">관리자 상품 관리</font>
				</div>
			</div>
		</div>
	</div>
	<br />
	<p />
	<!--/////////////////////// form start /////////////////////////////////-->


<%-- 	<c:if test="${resultPage.totalCount == 0}"> --%>
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-9" align="center" -->
<!-- 				style="height: 500px; padding-top: 150px;"> -->

<%-- 				<jsp:include page="/common/searchResult.jsp"></jsp:include> --%>
<!-- 			</div> -->
<!-- 			</div> -->
			
<%-- 	</c:if> --%>
	<!-- table 위쪽 검색 Start /////////////////////////////////////-->


	<!--  table Start /////////////////////////////////////-->
			<div class="container">
					    		<div class="row" > 
	 		           <div class="col-md-12" align="left">
			<b>전체 ${resultPage.totalCount} 건, 현재 ${resultPage.currentPage} 페이지</b>
			</div>
				<div class="col-md-6" id="justify" align="left" style="padding-bottom: 20px;">
					<button type="button" class="btn btn-default" id="addProduct" style="height: 40px;">상품등록</button>
			 	</div>
				
				<div class="col-md-6"  align="right" style="padding-bottom: 20px;">
					<form class="form-inline" name="detailForm" style="float: right;">
						<div class="form-group" >
							<select class="form-control" id="searchCondition"
								name="searchCondition">
								<option value="0"
									${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품명</option>
								<option value="1"
									${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품가격</option>
							</select>
						</div>
		
		
						<div class="form-group">
							<label class="sr-only" for="searchKeyword">검색어</label> <input
								type="text" id="searchKeyword"
								name="searchKeyword" placeholder="검색어를 입력해주세요."
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
							<button type="button" id="searchSubmmit"
								class="btn btn-default searchSubmmit">
								<span class="fas fa-search"></span>
							</button>
						</div>
		
						<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
						<input type="hidden" id="currentPage" name="currentPage" value="" />
					</form>
				</div>
			
		
			</div>
			
	
				<table id="cart" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="width: 10%" class="text-center">상품번호</th>
							<th style="width: 30%" class="text-center">상품명</th>
							<th style="width: 10%" class="text-center">상품가격</th>
							<th style="width: 20%" class="text-center">재고수량</th>
							<th style="width: 10%" class="text-center"> 상품유형</th>
							<th style="width: 40%" class="text-center">등록일</th>
						</tr>
					</thead>

					<tbody>
						<c:set var="i" value="0" />
						<c:forEach var="product" items="${list}">
							<c:set var="i" value="${i+1}" />
					<tr>
						<td align="center" >${product.prodNo }</td>
						<td align="center">${product.prodName}<input type="hidden"
							name="prodNo" value="${product.prodNo}" />
						</td>
						<td align="center" width="5%">${product.price}</td>
						<td align="center">${product.quantity}</td>
							<td align="center"><c:if test="${product.prodCode == 10 }">
							사료</c:if>
							<c:if test="${product.prodCode == 20 }">
							간식</c:if>
							<c:if test="${product.prodCode == 30 }">
							의류</c:if><td align="center">
<fmt:formatDate pattern="yyyy-MM-dd" value="${product.regDate}" /></td>
					</tr>
						</c:forEach>

					</tbody>
					<tfoot>
						<tr>
							<td ><a href="/product/listProduct" style="margin-top: 20px" class="btn btn-general btn-white"><i
									class="fa fa-angle-left"></i>상품리스트로</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong></strong></td>
							<td></td>
						</tr>
					</tfoot>
				</table>
			</div>

		<!--  table end /////////////////////////////////////-->
		<br>
		
		<br>

	<div style="padding-left: 650px;">
		<jsp:include page="../../common/pageNavigator_new.jsp" /></div>
		<br/><br/><br/>


	<!--///////////////////////////////// form end /////////////////////////////////////-->
	<!--================ start footer Area  =================-->
	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!-- footer End /////////////////////////////////////-->
	<!--================ End footer Area  =================-->
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============

	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();	
		$("form").attr("method", "POST").attr("action",
				"/product/listAdminProduct").submit();
	}

	//============= Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$("#addProduct").on("click", function() {
			self.location = "/shop/product/addProduct.jsp";
		});

		// 	$(function() {

		$("#searchSubmmit").on("click", function() {
			fncGetList(1);
		});

		// 		$("#change2").on(
		// 				"click",
		// 				function() {
		// 					var prodNo = $(this).data('param1');
		// 					self.location = "/purchase/updateTranCodeByProd?prodNo="
		// 							+ prodNo + "&tranCode=2";
		// 				})
		// 		$("#prod").on(
		// 				"click",
		// 				function() {
		// 					self.location = "/product/getProduct?prodNo="
		// 							+ $(this).text().trim();
		// 				});

	});
</script>
</body>
</html>