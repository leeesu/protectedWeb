<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<title>보호할개 · 스토어</title>
<meta charset="UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" href="/resources/newTemplate/admin/css/loadingAnimation.css">
    
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" > -->
<!-- <<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >  -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> 


<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
.container {
	width: 1000px;
/* 	font-size: 17px; */
	margin-top: 10px;
}

/* .form-group7{margin-top:10px;} */
</style>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
</head>

<body>
	<!--//////////////////////////// Sub Toolbar Start/////////////////////////////-->
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
					<font size="7">스토어 상품등록</font>
				</div>
			</div>
		</div>
	</div>
	<br />
	<p />
	<!--//////////////////////////// Sub Toolbar end/////////////////////////////-->

	<!-- ///////////////////////////body navigation tag/////////////////////////// -->
	<section class="ftco-section">
		<div class="container">
			<form class="billing-form" name="addForm">
				<div class="row justify-content-center">
					<div class="col-xl-8 ftco-animate">

						<!-- ///////////////////////////body navigation tag/////////////////////////// -->

						<!--////////////////////////// form tag Start /////////////////////////////////-->

						<div class="w-100"></div>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<h5><b>상품명</b></h5><input type="text"
										class="form-control" name="prodName" id="prodName"
										placeholder="상품명을 입력해주세요">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<h5><b>상품코드</b></h5>
									
								<select class="form-control" name="prodCode"
									id="prodCode" style="width: 300px; height: 35px;">
										<option value="10">사료</option>
										<option value="20">간식</option>
										<option value="30">의류</option>
								</select>									

								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<h5><b>가 격</b></h5><input type="text"
										class="form-control" name="price" id="price"
										placeholder="가격을 입력해주세요">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<h5><b>원산지</b></h5> <input type="text"
										class="form-control" name="country" id="country"
										placeholder="원산지를 입력해주세요">
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<h5><b>제조사</b></h5><input type="text"
										class="form-control" name="company" id="company"
										placeholder="제조사를 입력해주세요">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<h5><strong id="manuDateH5">제조일</strong></h5> <input type="text"
										class="form-control" name="manuDate" id="manuDate"
										placeholder="제조일자를 입력해주세요" readonly>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<h5><b>할인액</b></h5><input type="text"
										class="form-control" name="discountPrice" id="discountPrice"
										placeholder="상품의 할인가를 입력해주세요">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<h5><b>재고수량</b></h5> <input type="text"
										class="form-control" name="quantity" id="quantity"
										placeholder="상품의 입고수량을 입력해주세요">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="w-100"></div>


				<!-- 첨부 버튼 -->
			<div id="attach" class="form-group" style="width: 700px">
				<span class="label label-primary "><label
					class="waves-effect waves-teal btn-flat" for="uploadInputBox"  style="background-color: #f6957b;margin-left:14px; padding: 3px; border-radius: 3px; color: #ffffff">사진등록</label></span>&nbsp;&nbsp;맨 앞
				이미지는 대표이미지입니다. (최대 <b>5장</b>까지 등록 가능합니다.) <input id="uploadInputBox"
					style="display: none" type="file" value="등록" name="filedata" />
			</div>
           <br/>


	            <!-- 미리보기 영역 -->
			<div class="form-group">
			<div class="row">
				<div id="preview" class="col-md-12" align="center"
					style='display: inline; min-width: 100px;'></div>
			</div></div>

							<input type="hidden" class="form-control" id="multiFile"
								name="multiFile"> <br />
							<br />
							<div class="w-100"></div>

							<div class="col-md-12">
								<div class="form-group">
									<h5><b>상세정보</b></h5> 
									<input type="text"
										class="form-control" name="prodDetail" id="prodDetail"
										placeholder="상품의 상세정보를 입력해주세요">
								</div>
							</div>
						</div><br/>
		              <div class="col-md-12" style="padding-left: 0;padding-right: 0;">
	
							<button  type="button" class="btn btn-default py-3 px-6 col-md-12" id="addproduct">등록</button>
							<div  align="right" style="margin-top:10px">
								<p><a href="#" ><font color="gray" id="btn-cancel">취소</font></a></p>
							</div>
				</div>
						<!-- ////////////////////////////form tag end //////////////////////////////-->
					</div>
				</div>
			</form>
		</div>

	</section>

	<!--================ start footer Area  =================-->
	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!-- footer End /////////////////////////////////////-->


<!-- 	<script src="../../resources/prodmenu/js/popper.min.js"></script> -->
<!-- 	<script src="../../resources/prodmenu/js/bootstrap.min.js"></script> -->
<!-- 	<script src="../../resources/prodmenu/js/jquery.easing.1.3.js"></script> -->
<!-- 	<script src="../../resources/prodmenu/js/jquery.waypoints.min.js"></script> -->
<!-- 	<script src="../../resources/prodmenu/js/jquery.stellar.min.js"></script> -->
<!-- 	<script src="../../resources/prodmenu/js/owl.carousel.min.js"></script> -->
<!-- 	<script src="../../resources/prodmenu/js/jquery.magnific-popup.min.js"></script> -->
<!-- 	<script src="../../resources/prodmenu/js/aos.js"></script> -->
<!-- 	<script src="../../resources/prodmenu/js/jquery.animateNumber.min.js"></script> -->
	<!-- 	<script src="./../resources/prodmenu/js/bootstrap-datepicker.js"></script> -->
