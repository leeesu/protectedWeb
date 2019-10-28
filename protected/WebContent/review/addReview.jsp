<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

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
<link href="../resources/css/others/animate.css" rel="stylesheet">
<script
	src="https://cdn.ckeditor.com/ckeditor5/12.3.0/classic/ckeditor.js"></script>

<!--  CSS -->
<style>
@font-face {
	font-family: ng;
	src: url(NanumGothic.eot);
	src: local(��), url(NanumGothic.woff) format(��woff��);
}

body {
	font-family: '�������', 'NanumGothic', ng;
}

#editor {
	min-height: 600px;
	max-width: 1130px;
	margin-left: 15px;
	text-align: left;
}

#preview img {
	width: 100px;
	height: 100px;
}

#preview p {
	text-overflow: ellipsis;
	overflow: hidden;
}

.preview-box {
	padding: 5px;
	border-radius: 2px;
	margin-bottom: 10px;
}

.ck.ck-editor {
	min-width: 95%;
}

.ck-editor__editable {
	text-align: left;
	min-height: 300px;
	min-width: 95%;
}

label {
	background-color: #3e6dad;
	color: white;
	border-radius: 10px;
}
</style>

<!--  JavaScript  -->
<script type="text/javascript">
function fncAddProduct(){
	
	var postContent = $("#editor").text();
	$("form[name=detailForm]").attr("method","POST").attr("action","/info/addInformation").attr("enctype","multipart/form-data").submit();
	
}

$(function () {
	
	$("#reset").on("click", function(){
		$("form")[0].reset();
	});
	
	$("button.btn.btn-primary").on("click", function(){
		fncAddProduct();
	});
	
	
	
});

	</script>

</head>

