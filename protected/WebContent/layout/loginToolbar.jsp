<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/resources/prodmenu/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/animate.css">
    
    <link rel="stylesheet" href="/resources/prodmenu/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/aos.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/resources/prodmenu/css/flaticon.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/icomoon.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/style.css">
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.js"></script>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="848949930774-4ka6kl79kq1fv7h3q89leonj9ki1o6v7.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js"></script>
    <script type="text/javascript">
//     	$(function(){
//     		$("span:contains('Sign in')").on("click", function(){
//     			$(self.location).attr("href","/users/login");
//     		});
//     	});
    </script>
    
    <style type="text/css">
    	.py-1 bg-black{
    		min-height: 27px;
    	}
    </style>
  </head>
  <body class="goto-here">


    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
       <div class="container">
         <a class="navbar-brand" href="/index.jsp">#PROTECTEDOG</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
           <span class="oi oi-menu"></span> Menu
         </button>

         <div class="collapse navbar-collapse" id="ftco-nav">
           <ul class="navbar-nav ml-auto">
             <li class="nav-item active"><a href="/index.jsp" class="nav-link">Home</a></li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">�о�</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="http://192.168.0.19:8080/adopt/listAdopt?boardCode=AD">�о縮��Ʈ</a>
                <a class="dropdown-item" href="http://192.168.0.19:8080/adopt/listAdopt?boardCode=MS">��������Ʈ</a>
                <a class="dropdown-item" href="http://192.168.0.19:8080/adoptReview/addAdoptReview">����׽�Ʈ</a>
                <a class="dropdown-item" href="http://192.168.0.19:8080/adoptReview/REALaddAdoptReview.jsp">�ı�</a>

              </div>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">���丮�ݵ�</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="http://192.168.0.33:8080/funding/listVoting">��ǥ�Խ���</a>
                <a class="dropdown-item" href="http://192.168.0.33:8080/funding/listFunding">�Ŀ��Խ���</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">����</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                 <a class="dropdown-item" href="http://192.168.0.30:8080/community/getHospital.jsp">����</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">PEDIA</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                 <a class="dropdown-item" href="/community/getBreedPedia.jsp">PEDIA</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">COMMUNITY</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/info/listInfo">��������</a>
                <a class="dropdown-item" href="/community/getDogSense.jsp">�ְ߻��</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
            <c:if test="${ sessionScope.user != null }">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">USERS</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="/message/listReceiveMessage">����������</a>
                <a class="dropdown-item" href="/message/listSendMessage">����������</a>
                <a class="dropdown-item" href="/message/addMessage">��������</a>
                <c:if test="${ sessionScope.user.role eq 'admin' }">
                	<a class="dropdown-item" href="/coupon/addCoupon">��������</a>
                </c:if>
                <a class="dropdown-item" href="/coupon/listCoupon">�����ޱ�</a>
                <a class="dropdown-item" href="/report/addReportView.jsp">�Ű��ϱ�</a>
              </div>
            </li>
            </c:if>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MARKET</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
               <a class="dropdown-item" href="/prodQna/listProdQna?order=1">��ǰQ&a</a>
                <a class="dropdown-item" href="/market/listMarket?order=1">��ȣ����</a>
                <a class="dropdown-item" href="/product/listProduct">��ǰ����Ʈ</a>
                <a class="dropdown-item" href="/product/listAdminProduct">�����ڻ�ǰ����Ʈ</a>
              </div>
            </li>
             <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>

           </ul>
         </div>
       </div>
     </nav>
    <!-- END nav -->


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="/resources/prodmenu/js/jquery.min.js"></script>
  <script src="/resources/prodmenu/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/prodmenu/js/popper.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.easing.1.3.js"></script>
  <script src="/resources/prodmenu/js/jquery.waypoints.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.stellar.min.js"></script>
  <script src="/resources/prodmenu/js/owl.carousel.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/prodmenu/js/aos.js"></script>
  <script src="/resources/prodmenu/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap-datepicker.js"></script>
  <script src="/resources/prodmenu/js/scrollax.min.js"></script>
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!--   <script src="/resources/prodmenu/js/google-map.js"></script> -->
  <script src="/resources/prodmenu/js/main.js"></script>
  </body>
</html>
    
    