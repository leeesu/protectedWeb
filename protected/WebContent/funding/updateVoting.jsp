<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	    <title>보호할개 · 투표</title>
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
    <link rel="stylesheet" href="/resources/get/css/bootstrap.css" />

<!-- ckeditor 사용 CSS-->
<script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

.container {
	width: 1000px;
	font-size: 15px;
}

.form-group {
	padding-left: 170px;
	padding-right: 150px;
}

.form-group2 {
	padding-left: 450px;
	padding-right: 100px;
}

.form-form {
	padding-left: 15px;
}

.ck.ck-editor {
	max-width: 700px;
}

.ck-editor__editable {
	text-align: left;
	min-height: 300px;
	max-width: 700px;
}

    </style>
	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->
      

	</head>
	<body>
		<!--  화면구성 div Start /////////////////////////////////////-->
		<div class="container ">
	    <div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 60px;">
	      <div class="container">
	        <div class="row no-gutters slider-text align-items-center justify-content-center">
	          <div class="col-md-9 ftco-animate text-center">
	          	<p ><span class="mr-2">Support</span> <span>Apply</span></p>
	            <font size="7">후원신청수정</font><br/> 후원신청은 투표 <strong style="color: #f04f23">1개</strong>이상
					받을 시 <strong style="color: #f04f23">수정이 불가</strong>합니다.
	          </div>
	        </div>
	      </div>
	    </div>
		<br/><p/>	
		
		<!-- form Start /////////////////////////////////////-->
	  <section class="ftco-section bg-light" style="padding-bottom: 0px; padding-top : 20px;">   
		
		<form id ="uploadForm" class="form-horizontal">
		
		  <div class="form-group">
				<h5>
					<b>후원목표금액</b>
				</h5>
			
			투표개수는 ( <strong style="color:#f04f23">목표금액 X 0.001</strong> )표로 적용됩니다. ( <b>10만원 ~ 300만원</b>까지 입력가능합니다. )<p/>
		    <div class="row form-form"  >
		      <input type="text" class="form-control" value=<fmt:formatNumber>${funding.fundTargetPay }</fmt:formatNumber> id="fundTargetPay" name="fundTargetPay" placeholder="0" style="width:700px; height:35px;" >&ensp;
		    </div>
		  </div>
			<br/>
			
