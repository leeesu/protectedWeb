<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<html>

<script type="text/javascript">
	var prodNo = ${product.prodNo};

	$(function() {
	
		$("button.btn.btn-primary").on("click", function() {
			self.location = "/product/listProduct?menu=search";
		});
		
		$("button.btn.btn-success").on("click", function() {
			self.location = "/cart/listCart";
		});

	});
</script>

<head>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<%--head.jsp--%>

<body class="hold-transition skin-blue sidebar-mini layout-boxed">
	<form name="form">
		<input type="hidden" id="prodNo" name="prodNo"
			value="${product.prodNo}" />
		<div class="wrapper">



			<%-- Content Wrapper. Contains page content --%>
			<div class="content-wrapper">
				<%-- Content Header (Page header) --%>
				<section class="content-header">
					<h1>상품 상세보기</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> 상품관리</a></li>
						<li class="active">상세보기</li>
					</ol>
				</section>

				<div class="col-md-12">
					<div class="jumbotron">
						<h1>장바구니에 등록완료했습니다!</h3>
						<br/>
						<br/>
						
						<div class="box-footer">
							<button type="button" class="btn btn-primary">
								<i class="fa fa-list"></i> 목록
							</button>
							<div class="pull-right">
								<button type="button" class="btn btn-success">
									<i class="fa fa-save"></i> 장바구니 확인
								</button>
							</div>

						</div>
					</div>
				</div>
			</div>
			
		</div>
</body>

</html>