<!-- 	<script src="../../resources/prodmenu/js/scrollax.min.js"></script> -->
<!-- 	<script src="../../resources/prodmenu/js/main.js"></script> -->
	<!-- ////////////////////달력 /////////////////////////////-->
  
<!--   <script src="./jquery-ui-1.12.1/datepicker-ko.js"></script> -->
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!--   <script type="text/javascript" src="/resources/events.js"></script> -->
<!--   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
 
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//============= "등록"  Event 연결 =============
	$(function() {
		//============= "취소"  Event 처리 및  연결 =============
		$('#btn-cancel').on("click", function(){
			history.go(-1);
		});
		$("#addproduct").on("click",function(){
			fncAddProduct();
		});
					
	});

		function fncAddProduct() {
			//Form 유효성 검증

					var prodName=$("input[name='prodName']").val();
				 	//var name = document.detailForm.prodName.value;
				 	var prodDetail=$("input[name='prodDetail']").val();
					//var detail = document.detailForm.prodDetail.value;
					var manuDate=$("input[name='manuDate']").val();
					//var manuDate = document.detailForm.manuDate.value;
					var price=$("input[name='price']").val();
					//var price = document.detailForm.price.value;

					if(prodName == null || prodName.length<1){
						swal({
					           text: "상품명을 입력해주세요.",
					           dangerMode: true,
					           buttons: {
										 catch: {
										 	text: "확인"
										 }
							   },
					     }).then((willDelete) => {
					           if (willDelete) {
					        	   $("input[name='prodName']").focus();
						           }
						      });
						return;
					}

					if(manuDate == null || manuDate.length<1){
						swal({
					           text: "제조일자를 입력해주세요.",
					           dangerMode: true,
					           buttons: {
										 catch: {
										 	text: "확인"
										 }
							   },
					     }).then((willDelete) => {
					           if (willDelete) {
					        	   $("input[name='manuDate']").focus();
						           }
						      }); 
						return;
					}
			 		if(price == null || price.length<1){
						swal({
					           text: "판매가격을 입력해주세요.",
					           dangerMode: true,
					           buttons: {
										 catch: {
										 	text: "확인"
										 }
							   },
					     }).then((willDelete) => {
					           if (willDelete) {
					        	   $("input[name='price']").focus();
						           }
						      }); 
			 			return;
			 		}
					


						//============= 다중파일업로드 AJAX =============
						$(function() {
							var form = $('#uploadForm')[0];
							var formData = new FormData(form);

							for (var index = 0; index < 100; index++) {
								formData.append('files', files[index]);
							}

							$
									.ajax({
										type : 'POST',
										enctype : 'multipart/form-data',
										processData : false,
										contentType : false,
										cache : false,
										timeout : 600000,
										url : '/Images/json/imageupload/Shop',
										dataType : 'JSON',
										data : formData,
										success : function(result) {
											if (result === -1) {
												alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
												// 이후 동작 ...
											} else if (result === -2) {
												alert('파일이 10MB를 초과하였습니다.');
												// 이후 동작 ...
											} else {
												alert('이미지 업로드 성공');
											}
										}
									});
						});
			
				 	      $('input[name="price"]').val(removeCommas($('input[name="price"]').val()));
						  $('input[name="discountPrice"]').val(removeCommas($('input[name="discountPrice"]').val()));

						//Debug..
						//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
						$("form[name='addForm']").attr("method", "POST")
								.attr("action", "/product/addProduct")
								.attr("enctype", "multipart/form-data")
								.submit();
// 			$("form[name='addForm']").attr("method", "POST").attr("action","/product/addProduct").submit;
		}

	//============= 달력  =============