<!-- 			소수점 제거 -->
			<fmt:parseNumber var ="test" value="${funding.fundTargetPay*0.001}" integerOnly="true"/>
   
		  <div class="form-group" id="voteNum">
		    <h5><b>투표수 <strong style="color:#f04f23">${test}</strong>표</b></h5>
		   <div class="row form-form">
			후원게시글로 이동하려면 받아야 할 투표 수입니다.
			</div>
		  </div>
		
		
			<br/>
			<div class="form-group">
				<h5>
					<b>후원목표기간</b>
				</h5>
				<strong style="color: #f04f23">후원 받을기간</strong>을 입력하세요. ( 7일 ~ 30일까지 선택가능합니다. )<br /> 투표가 마감되었을 때 시작 날부터의
				기간입니다. 투표 기간은 <strong >30일</strong>로 고정됩니다.
				<p />
				<div>
		      <select class="form-control" name="fundTargetDay" id="fundTargetDay"  style="width:700px; height:35px;">
		       	<c:forEach var ="i" begin="7" end ="30" step="1">
		       		<c:if test="${funding.fundTargetDay eq i }">
				  	<option value="${funding.fundTargetDay}" selected >${funding.fundTargetDay}</option>
		       		</c:if>
		       		<c:if test="${!(funding.fundTargetDay eq i) }">
		       		<option value="${i}" >${i}</option>
		       		</c:if>
				 </c:forEach>
				</select>
		    </div>
		  </div>
		  <br/>
		  <div class="form-group">
				<h5>
					<b>글제목</b>
				</h5><p/>		
		    <div class=>
		      <input type="text" class="form-control" value="${funding.postTitle}" id="postTitle" name="postTitle" maxlength="12"   placeholder="제목을 입력해주세요." style="width:700px; height:35px;">		
		    </div>
		  </div>
		  <br/>
		  <div class="form-group">
				<h5>
					<b>글내용</b>
				</h5>
				<p/>	
			    <div >
			    <textarea id="postContent" name="postContent" style="text-align: left;" placeholder="내용을 입력해주세요.">
				${funding.postContent}				
				</textarea>			    
			    </div>
			  </div>
			<br/>
            <!-- 첨부 버튼 -->
			<div id="attach" class="form-group">
				<span class="label label-primary "><label
					class="waves-effect waves-teal btn-flat" for="uploadInputBox"  style="background-color: #f6957b; padding: 3px; border-radius: 3px; color: #ffffff">사진등록</label></span>&nbsp;&nbsp;맨앞
				이미지는 대표이미지입니다. (최대 <b>10장</b>까지 업로드 가능합니다.) <input id="uploadInputBox"
					style="display: none" type="file" value="등록" name="filedata" />
			</div>
           <br/>
            
            <!-- 미리보기 영역 -->
            <div class="form-group">
            <div class="row">
            <div id="preview" class="col-md-12" align="center" style='display:inline; min-width:100px;'>

				<c:forEach var="name" items="${file}" varStatus="status">            
				
				<div class="preview-box2" value="${name.fileName}"  style='display:inline;float:left;width:140px' >
                     <img class="thumbnail" src="/resources/file/fileSF/${name.fileName}"  width="130px;" height="115px;"/>
                            <span href="#" value="${name.fileName}"  onclick="deletePreview2(this)"><br/><font color="#f04f23"> 삭제</font></span></div>     
                        
                </c:forEach>           
            
            </div></div></div>
			<div class="form-group">
			<br/>
				<h5>
					<b>연락처</b>
				</h5>
				연락처가 다를 경우 회원정보를 수정해주세요.
				<input type="text" class="form-control" name="phone" value="${ user.phone }" readonly style="margin-top: 15px">
			
			</div>
		    <input type="hidden" name="postNo" value="${funding.postNo }" />		    	
		    <input type="hidden" id="multiFile" name="multiFile" />
		    <input type="hidden" id="deleteFile" name="deleteFile" />
		    <input type="hidden" id="code" name="code" value="${code}" />			    
		  <br/><br/>
	          	<div class="col-md-12" style="padding-left:170px;padding-right: 160px">
	          	
					<p><button  type="button" class="btn btn-default py-3 px-4 col-md-12" id="btn-update">수정</button></p>
					<div>
						<div class="col-md-12">
							<div  align="right">
								<p><a href="#" ><font color="gray" id="btn-cancel">뒤로</font></a></p>
							</div>
						</div>
					</div>
					
	          </div>
		  <br/><br/><br/><br/><br/><br/><br/><br/>
		
		</form>
		<!-- form Start /////////////////////////////////////-->
      </section>
    </div>
   <!--  화면구성 div end /////////////////////////////////////-->
    <!--================ start footer Area  =================-->
    <!-- footer Start /////////////////////////////////////-->
	 <jsp:include page="/layout/footer.jsp"></jsp:include>
   	<!-- footer End /////////////////////////////////////-->  
    <!--================ End footer Area  =================-->

    <!--  ///////////////////////// JavaScript ////////////////////////// -->    
   <script type="text/javascript" >

   //============= 수정버튼 눌렀을때 함수 =============      
   function fncUpdateVoting(){
      
      //Form 유효성 검증
      var fundTargetPay = $('input[name="fundTargetPay"]').val();
      var postTitle = $('input[name="postTitle"]').val();
      var postContent =  CKEDITOR.instances.postContent.getData(); 
 
      
      if(fundTargetPay == null || fundTargetPay.length<1){
		  swal({
	           text: "후원목표금액을 입력해주세요.",
	           dangerMode: true,
	           buttons: {
						 catch: {
						 	text: "확인"
						 }
			   },			   
	      }).then((willDelete) => {
	           if (willDelete) {
	               $('input[name="fundTargetPay"]').focus();
	           }
	      });

         return;
      }
      if(fundTargetPay < 100000 || fundTargetPay > 3000000){
		  swal({
	           text: "후원목표금액을 10만원이상 300만원이하로 입력해주세요.",
	           dangerMode: true,
	           buttons: {
						 catch: {
						 	text: "확인"
						 }
			   },			   
	      }).then((willDelete) => {
	           if (willDelete) {
	               $('input[name="fundTargetPay"]').focus();
	           }
	      });

         return;
      }
      if(postTitle == null || postTitle.length<1){
		  swal({
	           text: "글 제목을 입력해주세요.",
	           dangerMode: true,
	           buttons: {
						 catch: {
						 	text: "확인"
						 }
			   },			   
	      }).then((willDelete) => {
	           if (willDelete) {
	               $('input[name="postTitle"]').focus();
	           }
	      });    	  

         return;
      }
      if(postContent == ''){
		  swal({
	           text: "글 내용을 입력해주세요.",
	           dangerMode: true,
	           buttons: {
						 catch: {
						 	text: "확인"
						 }
			   },			   
	      }).then((willDelete) => {
	           if (willDelete) {
	  	         $(".ck-editor__editable").focus();
	           }
	      });      	  
	         return;
	      }
 
      
      var value = "";   
      $('input[name="fundTargetPay"]').val(removeCommas($('input[name="fundTargetPay"]').val()));
      
      swal({
          title: "수정하시겠습니까?",
          icon: "warning",
          buttons: ["취소", "확인"],
          dangerMode: true,
        })
        .then((willDelete) => {
          if (willDelete) {   
              swal("수정이 완료되었습니다!", {
	                icon: "success",
	                button : "확인"
	              }).then((value) => {
      //============= 다중파일업로드 AJAX =============
          $(function() {     
            var form = $('#uploadForm')[0];
            var formData = new FormData(form);

            for (var index = 0; index < 100; index++) {
                formData.append('files',files[index]);
            }
                
                $.ajax({
                type : 'POST',
                enctype : 'multipart/form-data',
                processData : false,
                contentType : false,
                cache : false,
                timeout : 600000,
                url : '/Images/json/imageupload/SF',
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

      

      $('form').attr("method","POST").attr("action","/funding/updateVoting").attr("enctype","multipart/form-data").submit();
	              });
             }
          
        });
   }
 
 //============= "Editor" =============   
   CKEDITOR.addCss('figure[class*=easyimage-gradient]::before { content: ""; position: absolute; top: 0; bottom: 0; left: 0; right: 0; }' +
            'figure[class*=easyimage-gradient] figcaption { position: relative; z-index: 2; }' +
            '.easyimage-gradient-1::before { background-image: linear-gradient( 135deg, rgba( 115, 110, 254, 0 ) 0%, rgba( 66, 174, 234, .72 ) 100% ); }' +
            '.easyimage-gradient-2::before { background-image: linear-gradient( 135deg, rgba( 115, 110, 254, 0 ) 0%, rgba( 228, 66, 234, .72 ) 100% ); }');

          CKEDITOR.replace('postContent', {
             language: 'ko',
            extraPlugins: 'autogrow',
            autoGrow_minHeight: 200,
            autoGrow_maxHeight: 600,
            autoGrow_bottomSpace: 50,
            removePlugins: 'resize',
            
            extraPlugins: 'easyimage',
            removePlugins: 'image',
            removeDialogTabs: 'link:advanced',
            toolbar: [{
                name: 'document',
                items: ['Undo', 'Redo']
              },
              {
                name: 'styles',
                items: ['Format']
              },
              {
                name: 'basicstyles',
                items: ['Bold', 'Italic', 'Strike', '-', 'RemoveFormat']
              },
              {
                name: 'paragraph',
                items: ['NumberedList', 'BulletedList']
              },
              {
                name: 'links',
                items: ['Link', 'Unlink']
              },
              {
                name: 'insert',
                items: ['EasyImageUpload']
              },
              {
                 name : 'max',
                 items:['Maximize', 'ShowBlocks']
              },
              {
                 name : 'fontSize',
                 items:['Styles','Format','Font','FontSize']
              },
              {
                 name : 'sourceView',
                 items:['Source','-','Save','NewPage','Preview','-','Templates']
             },
              {
                 name : 'align',
                 items:['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock']
             },
            ],
            height: 630,
            cloudServices_uploadUrl: 'https://33333.cke-cs.com/easyimage/upload/',
            // Note: this is a token endpoint to be used for CKEditor 4 samples only. Images uploaded using this token may be deleted automatically at any moment.
            // To create your own token URL please visit https://ckeditor.com/ckeditor-cloud-services/.
            cloudServices_tokenUrl: 'https://33333.cke-cs.com/token/dev/ijrDsqFix838Gh3wGO3F77FSW94BwcLXprJ4APSp3XQ26xsUHTi0jcb1hoBt',
            easyimage_styles: {
              gradient1: {
                group: 'easyimage-gradients',
                attributes: {
                  'class': 'easyimage-gradient-1'
                },
                label: 'Blue Gradient',
                icon: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/gradient1.png',
                iconHiDpi: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/hidpi/gradient1.png'
              },
              gradient2: {
                group: 'easyimage-gradients',
                attributes: {
                  'class': 'easyimage-gradient-2'
                },
                label: 'Pink Gradient',
                icon: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/gradient2.png',
                iconHiDpi: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/hidpi/gradient2.png'
              },
              noGradient: {
                group: 'easyimage-gradients',
                attributes: {
                  'class': 'easyimage-no-gradient'
                },
                label: 'No Gradient',
                icon: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/nogradient.png',
                iconHiDpi: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/hidpi/nogradient.png'
              }
            },
            easyimage_toolbar: [
              'EasyImageFull',
              'EasyImageSide',
              'EasyImageGradient1',
              'EasyImageGradient2',
              'EasyImageNoGradient',
              'EasyImageAlt'
            ]
          });
  
     
   //============= "다중파일업로드 파일명만 저장해서 insert할 value" =============   
   function fnAddFile(fileNameArray) {
         $("#multiFile").val(fileNameArray)    
   }   

   //============= "다중파일업로드 파일명만 저장해서 delete할 value" =============   
   function fnDeleteFile(deletefileNameArray) {
         $("#deleteFile").val(deletefileNameArray)    
   }   
   
   
   //============= "다중파일업로드"  Event 처리 및  연결 =============      

       //임의의 file object영역
     var files = {};
     var previewIndex = 0;
     var fileNameArray = new Array();
     //원래있던사진 삭제할 array
     var deletefileNameArray = new Array();
     
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
                var fileNameExtension = fileName.toLowerCase().substring(fileNameExtensionIndex, fileName.length);       
                
                //append할때 동영상 이미지 구분해주기
               var imgSelectName = "img";
               if(fileNameExtension === 'mp4' || fileNameExtension === 'avi'){
                  imgSelectName = "iframe";
               }                           

                 var reader = new FileReader();
                 reader.onload = function(img) {
                     //div id="preview" 내에 동적코드추가.
                     //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                     
                     var imgNum = previewIndex++;
                     
                    //10장 이상 업로드시
                     if(Object.keys(files).length>=10){
           			  swal({
       		           text: "사진은 10장까지만 업로드 가능합니다",
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
                    	 
                    	 
//                         alert("사진은 10장까지만 업로드 가능합니다.");
//                         delete files[imgNum];
                     }else{
               // 10장 이하 
                     $("#preview").append(
	                             "<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px' >"
	                             + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"130px;\" height=\"115px;\"/>"
	                             + "<span href=\"#\" value=\""
	                             + imgNum
	                             + "\" onclick=\"deletePreview(this)\">"
	                             + "   <br/><font color=\"#f04f23\"> 삭제</font>" + "</span>" + "</div>");

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
         fileNameArray.splice(imgNum,1);
         fnAddFile(fileNameArray);
         $("#preview .preview-box[value=" + imgNum + "]").remove();
         resizeHeight();
     }
     //=============원래있던사진들 삭제버튼누를때 =============
     function deletePreview2(obj) {
         var imgName = obj.attributes['value'].value;
         deletefileNameArray.push(imgName);
         fnDeleteFile(deletefileNameArray);
         $("#preview .preview-box2[value=\"" + imgName + "\"]").remove();
         resizeHeight();
     }

     //============= 파일 확장자 validation 체크 =============
     function validation(fileName) {
         fileName = fileName + "";
         var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
         var fileNameExtension = fileName.toLowerCase().substring(
                 fileNameExtensionIndex, fileName.length);
         if (!((fileNameExtension === 'jpg')|| (fileNameExtension === 'gif') || (fileNameExtension === 'png')||(fileNameExtension === 'avi')||(fileNameExtension === 'mp4'))) {
			  swal({
		           text: "jpg, gif, png, avi, mp4 확장자만 업로드 가능합니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },			   
		      }); 
             return true;
         } else {
             return false;
         }
     }
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

          //============= 후원목표금액 =============
          $('#fundTargetPay').keyup(function(){
         	 
         	 //입력시 콤마 적용
         	 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));        	 
         	 //투표수 계산
              var inputed = Math.round(removeCommas($(this).val())*0.0001);         
              $("#voteNum").children().remove();
              $("#voteNum").append("<h5><b>투표수 <strong  style=\"color:#f04f23\">"+inputed+"</strong>표</b></h5><div class=\"row form-form\">"+
          							"후원게시글로 이동하려면 받아야 할 투표 수입니다.</div>");
              //후원목표금액 길이초과
              if (removeCommas($(this).val()).length > 7 ) {
    			  swal({
   		           text: "300만원이하로 입력해주세요.",
   		           dangerMode: true,
   		           buttons: {
   							 catch: {
   							 	text: "확인"
   							 }
				   },			   
    		      }).then((willDelete) => {
    		           if (willDelete) {

          	  
                  $(this).val(removeCommas($(this).val()).substr(0, 7));
                  
                  $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));  
                  var inputed = Math.round(removeCommas($(this).val())*0.0001);         
                  $("#voteNum").children().remove();
                  $("#voteNum").append("<h5><b>투표수 <strong  style=\"color:#f04f23\">"+inputed+"</strong>표</b></h5><div class=\"row form-form\">"+
   										"후원게시글로 이동하려면 받아야 할 투표 수입니다.</div>");
    		           }
    		      });
              }
          });
          
          //============= 글제목 길이 입력 검증 =============
          $('#postTitle').keyup(function(){

              if($(this).val().length > 12) {     
    			  swal({
       		           text: "제한길이를 초과하였습니다.",
       		           dangerMode: true,
       		           buttons: {
       							 catch: {
       							 	text: "확인"
       							 }
       				   },			   
       		      }).then((willDelete) => {
       		           if (willDelete) {
                           $(this).val($(this).val().substr(0,12));
       		           }
       		      });
              }

     });

             
     }); 
   
   $(function() {
      
         //============= 수정 Event  처리 =============   
         $( "#btn-update" ).on("click" , function() {
        	 fncUpdateVoting();
            });
         
         //============= 취소 Event  처리 =============
          $( "#btn-cancel" ).on("click" , function() {
               history.go(-1);
            });
            
   });   
               
   
   </script>
   
      
</body>

</html>