<body>

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	
	<div class="container">
		<h3 class=" text-info">�� �� ����</h3>

		<hr>

		<div style="border: 1px solid #d7dade; padding: 3px;">

			<form class="form-horizontal" name="detailForm">

				<div class="row">
					<div class="col-xs-12 col-md-12">
						<input type="text" class="form-control" name="postTitle"
							id="postTitle" style="height: 50px; font-size: 20px" placeholder="������ �Է��� �ּ���." />
					</div>
				</div>

				<!-- 			<div class="row"> -->
				<!-- 				<div class="col-xs-4 col-md-2"> -->
				<!-- 					<strong>�̹���</strong> -->
				<!-- 				</div> -->
				<!-- 			</div> -->

				<br />

				<div class="row">
					<div class="col-xs-12 col-md-12">
						<div class="body">
							<!-- ÷�� ��ư -->
							<div id="attach">
								<label class="waves-effect waves-teal btn-flat"
									for="uploadInputBox">����÷��</label> <input id="uploadInputBox"
									style="display: none" type="file" name="filedata" multiple />
							</div>

							<!-- �̸����� ���� -->
							<div id="preview" class="content"></div>

							<!-- multipart ���ε�� ���� -->
 							<div id="uploadForm" style="display: none;"></div>
						</div>
					</div>
				</div>

				<hr />

				<div class="postForm" align="center">

					<div id="toolbar-container" class="col-xs-12 col-md-12"></div>
					<textarea id="editor" name="postContent" style="text-align: left;">
					
					</textarea>
				

				</div>
				
				<p>
				
				<input type="checkbox" class="googleMapCheck" value="hide">��������
		  
		  		<div class="form-group googleMap">
		   			<div class="col-sm-4">
		    				<div id="map" style="width: 1100px; height: 600px;"></div>
		     					<input type="hidden" class="form-control" id="route" name="route" style="width: 1100px;">
		      					<span id="pop"></span>
		    		</div>
		    		<p> ��� ������ ���Ͻø� ��Ŀ ������ ���콺 ��Ŭ���� ���ֽñ� �ٶ��ϴ�.</p>
		  		</div>
			</form>
		</div>

		<hr />
		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-primary">���</button>
				<a id="reset" class="btn btn-primary btn" role="button">���</a>
			</div>
		</div>	
		
		<div class="row" style="height: 100px">
		
		</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>

	</div>

	<script>
	
	//============= ���� ���� =============
	  	
	  	
	  	  var poly;
	      var map;
	      var markers = [];
          var infowindowF;
          var infowindowL;

	      function initMap() {
	    	  
		        map = new google.maps.Map(document.getElementById('map'), {
			        zoom: 16,
			        center: {lat: 37.564, lng:  127.0017} 
		        });
	
		        poly = new google.maps.Polyline({
			        strokeColor: '#000000',
			        strokeOpacity: 0.5,
			        strokeWeight: 5,
			        map: map
		        });
		        
		        infowindowF = new google.maps.InfoWindow();
		        infowindowL = new google.maps.InfoWindow();
		        
		        map.addListener('click', addLatLng);
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
		        	infowindowF.setContent("���");
		 	        infowindowF.open(map, markers[0]);
		 	        
		 	        if(markers.length > 1){
			        	infowindowL.setContent("����");
			 	        infowindowL.open(map, marker);
		 	        }
		        	
		        }else{
			        alert("5������ ���� ������ dialog �߰�");
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
				        	infowindowF.setContent("���");
				 	        infowindowF.open(map, markers[0]);
				 	        
				 	        infowindowL.setContent("����");
				 	        infowindowL.open(map, markers[markers.length-1]);
					 	}
				    	
				    	$( "#route ").val(  test  );
					 	
		            });
		        }
	      }
	
	
	let editor;

	ClassicEditor
	    .create( document.querySelector( '#editor' ),{
	    
        	toolbar : [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ],
        	heading: {
                options: [
                    { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                    { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                    { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' }
                ]
            }
	    	
	    })
	    .then( newEditor => {
	        editor = newEditor;
	    } )
	    .catch( error => {
	        console.error( error );
	    } );
    
  //============= "�������Ͼ��ε�"  Event ó�� ��  ���� =============		

    //������ file object����
    var files = {};
    var previewIndex = 0;
    var fileNameArray = new Array();

    // image preview ��� ����
    // input = file object[]
    function addPreview(input) {
        if (input[0].files) {
            //���� ������ ���������� ���� ����
            for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                var file = input[0].files[fileIndex];

                if (validation(file.name))
                    continue;

    	        var fileName = file.name + "";   
    	        var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
    	        var fileNameExtension = fileName.toLowerCase().substring(fileNameExtensionIndex, fileName.length);       
    	        
					var imgSelectName = "img";

					if(fileNameExtension === 'mp4' || fileNameExtension === 'avi'){
						imgSelectName = "iframe";
					}	                        
                

                var reader = new FileReader();
                reader.onload = function(img) {
                    //div id="preview" ���� �����ڵ��߰�.
                    //�� �κ��� �����ؼ� �̹��� ��ũ �� ���ϸ�, ������ ���� �ΰ������� �� �� ���� ���̴�.
                    var imgNum = previewIndex++;
                    
                    var previewId = "";
                   
                    if(imgNum==0){
                    	previewId = "start";
                    }else{
                    	previewId = "startNo";	
                    }
                	
                	document.querySelector( '#editor' ).addEventListener( 'click', () => {
                	    const editorData = editor.getData();     	           
                	} );
                	
                    editor.setData(editor.getData()+"<p><"+imgSelectName+" src='" + img.target.result + "' style='min-width:100%'/></p><p/>");		
                
                    
                    $("#preview").append(
                                    "<div class=\"preview-box\" id="+previewId+"  value=\"" + imgNum +"\"  style='display:inline;float:left;width:208px' >"
                                            + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"200px;\" height=\"200px;\"/>"
                                            + "<a href=\"#\" value=\""
                                            + imgNum
                                            + "\" onclick=\"deletePreview(this)\">"
                                            + "����" + "</a>" + "</div>");
                    files[imgNum] = file;
                    
                    fileNameArray[imgNum]=file.name;
                    fnAddFile(fileNameArray);
                };

                reader.readAsDataURL(file);
            }
        } else
            alert('invalid file input'); // ÷��Ŭ�� �� ��ҽ��� ����å�� ������ �ʾҴ�.
    }

    //preview �������� ���� ��ư Ŭ���� �ش� �̸������̹��� ���� ����
    function deletePreview(obj) {
        var imgNum = obj.attributes['value'].value;
        delete files[imgNum];
        $("#preview .preview-box[value=" + imgNum + "]").remove();
        resizeHeight();
    }

    //client-side validation
    //always server-side validation required
    function validation(fileName) {
        fileName = fileName + "";
        var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
        var fileNameExtension = fileName.toLowerCase().substring(
                fileNameExtensionIndex, fileName.length);
        if (!((fileNameExtension === 'jpg')|| (fileNameExtension === 'gif') || (fileNameExtension === 'png')||(fileNameExtension === 'avi')||(fileNameExtension === 'mp4'))) {
            alert('jpg, gif, png, avi, mp4 Ȯ���ڸ� ���ε� �����մϴ�.');
            return true;
        } else {
            return false;
        }
    }

	 
    $(document).ready(function() { 
	
    	$(".googleMap").hide();
    	
    	$(".googleMapCheck").on("click",function(){
    		
    		alert($(this).val())
    		if( $(this).val() == 'hide' ) {
    			$(".googleMap").show('slow');
    			$(this).val("show");
    			return;
    		}
    		
    		if( $(this).val() == "show") {
    			$(".googleMap").hide('slow');
    			$(this).val("hide");
    			return;
    		}
    	});
        $('#attach input[type=file]').change(function() {
            addPreview($(this)); //preview form �߰��ϱ�
        });
    }); 

</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"></script>

</body>
</html>