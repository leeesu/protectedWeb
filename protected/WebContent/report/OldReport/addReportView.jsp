<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">
	<head>
		<meta charset="EUC-KR">
		
		<!-- ���� : http://getbootstrap.com/css/   ���� -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

		<!--  ///////////////////////// CSS ////////////////////////// -->
			<style>
		       body > div.container{
		        	border: 3px solid #D6CDB7;
		            margin-top: 10px;
		        }
		    </style>

		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
  		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	</head>
	
	<body>
	
		<jsp:include page="/layout/toolbar.jsp" />
		
		<div class="container">
		
			<h1 class="bg-primary text-center">�� �� �� ��</h1>
			
			<form id ="uploadForm" class="form-horizontal">
			<input type="hidden" id="reporterId" name="reporterId" value="${ sessionScope.user.id }"/>
			
 				<div class="form-group">
 					<div class="col-sm-2">
 						<p>�Ű���</p>
 					</div>
 					<div class="col-sm-10">
 						<c:if test='${ param.id != null }'>
							<input type="text" readonly="readonly" class="form-control" name="reportedId" value="${ param.id }">
						</c:if>
						<input type="text" class="form-control" name="reportedId" value="${ param.id }">
					</div>
				</div>
						
				<br/>
				<br/>
				<br/>		
								
				<div class="form-group">
					
					<div class="col-sm-2">
						<p>�Ű�����</p>
					</div>
					<div class="col-sm-10" style="float:left">
						<select name="reportCategory" class="form-control" 
							style="width: 150px; height: 35px" maxLength="20">
							<option value="��Ӿ�">��Ӿ���</option>
							<option value="���">�������</option>
							<option value="��������">��������</option>
							<option value="����ǥ��">����ǥ��</option>
							<option value="��Ÿ">��Ÿ</option>
						</select>
					
					</div>
				
				</div>
				
				<br/>
				<br/>
				<br/>
				<hr/>
				<br/>
				
				<div class="form-group">
					<textarea class="form-control" rows="20" placeholder="1000�� �̸����� �ۼ����ּ���" 
					id="reportContent" name="reportContent" value="" required></textarea>
				</div>
				<br/>
				<br/>
				<hr/>
				<br/>
				<br/>
				
            <div id="attach" class="form-group">
                <span class="label label-primary " ><label class="waves-effect waves-teal btn-flat" for="uploadInputBox">�������</label></span>&nbsp;(�ִ� 3����� ���ε� �����մϴ�.)
                <input id="uploadInputBox" style="display: none" type="file" value="���" name="filedata"  />
            </div>
            
			<!-- �̸����� ���� -->
            <div class="form-group">
            	<div id="preview" class="col-md-3" align="center" style='display:inline; min-width:600px;'></div> 
            </div>
			<br/>
				
				

				<br/>
				<br/>
				<br/>
				<hr/>
				
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-4 text-center">
						<input type="submit" id="submit" class="btn btn-primary" value="���">
						<a class="btn btn-primary btn" href="#" role="button">���</a>
					</div>
				</div>
				
				<br/>
				<br/>
				<br/>
				<br/>
				
			<input type="hidden" class="form-control" id="multiFile" name="multiFile" >	
			</form>
	
		</div>
	
	<!-- JavaScript ���� -->
	<script type="text/javascript">
		
		function fncAddReport(){
			//Form ��ȿ�� ����
			var content = $("input[name='reportContent']").val();

			
// 			if(reportContent == null || reportContent.length<1){
// 				alert("������ �Է��� �ּ���.");
// 				return;
// 			}
			
// 			if(reportContent.length>1000){
// 				alert("������ 1õ�� �̸����� �ۼ��� �ּ���.")
// 				return;
// 			}
		   
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
                url : '/Images/json/imageupload/RP',
                dataType : 'JSON',
                data : formData,
                success : function(result) {
                    if (result === -1) {
                        alert('jpg, gif, png, bmp Ȯ���ڸ� ���ε� �����մϴ�.');
                        // ���� ���� ...
                    } else if (result === -2) {
                        alert('������ 10MB�� �ʰ��Ͽ����ϴ�.');
                        // ���� ���� ...
                    } else {
                        alert('�̹��� ���ε� ����');
                    }
                }
            });
        });
			
			$("#uploadForm").attr("method", "POST").attr("action", "/report/addReport").attr("enctype","multipart/form-data");

			alert("�Ű� �Ϸ�Ǿ����ϴ�.");
		}
		
		   //============= "�������Ͼ��ε� ���ϸ� �����ؼ� value" =============   
		   function fnAddFile(fileNameArray) {
		         $("#multiFile").val(fileNameArray)    
		   }   
		   
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
		                
		                //append�Ҷ� ������ �̹��� �������ֱ�
		               var imgSelectName = "img";
		               if(fileNameExtension === 'mp4' || fileNameExtension === 'avi'){
		                  imgSelectName = "iframe";
		               }                           

		                 var reader = new FileReader();
		                 reader.onload = function(img) {
		                     //div id="preview" ���� �����ڵ��߰�.
		                     //�� �κ��� �����ؼ� �̹��� ��ũ �� ���ϸ�, ������ ���� �ΰ������� �� �� ���� ���̴�.
		                     
		                     var imgNum = previewIndex++;
		                     
		                    //8�� �̻� ���ε��
		                     if(Object.keys(files).length>=3){
		                        alert("������ 3������� ���ε� �����մϴ�.");
		                        delete files[imgNum];
		                     }else{
		               // 8�� ���� 
		                     $("#preview").append(
		                                     "<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px' >"
		                                             + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"120px;\" height=\"120px;\"/>"
		                                             + "<a href=\"#\" value=\""
		                                             + imgNum
		                                             + "\" onclick=\"deletePreview(this)\">"
		                                             + "   ����" + "</a>" + "</div>");

		                     files[imgNum] = file;
		                     fileNameArray[imgNum]=file.name;
		                     fnAddFile(fileNameArray);
		                     }

		                 };

		                 reader.readAsDataURL(file);
		             }
		         } else
		             alert('invalid file input'); // ÷��Ŭ�� �� ��ҽ��� ����å�� ������ �ʾҴ�.
		     }

		     //============= preview �������� ���� ��ư Ŭ���� �ش� �̸������̹��� ���� ���� =============
		     function deletePreview(obj) {
		         var imgNum = obj.attributes['value'].value;
		         delete files[imgNum];
		         fileNameArray.splice(imgNum,1);
		         fnAddFile(fileNameArray);
		         $("#preview .preview-box[value=" + imgNum + "]").remove();
		         resizeHeight();
		     }

		     //============= ���� Ȯ���� validation üũ =============
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

		          //============= �����̸����� =============
		          $('#attach input[type=file]').change(function() {
		             addPreview($(this)); //preview form �߰��ϱ�
		         });
		       });
		
			$(function(){
				$('#submit').on('click',function(){
// 					alert("ssss");
					fncAddReport();
				});
			});
			
			
			$(function(){
				$('a[href="#"]').on('click',function(){
					$("form")[0].reset;
				});
			});


	
		
		
		</script>
	</body>

</html>
