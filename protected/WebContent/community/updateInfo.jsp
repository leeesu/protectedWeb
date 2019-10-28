<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>보호할개 · 정보공유</title>

<!-- jqeury CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ckEditor CDN -->
<script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script>

<!--  CSS -->
<style>
#preview img {width: 100px;height: 100px;}
#preview p {text-overflow: ellipsis;overflow: hidden;}

.preview-box {padding: 5px;border-radius: 2px;margin-bottom: 10px;}
.ck.ck-editor {min-width: 95%;}
.ck-editor__editable {text-align: left;min-height: 300px;min-width: 95%;}

label {background-color: #3e6dad;color: white;border-radius: 10px;}
</style>

<jsp:include page="/layout/toolbar.jsp"></jsp:include>
</head>

<body>
	
	<div class="hero-wrap hero-bread" style="padding-bottom: 60px; padding-top : 60px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2">Information</span> <span>Share</span>
					</p>
					<font size="7">정보공유글 수정</font>
				</div>
			</div>
		</div>
	</div>
	
	<br/>
	
	<div class="container">

		<div style="border: 2px solid #d7dade; padding: 3px;">

			<form class="form-horizontal" name="detailForm">

				<input type="hidden" name="postNo" value="${board.postNo}">
				<div class="row">
					<div class="col-xs-12 col-md-12">
						<input type="text" class="form-control" name="postTitle"
							id="postTitle" style="height: 50px; font-size: 20px"
							value="${board.postTitle}"  maxlength="30"/>
					</div>
				</div>

				<br/>

				<div id="ckEditor" align="center">

					<div id="toolbar-container" align="center"
						class="col-xs-12 col-md-12"></div>
					<textarea class="col-xs-12 col-md-12" id="editor1"
						name="postContent" style="text-align: left;">
						${board.postContent}
					</textarea>
				</div>
				
				<c:if test="${ board.route != null }">
					            	<div class="col-md-12">
	            	<br/>
                		<strong>
	                		수정하실 경우 지도를 우클릭하고 마커를 다시 생성해주세요.
                		</strong>
               		</div>
               		
               		
               		
		            <div class="col-md-12">
		              	<div class="form-group">
		                	<div id="mapArea" style="width: wrap; height: 300px;"></div><br/>
		                  	<input type="hidden" class="form-control" id="route" name="route"  value="${ board.route }">
		               	</div>
	               </div>
	               </c:if>
			</form>
		</div>

		<hr />
		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-default">수정</button>
				<button id="reset" class="btn btn-default" role="button">취소</button>
			</div>
		</div>

		<div class="row" style="height: 100px"></div>

	</div>
	
			<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!--  JavaScript  -->
	<script type="text/javascript">
	function fncUpdateBoard(){
		
		var postContent = $("#editor").text();
		$("form[name=detailForm]").attr("method","POST").attr("action","/info/updateInfo").attr("enctype","multipart/form-data").submit();
		
	}

	$(function () {
		
		$("#reset").on("click", function(){
			history.go(-1);
		});
		
		$("button:contains('수정')").on("click", function(){
			fncUpdateBoard();
		});

	});
	
	 //  ================================ CKEditor ============================================== 
	let editor;

	CKEDITOR.addCss('figure[class*=easyimage-gradient]::before { content: ""; position: absolute; top: 0; bottom: 0; left: 0; right: 0; }' +
		      'figure[class*=easyimage-gradient] figcaption { position: relative; z-index: 2; }' +
		      '.easyimage-gradient-1::before { background-image: linear-gradient( 135deg, rgba( 115, 110, 254, 0 ) 0%, rgba( 66, 174, 234, .72 ) 100% ); }' +
		      '.easyimage-gradient-2::before { background-image: linear-gradient( 135deg, rgba( 115, 110, 254, 0 ) 0%, rgba( 228, 66, 234, .72 ) 100% ); }');

		    CKEDITOR.replace('editor1', {
		    	language: 'ko',
		    	
		    	extraPlugins: 'video',
		    	
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

	// =============================== 구글 지도 ============================================
		
          
          var poly;
         var map;
         var marker;
         var markers = [];
         var route = $('#route').val();
         var routeTest = [];
         var routeMark = [];
          var infowindowF;
          var infowindowL;
         
         
//          if (route == ''){
//         	 return false;
//          }
         
       	//마커가 하나라도 있을때
         if (route.indexOf("#") != -1){
               var routeArray = route.split("#");
               
               for ( i=0; i<routeArray.length-1; i++){
                	routeTest[i] = routeArray[i].substring( routeArray[i].indexOf("(")+1, routeArray[i].indexOf(",") )+","+ (routeArray[i].substring( routeArray[i].indexOf(",")+1, routeArray[i].indexOf(")") )).trim() ;
                	routeMark[i] = "marker"+i.toString();
               }        
         }

         function initMap() {
              map = new google.maps.Map(document.getElementById('mapArea'), {
                 zoom: 16,
                 center: { lat: parseFloat(routeTest[0].substring( 0, routeTest[0].indexOf(",") )   ) ,
                      lng: parseFloat(routeTest[0].substring( routeTest[0].indexOf(",")+1, routeTest[0].length )) }
            });
   
              poly = new google.maps.Polyline({
                 strokeColor: '#000000',
                 strokeOpacity: 0.5,
                 strokeWeight: 5,
                 map: map
              });
              
              var aaa = "";
              
              for ( i=0; i<routeTest.length; i++){
                
                 var path = poly.getPath();
   
                  path.push(new google.maps.LatLng(    parseFloat(routeTest[i].substring( 0, routeTest[i].indexOf(",") )),
                                          parseFloat(routeTest[i].substring( routeTest[i].indexOf(",")+1, routeTest[i].length ))));

                marker= routeMark[i];
            
                marker = new google.maps.Marker({
                    position: {lat: parseFloat(routeTest[i].substring( 0, routeTest[i].indexOf(",") )), 
                     lng: parseFloat(routeTest[i].substring( routeTest[i].indexOf(",")+1, routeTest[i].length )) },
                   title: '#' + path.getLength(),
                   map: map
                });
                
                markers.push(marker);
                
             }
   
              infowindowF = new google.maps.InfoWindow();
              infowindowL = new google.maps.InfoWindow();
              infowindowF.setContent("출발");
               infowindowF.open(map, markers[0]);
               infowindowL.setContent("도착");
               infowindowL.open(map, markers[markers.length-1]);
   
              map.addListener('click', addLatLng);
              map.addListener('rightclick', function() {
                 for (var i = markers.length-1; i >=0; i--) {
                    markers[i].setMap(null);
                    markers.splice(i, 1 );
                    poly.getPath().removeAt(i);
                    $( "#route ").val( '' );
                  }
                 });
         }

        
         function addLatLng(event) {
            
              if (markers.length <5){
                  
                 var path = poly.getPath();
                  path.push(event.latLng);
                  
                   var marker = new google.maps.Marker({
                    position: event.latLng,
                    title: '#' + path.getLength(),
                    map: map
                   });
                   
                   markers.push(marker);
                 
                 $( "#route ").val(  $( "#route ").val()+ event.latLng.toString()+"#"  );
                 
                 // pop up
                 infowindowF.setContent("출발");
                  infowindowF.open(map, markers[0]);
                  
                  if(markers.length > 1){
                    infowindowL.setContent("도착");
                     infowindowL.open(map, marker);
                  }
                  
              }else{
                 alert("5개까지 지정 가능함 dialog 추가");
             }
              
              
              if (marker != undefined){
                 
                  marker.addListener('rightclick', function() {
                     
                  for (var i = 0; i < markers.length; i++) {
                      if (markers[i] === marker) {
                        markers[i].setMap(null);
                        markers.splice(i, 1);
            
                        poly.getPath().removeAt(i);
                      }
                  }
                  
                  var test = "";
                  
                   for (var i = 0; i < markers.length; i++) {
                      test += markers[i].position+"#";
                      
                      //pop up
                       infowindowF.setContent("출발");
                        infowindowF.open(map, markers[0]);
                        
                        infowindowL.setContent("도착");
                        infowindowL.open(map, markers[markers.length-1]);
                   }
                   
                   $( "#route ").val(  test  );
                   
                  });
              }
              
         }
  	        
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	        
	  	      	

	     
	 $(document).ready(function() {

         //============= 사진미리보기 =============
         $('#attach input[type=file]').change(function() {
            addPreview($(this)); //preview form 추가하기
        });
	 });
         
	function fncUpdateInfo(){
	         
	      //============= 다중파일업로드 AJAX =============
	    	  
	    	  var title = $("#postTitle").val();
	      
	      	  if(title.length < 1 || title == null ){
	      		  alert("제목을 입력해 주세요");
	      	  }
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
	                url : '/Images/json/imageupload/IS',
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


	      $('form').attr("method","POST").attr("action","/info/updateInfo").attr("enctype","multipart/form-data").submit();
	   }
	   
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
	                     
	                     var previewId = "";             
	                     if(imgNum==0){
	                        previewId = "start";
	                     }else{
	                        previewId = "startNo";   
	                     }
	                    //8장 이상 업로드시
	                     if(Object.keys(files).length>=8){
	                        alert("사진은 8장까지만 업로드 가능합니다.");
	                        delete files[imgNum];
	                     }else{
	               // 8장 이하 
	               
	               			document.querySelector( '#editor' ).addEventListener( 'click', () => {
                	    const editorData = editor.getData();     	           
                		} );
	               
	               		 editor.setData(editor.getData()+"<p><"+imgSelectName+" src='" + img.target.result + "' style='min-width:100%'/></p><p/>");
	          
	                     $("#preview").append(
	                                     "<div class=\"preview-box\"  id="+previewId+"  value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px' >"
	                                             + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"120px;\" height=\"120px;\"/>"
	                                             + "<a href=\"#\" value=\""
	                                             + imgNum
	                                             + "\" onclick=\"deletePreview(this)\">"
	                                             + "   삭제" + "</a>" + "</div>");

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

	     //============= 파일 확장자 validation 체크 =============
	     function validation(fileName) {
	         fileName = fileName + "";
	         var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	         var fileNameExtension = fileName.toLowerCase().substring(
	                 fileNameExtensionIndex, fileName.length);
	         if (!((fileNameExtension === 'jpg')|| (fileNameExtension === 'gif') || (fileNameExtension === 'png')||(fileNameExtension === 'avi')||(fileNameExtension === 'mp4'))) {
	             alert('jpg, gif, png, avi, mp4 확장자만 업로드 가능합니다.');
	             return true;
	         } else {
	             return false;
	         }
	     }
</script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap" async defer></script>
  

</body>
</html>