// 	$(function() {
// 		$("input[name='manuDate']").datepicker({
// 			dateFormat : 'yy-mm-dd'
// 		});
// 	});

		//============= "다중파일업로드 파일명만 저장해서 value" =============   
		function fnAddFile(fileNameArray) {
			$("#multiFile").val(fileNameArray)
		}

		//============= "다중파일업로드"  Event 처리 및  연결 =============      

		//임의의 file object영역
		var files = {};
		var previewIndex = 0;
		var fileNameArray = new Array();
		// image preview 기능 구현
		// input = file object[]
		function addPreview(input) {
			if (input[0].files) {
				//파일 선택이 여러개였을 시의 대응
				for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {

					var file = input[0].files[fileIndex];

					if (validation(file.name))
						continue;

					var fileName = file.name + "";
					var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
					var fileNameExtension = fileName.toLowerCase().substring(
							fileNameExtensionIndex, fileName.length);

					//append할때 동영상 이미지 구분해주기
					var imgSelectName = "img";
					if (fileNameExtension === 'mp4'
							|| fileNameExtension === 'avi') {
						imgSelectName = "iframe";
					}

					var reader = new FileReader();
					reader.onload = function(img) {
						//div id="preview" 내에 동적코드추가.
						//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.

						var imgNum = previewIndex++;

	                    //8장 이상 업로드시
	                     if(Object.keys(files).length>=5){
	              			  swal({
	              		           text: "사진은 5장까지만 등록 가능합니다",
	              		           dangerMode: true,
	              		           buttons: {
	              							 catch: {
	              							 	text: "확인"
	              							 }
	              				   },			   
	              		      }).then((willDelete) => {
	              		           if (willDelete) {
	              	                   delete files[imgNum];
	              		           }
	              		      });	                    	 
	                     }else{
	               // 8장 이하 
                    $("#preview").append(
                                    "<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px;padding-top:7px' >"
                                            + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"130px;\" height=\"115px;\"/>"
                                            + "<span href=\"#\" value=\""
                                            + imgNum
                                            + "\" onclick=\"deletePreview(this)\">"
                                            + "   <font color=\"#f04f23\"> 삭제</font>" + "</span>" + "</div>");

	                     files[imgNum] = file;
	                     fileNameArray[imgNum]=file.name;
	                     fnAddFile(fileNameArray);
	                     }

	                 };

	                 reader.readAsDataURL(file);
	             }
			} else
				alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
		}

		//============= preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제 =============
		function deletePreview(obj) {
			var imgNum = obj.attributes['value'].value;
			delete files[imgNum];
			fileNameArray.splice(imgNum, 1);
			fnAddFile(fileNameArray);
			$("#preview .preview-box[value=" + imgNum + "]").remove();
			//resizeHeight();
		}

		//============= 파일 확장자 validation 체크 =============
		function validation(fileName) {
			fileName = fileName + "";
			var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
			var fileNameExtension = fileName.toLowerCase().substring(
					fileNameExtensionIndex, fileName.length);
			if (!((fileNameExtension === 'jpg')
					|| (fileNameExtension === 'gif')
					|| (fileNameExtension === 'png')
					|| (fileNameExtension === 'avi') || (fileNameExtension === 'mp4'))) {
				alert('jpg, gif, png, avi, mp4 확장자만 업로드 가능합니다.');
				return true;
			} else {
				return false;
			}
		}

		
		$( "input[name=manuDate]" ).datepicker({
			showOn: "button",
			buttonImage: "/resources/file/others/calendar.png",
			buttonImageOnly: true,
			buttonText: "Select date",
			dateFormat: "yy-mm-dd",
			maxDate: "+0d",
			prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
		});
		$('.ui-datepicker-trigger').attr('title','클릭')
		$('#manuDateH5').after( $( ".ui-datepicker-trigger" ));
		
		
		   //3자리 단위마다 콤마 생성
	    function addCommas(x) {
	        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    }
	     
	    //모든 콤마 제거
	    function removeCommas(x) {
	        if(!x || x.length == 0) return "";
	        else return x.split(",").join("");
	    }	 
	    
	    $(document).ready(function() {


				//============= 사진미리보기 =============
				$('#attach input[type=file]').change(function() {
					addPreview($(this)); //preview form 추가하기
				});

	        //============= 판매가격 =============
	        $('#price').keyup(function(){
	       	 //입력시 콤마 적용
	       	 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));        	 

	            //판매가격 길이초과
	            if (removeCommas($(this).val()).length > 7) {
	  			  swal({
	 		           text: "제한금액(100만원)을 초과하였습니다.",
	 		           dangerMode: true,
	 		           buttons: {
	 							 catch: {
	 							 	text: "확인"
	 							 }
					   },			   
	  		      }).then((willDelete) => {
	  		           if (willDelete) {
	   
	                $(this).val('1000000');
//	                 $(this).val(removeCommas($(this).val()).substr(0, 7));
	                $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));                  
	                console.log($(this).val());	  
	 
	  		           }
	  		      });
	            }
	        });
  
	        //============= 할인액 =============
	        $('#discountPrice').keyup(function(){
	       	 //입력시 콤마 적용
	       	 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));        	 

	            //판매가격 길이초과
	            if (removeCommas($(this).val()).length > 7) {
	  			  swal({
	 		           text: "제한금액(100만원)을 초과하였습니다.",
	 		           dangerMode: true,
	 		           buttons: {
	 							 catch: {
	 							 	text: "확인"
	 							 }
					   },			   
	  		      }).then((willDelete) => {
	  		           if (willDelete) {
	   
	                $(this).val('1000000');
//	                 $(this).val(removeCommas($(this).val()).substr(0, 7));
	                $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));                  
	                console.log($(this).val());	  
	 
	  		           }
	  		      });
	            }
	        });        

	});		
		
	</script>

</body>
</html>