<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>��ȣ�Ұ� �� ��������</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
		.map_wrap, .map_wrap * {
			margin: 0;
			padding: 0;
			font-family: 'Malgun Gothic', dotum, '����', sans-serif;
			font-size: 12px;
		}
		
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
			color: #000;
			text-decoration: none;
		}
		
		.map_wrap {
			position: relative;
			width: 100%;
			height: 500px;
		}
		
		#menu_wrap {
			position: absolute;
			top: 0;
			left: 0;
			bottom: 0;
			width: 250px;
			margin: 10px 0 30px 10px;
			padding: 5px;
			overflow-y: auto;
			background: rgba(255, 255, 255, 0.7);
			z-index: 1;
			font-size: 12px;
			border-radius: 10px;
		}
		
		.bg_white {
			background: #fff;
		}
		
		#menu_wrap hr {
			display: block;
			height: 1px;
			border: 0;
			border-top: 2px solid #5F5F5F;
			margin: 3px 0;
		}
		
		#menu_wrap .option {
			text-align: center;
		}
		
		#menu_wrap .option p {
			margin: 10px 0;
		}
		
		#menu_wrap .option button {
			margin-left: 5px;
		}
		
		#placesList li {
			list-style: none;
		}
		
		#placesList .item {
			position: relative;
			border-bottom: 1px solid #888;
			overflow: hidden;
			cursor: pointer;
			min-height: 65px;
		}
		
		#placesList .item span {
			display: block;
			margin-top: 4px;
		}
		
		#placesList .item h5, #placesList .item .info {
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;
		}
		
		#placesList .item .info {
			padding: 10px 0 10px 55px;
		}
		
		#placesList .info .gray {
			color: #8a8a8a;
		}
		
		#placesList .info .jibungray {
			padding-left: 26px;
			background:
				url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
				no-repeat;
		}
		
		#placesList .info .tel {
			color: #009900;
		}
		
		#placesList .item .markerbg {
			float: left;
			position: absolute;
			width: 36px;
			height: 37px;
			margin: 10px 0 0 10px;
			background:
				url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
				no-repeat;
		}
		
		#placesList .item .marker_1 {
			background-position: 0 -10px;
		}
		
		#placesList .item .marker_2 {
			background-position: 0 -56px;
		}
		
		#placesList .item .marker_3 {
			background-position: 0 -102px
		}
		
		#placesList .item .marker_4 {
			background-position: 0 -148px;
		}
		
		#placesList .item .marker_5 {
			background-position: 0 -194px;
		}
		
		#placesList .item .marker_6 {
			background-position: 0 -240px;
		}
		
		#placesList .item .marker_7 {
			background-position: 0 -286px;
		}
		
		#placesList .item .marker_8 {
			background-position: 0 -332px;
		}
		
		#placesList .item .marker_9 {
			background-position: 0 -378px;
		}
		
		#placesList .item .marker_10 {
			background-position: 0 -423px;
		}
		
		#placesList .item .marker_11 {
			background-position: 0 -470px;
		}
		
		#placesList .item .marker_12 {
			background-position: 0 -516px;
		}
		
		#placesList .item .marker_13 {
			background-position: 0 -562px;
		}
		
		#placesList .item .marker_14 {
			background-position: 0 -608px;
		}
		
		#placesList .item .marker_15 {
			background-position: 0 -654px;
		}
		
		#pagination {
			margin: 10px auto;
			text-align: center;
		}
		
		#pagination a {
			display: inline-block;
			margin-right: 10px;
		}
		
		#pagination .on {
			font-weight: bold;
			cursor: default;
			color: #777;
		}
       @font-face{
          font-family: NanumSquare;
          src : url(http://ssl.pstatic.net/static/kin/fonts/NanumSquareR.woff2) format("woff2");
       }
       body{
          font-family: NanumSquare, sans-serif !important;
       }
</style>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->
	
</head>
<body>
	<div class="container" >
	
		    <div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 60px;">
	      <div class="container">
	        <div class="row no-gutters slider-text align-items-center justify-content-center">
	          <div class="col-md-9 ftco-animate text-center">
	          	<p ><span class="mr-2">Animal</span> <span>Hospital</span></p>
	            <font size="7">�������� �˻�</font>
	          </div>
	        </div>
	      </div>
	    </div>
		<br/><p/>

	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form>

						<select id="z1" style="width: 200px; text-align: center;">
							<option value="��������">�ø� �������ּ���</option>
							<option value="����Ư���� ��������" data-lat="37.5668260055"
								data-lng="126.978656786">����Ư����</option>
							<option value="�λ걤���� ��������" data-lat="35.1798200523"
								data-lng="129.075087492">�λ걤����</option>
							<option value="�뱸������ ��������" data-lat="35.8713802647"
								data-lng="128.601805491">�뱸������</option>
							<option value="��õ������ ��������" data-lat="37.4559252001"
								data-lng="126.705267423">��õ������</option>
							<option value="���ֱ����� ��������" data-lat="35.1600820602"
								data-lng="126.851572921">���ֱ�����</option>
							<option value="���������� ��������" data-lat="36.3505388993"
								data-lng="127.384834847">����������</option>
							<option value="��걤���� ��������" data-lat="35.5394827878"
								data-lng="129.311467919">��걤����</option>
							<option value="��⵵ ��������" data-lat="37.2749769873"
								data-lng="127.00892997">��⵵</option>
							<option value="������ ��������" data-lat="37.8853257858"
								data-lng="127.72982901">������</option>
							<option value="��û�ϵ� ��������" data-lat="36.635358196"
								data-lng="127.491457326">��û�ϵ�</option>
							<option value="��û���� ��������" data-lat="36.6588292533"
								data-lng="126.672776194">��û����</option>
							<option value="����ϵ� ��������" data-lat="35.820196364"
								data-lng="127.108976712">����ϵ�</option>
							<option value="���󳲵� ��������" data-lat="34.8160821479"
								data-lng="126.462788333">���󳲵�</option>
							<option value="���ϵ� ��������" data-lat="36.58123975"
								data-lng="128.58261919">���ϵ�</option>
							<option value="��󳲵� ��������" data-lat="35.2377742105"
								data-lng="128.691896889">��󳲵�</option>
							<option value="����Ư����ġ�� ��������" data-lat="33.4889107082"
								data-lng="126.498233487">����Ư����ġ��</option>
						</select>
						<!-- 				  <select id="z2">
					    <option value="">�ñ���</option>
					  </select>
					  <select id="z3">
					    <option value="">���鵿</option>
					  </select>-->
	    		    
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
         </div>
		</div>
		<br/><br/><br/><br/>
	</div>
	<!--================ start footer Area  =================-->
	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!-- footer End /////////////////////////////////////-->
	<!--================ End footer Area  =================-->
	<script src="../../resources/prodmenu/js/popper.min.js"></script>
	<script src="../../resources/prodmenu/js/bootstrap.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.easing.1.3.js"></script>
	<script src="../../resources/prodmenu/js/jquery.waypoints.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.stellar.min.js"></script>
	<script src="../../resources/prodmenu/js/owl.carousel.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
	<script src="../../resources/prodmenu/js/aos.js"></script>
	<script src="../../resources/prodmenu/js/jquery.animateNumber.min.js"></script>
	<!-- 	<script src="./../resources/prodmenu/js/bootstrap-datepicker.js"></script> -->
	<script src="../../resources/prodmenu/js/scrollax.min.js"></script>
	<script src="../../resources/prodmenu/js/main.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=153d14a106a978cdc7a42f3f236934a6&libraries=services"></script>
	<script>
		// ��Ŀ�� ���� �迭�Դϴ�
		var markers = [];

		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
			level : 10
		// ������ Ȯ�� ����
		};

		// ������ �����մϴ�    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// ��� �˻� ��ü�� �����մϴ�
		var ps = new kakao.maps.services.Places();

		// �˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 �����մϴ�
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		//============= �õ� ���� Event   ó�� =============
		$("#z1").change(function() {
			// Ű����� ��Ҹ� �˻��մϴ�
			searchPlaces();
		});

		// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
		function searchPlaces() {

			var keyword = $("#z1").val();
			//var keyword = document.getElementById('keyword').text;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('Ű���带 �Է����ּ���!');
				return false;
			}

			// ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// ���������� �˻��� �Ϸ������
				// �˻� ��ϰ� ��Ŀ�� ǥ���մϴ�
				displayPlaces(data);

				// ������ ��ȣ�� ǥ���մϴ�
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('�˻� ����� �������� �ʽ��ϴ�.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('�˻� ��� �� ������ �߻��߽��ϴ�.');
				return;

			}
		}

		// �˻� ��� ��ϰ� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
			removeAllChildNods(listEl);

			// ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // �˻� ��� �׸� Element�� �����մϴ�

				// �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
				// LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
				bounds.extend(placePosition);

				// ��Ŀ�� �˻���� �׸� mouseover ������
				// �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ�
				// mouseout ���� ���� ���������츦 �ݽ��ϴ�
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					// ��Ŀ�� click �̺�Ʈ�� ����մϴ�
					kakao.maps.event.addListener(marker, 'click', function() {
		
						alert(places[i].place_name)
						alert(places[i].road_address_name)
						//alert(i)
						//alert(placesY[i])
						//alert(places[i].y)

						// self.location = "/review/getHospitalReview";

					});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};

					itemEl.onclick = function() {
						
						var placeName = $(this).children("div").children("h5").text();
						var placeAddr = $(this).children("div").children("span").text();
						var placeJIAddr = $(this).children("div").children("span.jibungray").text();
						var placeTel = $(this).children("div").children("span.tel").text();

						self.location = "/review/getHospitalReview?placeName="+ encodeURI(encodeURIComponent(placeName))
																  +"&placeAddr="+ encodeURI(encodeURIComponent(placeAddr))
																  +"&placeJIAddr="+ encodeURI(encodeURIComponent(placeJIAddr))
																  +"&placeTel="+encodeURI(encodeURIComponent(placeTel));

					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// �˻���� �׸���� �˻���� ��� Elemnet�� �߰��մϴ�
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
			map.setBounds(bounds);
		}
		

		// �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info" >'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibungray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
		function addMarker(position, idx, title) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
			imageSize = new kakao.maps.Size(36, 37), // ��Ŀ �̹����� ũ��
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
				offset : new kakao.maps.Point(13, 37)
			// ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // ��Ŀ�� ��ġ
				image : markerImage
			});

			marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
			markers.push(marker); // �迭�� ������ ��Ŀ�� �߰��մϴ�

			return marker;
		}

		// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// �˻���� ��� �ϴܿ� ��������ȣ�� ǥ�ô� �Լ��Դϴ�
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// ������ �߰��� ��������ȣ�� �����մϴ�
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// �˻���� ��� �Ǵ� ��Ŀ�� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
		// ���������쿡 ��Ҹ��� ǥ���մϴ�
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// �˻���� ����� �ڽ� Element�� �����ϴ� �Լ��Դϴ�
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>
</body>
</html>