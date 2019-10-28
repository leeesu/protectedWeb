<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  bootstrap Dropdown CSS & JS  -->
<!-- <link href="/resources/css/others/animate.css" rel="stylesheet"> -->

<style type="text/css">

body {
	position: relative;
}
.container {
	font-size: 14px;
}

.content {
	text-align: left;
	width: 720px;
	min-height: 400px;
}

.button {
	position: relative;
}

.goto-here {
	padding: 0px;
}
</style>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
		
	<div class="container">
		
		<form name="info">
			<input type="hidden" name="reportNo" value="${report.reportNo}" />

			<div class="row" style="position: relative; height: 25px;">
				<div class="col-md-8"
					style="position: absolute; left: 0px; bottom: 0px;">�Ű��� | ${ report.reporterId }</div>
							
				<div class="col-md-4" align="right"
					style="position: absolute; right: 0px; bottom: 0px;">�Ű����� | ${ report.reportCategory }</div>
			</div>
			<p />
			
			<hr />
			
			<div class="row" style="position: relative; height: 25px;">
				<div class="col-md-8"
					style="position: absolute; left: 0px; bottom: 0px;">�Ű��� | ${ report.reportedId }</div>
							
				<div class="col-md-4" align="right"
					style="position: absolute; right: 0px; bottom: 0px;">
					�Ű��Ͻ� | <fmt:formatDate value="${ report.reportDate }" pattern="yyyy�� MM�� dd��"/>
					</div>
			</div>
			<p />
					
			<hr />

			<div class="content">${report.reportContent}</div>
			<hr />
			<hr />
			<c:forEach var="name" items="${ file }">
				<img src="../resources/file/fileReport/${ name.fileName }" width="300px" height="300px" 
					style="cursor:pointer;" onclick="doImgPop('../resources/file/fileReport/${ name.fileName }')">
			</c:forEach>
			<hr />
			<hr />
		</form>

		<div class="button" align="right">
			<button>ó��</button>
			<button>���</button>
		</div>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
	</div>
	
	<script type="text/javascript">
	$(function() {

		$("button:contains('ó��')").on("click", function() {
			self.location = "/report/updateReport?reportNo="+${ report.reportNo }+"&reportStatus=1&delCode=0"
		});
		
		$("button:contains('���')").on("click", function() {
			self.location = "/report/listReport"
		});

// 		$("button:contains('����')").on(
// 				"click",
// 				function() {

// 					var result = confirm("���� ���� �Ͻðڽ��ϱ�?");

// 					if (result) {
// 						$("form[name='info']").attr("method", "POST").attr(
// 								"action", "/info/delInfo").attr("enctype",
// 								"multipart/form-data").submit();
// 					}

// 				});
	});
	
	function doImgPop(img){
		img1=new Image();
		img1.src=(img);
		imgControll(img);
	}
	
	function imgControll(img){
		if((img1.width!=0)&&(img1.height!=0)){
			viewImage(img);
		}else{
			controller="imgControll('"+img+"')";
			intervalId=setTimeout(controller, 20);
		}
	}
	
	function viewImage(img){
		W=img.width;
		H=img.height;
		O="width="+W+", height="+H+",scrollbars=yes";
		imgWin=window.open("","",O);
		imgWin.document.write("<html><head><title>:*:*:*: �̹��� �󼼺��� :*:*:*:*:*:*:</title></head>");
		imgWin.document.write("<body topmargin=0 leftmargin=0>");
		imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title='Ŭ���� â�� �����ϴ�.'>");
		
	} 
	</script>
	
		
		<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>