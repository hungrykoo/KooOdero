<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">
/* div{
 border : 1px solid black;
} */
.sc_box {
	margin-top: 7%;
	width: 100%;
	margin: 0px auto;
}

/*소제목 1틀  */
.sc_title {
	width: 60%;
	margin: 2% auto;
	border: 1px solid #E6E6E6;
	padding: 1%;
	margin-bottom: 30px;
}

.tag-title {
	margin-top: 8px;
	float: left;
}

.date {
	position: relative;
	/*감싸는 레이어에 포지션 속성을 잡아주는 게 필수!(relative, absolute, fixed 중 택1*/
	width: 100%;
	height: 2000px;
	text-align: center;
	line-height: 100px; /* 
  margin:0 auto;   */
	color: #000;
	font-size: 12px;
	background-color: #E0ECF8;
}

.date_rc {
	position: absolute;
	width: 70%;
	height: 1200px;
	text-align: center;
	margin: 10%;
}

.box {
	padding: 0 20px 20px 20px;
}

.box .box-content:hover {
	border: 2px solid #525C7A;
}

.box .box-content {
	padding: 16px;
	border-radius: 0 0 2px 2px;
	background-clip: padding-box;
	box-sizing: border-box;
	background: #fff;
	transition: all 0.2s ease;
	border: 2px dashed #DFE2E6;
	margin-top: 10px;
	box-sizing: border-box;
	border-radius: 5px;
	background-clip: padding-box;
	padding: 0 20px 20px 20px;
	min-height: 340px;
}

.box .box-content p {
	color: #515c66;
	text-transform: none;
}

.row {
	margin: 0px;
	margin-bottom: 30px;
}

.rc_box {
	padding-top: 3%;
}

.title {
	margin: 2%;
}

.big_title {
	width: 50%;
	padding: 2%;
	background-color: #fff;
	margin: 0px auto;
}

#Mymodal {
	position: fixed;
	top: 25%;
	height: 300px;
}

.tmap_1 {
	width: 80%;
	height: 70%;
	margin: 0px auto;
}

.tmap_2 {
	width: 63%;
	height: 230px;
	background-color: #FAFAFA;
	padding: 1%;
}

.btn-like {
	height: 50px;
}

.like {
	background-color: #F3ABBA;
	font-color: #ffffff;
}

.tmap_td {
	border-bottom: 1.5px solid #888;
}

.tmap_td_b {
	border-top: 2px solid #888;
}

.tmap_table {
	width: 100%;
	height: 50px;
}

.tmap_title {
	font-size: 18px;
	float: left;
}

.tmap_detail {
	font-size: 12px;
}

.tmap_res {
	font-size: 13px;
}

.tmap_wrap {
	padding: 2%;
	background: #666;
	color: #fff;
	width: 100%;
}

.rc_title {
	margin: 2%;
}

.rc {
	background-color: #FAFAFA;
	margin-top: 0%;
}

.sc_ti {
	color: #2E2E2E;;
	height: 30px;
	font-weight: bold;
}

.rc_detail {
	font-size: 5px;
}
.reset_btn:hover {
	background-color: #fff;
}
</style>
<script>
$(function() {
	if(${mapCk}=="1"){
		$('html, body').animate({
			scrollTop: $('.review_wrap').offset().top
			}, 300);
	}
});
</script>

</head>
<body>
	<div class="container-fluid sc">
		<div class="sc_title">
			<h2 class="sc_ti text-center">추 천 코 스</h2>
			<br>
			<h4 class="sc_ti text-center">▼▼▼▼▼</h4>
		</div>
		<div class="sc_box">
			<!--지도  -->
			<div class="tmap_1">
				<div id="map" style="width: 100%; height: 550px"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71a358ab1852f4a6dd2eee5070f7a02&libraries=services"></script>

				<script>
     var container = document.getElementById('map');
     var options = {
      center : new daum.maps.LatLng(37.55648584608168, 126.91944661906786),
      level : 3
     };
     var p_addr = [];
     var p_nos = [];
     /* <c:forEach var="addr" items="${strPosition }">
       p_addr.push("${addr}");
     </c:forEach>
     <c:forEach var="no" items="${strPnos}">
     	p_nos.push("${no}");
   	 </c:forEach> */
     <c:forEach var="addr" items="${f_Positions }">
     p_addr.push("${addr}");
   </c:forEach>
   <c:forEach var="no" items="${f_Pnos}">
   	p_nos.push("${no}");
 	 </c:forEach>
     <c:forEach var="addr" items="${c_Positions }">
     p_addr.push("${addr}");
   </c:forEach>
   <c:forEach var="no" items="${c_Pnos}">
   	p_nos.push("${no}");
 	 </c:forEach>
     <c:forEach var="addr" items="${p_Positions }">
     p_addr.push("${addr}");
   </c:forEach>
   <c:forEach var="no" items="${p_Pnos}">
   	p_nos.push("${no}");
 	 </c:forEach>
     var map = new daum.maps.Map(container, options);
     
     var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
        MARKER_HEIGHT = 35, // 기본, 클릭 마커의 높이
        OFFSET_X = 17, // 기본, 클릭 마커의 기준 X좌표
        OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
        OVER_MARKER_WIDTH = 34, // 오버 마커의 너비
        OVER_MARKER_HEIGHT = 35, // 오버 마커의 높이
        OVER_OFFSET_X = 22, // 오버 마커의 기준 X좌표
        OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
        SPRITE_MARKER_URL = 'img_1/marker_odero1.png', // 스프라이트 마커 이미지 URL
        SPRITE_WIDTH = 120, // 스프라이트 이미지 너비
        SPRITE_HEIGHT = 388, // 스프라이트 이미지 높이
        SPRITE_GAP = 9; // 스프라이트 이미지에서 마커간 간격

    var markerSize = new daum.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
        markerOffset = new daum.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
        overMarkerSize = new daum.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
        overMarkerOffset = new daum.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
        spriteImageSize = new daum.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

        
    //검색 버튼 클릭 후에만 실행
    if(p_addr.length > 1) {
     //마커의 위치
     /* var strpositions = ${strPosition};
     strpositions = strpositions.split("_");
     strpositions[0] = strposition[0].split(","); */
     
     /* strpositions = "37.49539984153658, 127.03040567183359";
     strpositions = strpositions.split(","); */
     var positions = [ 
            new daum.maps.LatLng(Number(p_addr[0].split(",")[0]),Number(p_addr[0].split(",")[1].trim())),
            new daum.maps.LatLng(Number(p_addr[1].split(",")[0]),Number(p_addr[1].split(",")[1].trim())),
            new daum.maps.LatLng(Number(p_addr[2].split(",")[0]),Number(p_addr[2].split(",")[1].trim())),
            new daum.maps.LatLng(Number(p_addr[3].split(",")[0]),Number(p_addr[3].split(",")[1].trim())),
            new daum.maps.LatLng(Number(p_addr[4].split(",")[0]),Number(p_addr[4].split(",")[1].trim())),
            new daum.maps.LatLng(Number(p_addr[5].split(",")[0]),Number(p_addr[5].split(",")[1].trim())),
            new daum.maps.LatLng(Number(p_addr[6].split(",")[0]),Number(p_addr[6].split(",")[1].trim())),
            new daum.maps.LatLng(Number(p_addr[7].split(",")[0]),Number(p_addr[7].split(",")[1].trim())),
            new daum.maps.LatLng(Number(p_addr[8].split(",")[0]),Number(p_addr[8].split(",")[1].trim()))
     ];
     var selectedMarker = []; // 클릭한 마커를 담을 변수(3개)
     
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div
         mapOption = { 
             center: new daum.maps.LatLng(Number(p_addr[0].split(",")[0]),Number(p_addr[0].split(",")[1].trim())), // 지도의 중심좌표
             level: 6 // 지도의 확대 레벨
         };

     var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     
  	  //클릭 갯수 count할 변수
     var cnt = 0;
     // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
     var markers = [];
     //코스 리스트 찜 목록
     
     var course_list  = "";
     $(document).on("click", "#cjjim_btn", function() {
    	 if(cnt < 3) {
    		 alert("데이트 장소 3곳을 선택하세요!");
    	 } else {
    		 location.href='course_jjim_insert.do?course_list='+course_list;
    	 }
     });

     // 지도 위에 마커를 표시합니다
     for (var i = 0, len = positions.length; i < len; i++) {
         var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
             originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
             overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
             normalOrigin = new daum.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
             clickOrigin = new daum.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
             overOrigin = new daum.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
             
         // 마커를 생성하고 지도위에 표시합니다
         addMarker(positions[i], normalOrigin, overOrigin, clickOrigin,p_nos[i], map);
     }

     // 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
     function addMarker(position, normalOrigin, overOrigin, clickOrigin, title_id, m_map) {

         // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
         var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
             overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
             clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
         
         // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
         var marker = new daum.maps.Marker({
             position: position,
             image: normalImage,
             title: "m_"+title_id
         });
         
         // 마커가 지도 위에 표시되도록 설정합니다
         marker.setMap(m_map);
         
         // 생성된 마커를 배열에 추가합니다
         markers.push(marker);
         

         // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
         marker.normalImage = normalImage;

         // 마커에 mouseover 이벤트를 등록합니다
         daum.maps.event.addListener(marker, 'mouseover', function() {

             // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
             // 마커의 이미지를 오버 이미지로 변경합니다
             /* if (!selectedMarker || selectedMarker !== marker) {
                 marker.setImage(overImage);
             } */
             var bCheck = false;
             for (var i=0; i<selectedMarker.length; i++) {
            	 if(selectedMarker[i] == marker.getTitle()) {
            		 bCheck = true;
            	 }
              }
             if (bCheck == false) {
                marker.setImage(overImage);
              }
             
         });
         
         // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
         function setMarkers(map) {
             for (var i = 0; i < markers.length; i++) {
                 markers[i].setMap(map);
             }            
         }

         // "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
         function showMarkers() {
             setMarkers(map)    
         }

         // "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
         function hideMarkers() {
             setMarkers(null);    
         }
         
         // 마커에 mouseout 이벤트를 등록합니다
         daum.maps.event.addListener(marker, 'mouseout', function() {

             // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
             // 마커의 이미지를 기본 이미지로 변경합니다
             
             var bCheck = false;
             for (var j=0; j<selectedMarker.length; j++) {
            	 if(selectedMarker[j] == marker.getTitle()) {
            		 bCheck = true;
            	 }
              }
             if (bCheck == false) {
            	 marker.setImage(normalImage);
              }
            /*  if (!selectedMarker || selectedMarker !== marker) {
                 marker.setImage(normalImage);
             } */
         });

         // 마커에 click 이벤트를 등록합니다
         daum.maps.event.addListener(marker, 'click', function() {
       	     //다시 누르면 취소되게
       	     /* for(var i=0; i<selectedMarker.length; i++) {
       	    	 if(selectedMarker[i] == marker.getTitle()) {
       	    	    // 클릭된 마커의 이미지를 기본 이미지로 변경
       	    		selectedMarker.setImage(selectedMarker.normalImage);
       	    	    cnt = cnt - 1;
       	    	 }
       	     } */
	       	  var bCheck = false;
	          for (var j=0; j<selectedMarker.length; j++) {
	         	 if(selectedMarker[j] == marker.getTitle()) {
	         		 bCheck = true;
	         	 }
	           }
	          if(bCheck == false) {
	        	  cnt = cnt + 1;
	        	  if(cnt <= 3) { //세 개까지
	        	    	 selectedMarker.push(marker.getTitle());
	               	 marker.setImage(clickImage);
	               	 var p_no = marker.getTitle().split("_")[1];
	          			 course_list = course_list + p_no + "_";
	               	$.ajax({
		        			type : "POST",
		        			url : "placetoplace.do",
		        			data : {
		        				"p_no" :  p_no,
		        				"cnt" : cnt,
		        				"placeCheck" : true
		        			},
		        			success : function(res) {
		        				$("#place_" + cnt).html(res);
		        			}
		        		});
	        	     } else {
	        	    	 alert("이미 세개의 장소를 선택했습니다! 초기화 해주세요!");
	        	     }
	          }
	          
	          $(".reset_btn").click(function() {
	      			cnt = 0;
	      			course_list = "";
	      			$.ajax({
	        			type : "POST",
	        			url : "placetoplace.do",
	        			data : {
	        				"p_no" :  0,
	        				"cnt" : 1,
	        				"placeCheck" : false
	        			},
	        			success : function(res) {
	        				$("#place_" + cnt).html(res);
	        			}
	        		});
	      			for(var i=0; i<3; i++) {
	      				selectedMarker[i] = "";
	      			}
	      			hideMarkers();
	      			for (var i = 0, len = positions.length; i < len; i++) {
	      		         var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
	      		             originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
	      		             overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
	      		             normalOrigin = new daum.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
	      		             clickOrigin = new daum.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
	      		             overOrigin = new daum.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
	      		             
	      		         // 마커를 생성하고 지도위에 표시합니다
	      		         addMarker(positions[i], normalOrigin, overOrigin, clickOrigin,p_nos[i], map);
	      		     }
	      			
	      	   });
       	     
       	     
             // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
             // 마커의 이미지를 클릭 이미지로 변경합니다
           /*   if (!selectedMarker || selectedMarker !== marker) {

                 // 클릭된 마커 객체가 null이 아니면
                 // 클릭된 마커의 이미지를 기본 이미지로 변경하고
                 !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

                 // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
                 marker.setImage(clickImage);
             }

             // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
             selectedMarker = marker; */
         });
     }

     // MakrerImage 객체를 생성하여 반환하는 함수입니다
     function createMarkerImage(markerSize, offset, spriteOrigin) {
         var markerImage = new daum.maps.MarkerImage(
             SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
             markerSize, // 마커의 크기
             {
                 offset: offset, // 마커 이미지에서의 기준 좌표
                 spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
                 spriteSize: spriteImageSize // 스프라이트 이미지의 크기
             }
         );
         
         return markerImage;
     }

    }
    </script>

			</div>

			<center>
				<div class="tmap_2">
					<center>
						<table class="tmap_table">
							<tr>
								<td width=47% class="tmap_td"></td>
								<td width=6% rowspan="2" class="text-center"><h4>
										<b>거리계산</b>
									</h4></td>
								<td width=47% class="tmap_td"></td>
							</tr>
							<tr>
								<td class="tmap_td_b"></td>
								<td class="tmap_td_b"></td>
							</tr>
						</table>
					</center>
					<table width="95%" height="100px">
						<tr>
							<!--1번  -->
							<td width="24%">
								<!-- //1번째 장소 div -->
								<div id="place_1">
									
								</div>
								<!-- //1번째 장소 div끝 -->
							</td>
							<td width="13%">
								<center>
									<!-- <span class="glyphicon glyphicon-chevron-right"></span> -->
									<table style="float: left; margin: 3%;">
										<tr>
											<td class="tmap_res"><span>이동 거리 </span><span>100m</span>
											</td>
											<td rowspan="2"><span
												class="glyphicon glyphicon-chevron-right"></span></td>
										</tr>
										<tr>

											<td class="tmap_res"><span>이동 시간 </span><span>3분</span>
											</td>

										</tr>
									</table>
								</center>
								
							</td>
							<!--2번  -->
							<td width="24%">
								<div id="place_2">
									
								</div>
							</td>
							<td width="13%">
								<center>

									<table style="float: left; margin: 3%;">
										<tr>
											<td class="tmap_res"><span>이동 거리 </span><span>100m</span>
											</td>
											<td rowspan="2"><span
												class="glyphicon glyphicon-chevron-right"></span> <!-- 이동거리 화살표 --></td>
										</tr>
										<tr>
											<td class="tmap_res"><span>이동 시간 </span><span>3분</span>
											</td>
										</tr>
									</table>
								</center>
							</td>
							<!-- 3번 -->
							<td width="24%">
								<div id="place_3">
									
								</div>
							</td>
						</tr>
					</table>
					<!--코스 찜 하기 버튼  -->
					<table>
						<tr>
							<td class="btn-like text-center">
								<input type="button" class="reset_btn btn btn-default" value="초기화" >
								<button type="button" class="btn like" data-toggle="modal"
									data-target="#myModal" aria-hidden="true"
									style="outline: none;">
									<b>코스 찜하기</b>
								</button>
							</td>
						</tr>
					</table>
			</center>
		</div>

	</div>
	<div style="width: 63%; margin: 0px auto;">
		<hr>
	</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<center>
			<div class="modal-dialog">
				<div class="modal-content" style="width: 400px;">
					<div class="modal-header">
						<!-- 모달 닫기 -->
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<!-- 모달 내용 -->
					<div class="modal-body">
						<center>
							<img src="img_1/date.jpg" width="300px" height="300px"> <br
								clear=left>
							<h5 style="margin-top: 2%;">
								<b>선택하신 데이트 코스를 찜 하시겠습니까?</b>
							</h5>
						</center>
					</div>
					<div class="modal-footer">
						<center>
							<input type="button" class="btn btn-default"
								style="background-color: white; outline: none; font-weight: bold" value="코스 찜" 
								id="cjjim_btn" onclick="location.href='course_jjim_insert.do?course_list=${course_list}'">
							<button type="button" class="btn btn-default"
								style="background-color: white; outline: none;"
								data-dismiss="modal">
								<b>취소</b>
							</button>
						</center>
					</div>
				</div>
			</div>
		</center>
	</div>

	<div class="container rc">
		<div class="rc_box">
			<!--맛집 리스트  -->
			
			<div class="row">
				<div style="width: 100%; height: 25px;">
					<h4 style="margin: 0px; float: left">
						<b>▶ 추천</b><b style="color: #DF0101;">맛집</b>
					</h4>
				</div>
				<c:forEach var="fvo" items="${pf_list }" varStatus="i">
					<div class="col-md-4 text-center" onclick="location.href='p_detail.do?p_no=${fvo.p_no}'" style="cursor: pointer;">
						<div class="box">
							<div class="box-content">
								<!--맛집 이름  -->
								<a href="#" style="color: black; text-decoration: none;">
									<h4>
										<span
											style="float: left; margin: 2%;">
											<img width="30px" src="img_1/m_${i.index+1 }.png">	
										</span>
									</h4>
									<h4 class="tag-title text-left">${fvo.p_name }</h4> <br>
								</a>
								<hr style="margin: 2%;">
								<!-- 맛집 이미지 -->
								<div class=rc_img>
									<img src="${fvo.p_img }" style="width: 100%; height: 250px;">
									<br>
									<hr style="margin: 3px;">
								</div>
								<!-- 맛집정보 -->
								<div class="rc_detail">
									<table width=100%>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-map-marker"><b>
															${fvo.p_addr }</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-usd"><b> ${fvo.p_price }</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-time"><b> ${fvo.p_time }</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<h5>
													<span class="glyphicon glyphicon-eye-open"
														style="margin: 2px;">${fvo.p_hit }</span>
													<!--조회수  -->
													<!-- <span class="glyphicon glyphicon-heart"
														style="margin: 2px;">4</span> -->
													<!--찜 수   -->
												</h5>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 카페 리스트 -->
			<div class="row">
				<div style="width: 100%; height: 25px;">
					<h4 style="margin: 0px; float: left">
						<b>▶ 추천</b><b style="color: #DF0101;">카페</b>
					</h4>
				</div>
				<c:forEach var="cvo" items="${ppc_list }" varStatus="i">
					<div class="col-md-4 text-center" onclick="location.href='p_detail.do?p_no=${cvo.p_no}'" style="cursor: pointer;">
						<div class="box">
							<div class="box-content">
								<a href="#" style="color: black; text-decoration: none;">
									<h4>
										<!-- <span class="glyphicon glyphicon-map-marker"
											style="float: left; margin: 2%"></span> -->
										<span
											style="float: left; margin: 2%;">
											<img width="30px" src="img_1/m_${i.index+7 }.png">	
										</span>
									</h4>
									<h4 class="tag-title text-left">${cvo.p_name }</h4> <br>
								</a>
								<hr style="margin: 2%;">
								<img src="${cvo.p_img }" style="width: 100%; height: 250px;">
								<br>
								<hr style="margin: 3px;">
								<!-- 가게정보 -->
								<div class="rc_detail">
									<table class="" width=100%>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-map-marker"><b>
															${cvo.p_addr }</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-usd"><b> ${cvo.p_price }</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-time"><b> ${cvo.p_time }</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<h5>
													<span class="glyphicon glyphicon-eye-open"
														style="margin: 2px;">${cvo.p_hit }</span>
													<!--조회수  -->
													<!-- <span class="glyphicon glyphicon-heart"
														style="margin: 2px;">4</span> -->
													<!--찜 수   -->
												</h5>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>


			<!--놀거리 리스트  -->
			<div class="row">
				<div style="width: 100%; height: 25px;">
					<h4 style="margin: 0px; float: left">
						<b>▶ 추천</b><b style="color: #DF0101;">놀거리</b>
					</h4>
				</div>

				<c:forEach var="pvo" items="${pp_list }" varStatus="i">
					<div class="col-md-4 text-center" onclick="location.href='p_detail.do?p_no=${pvo.p_no}'" style="cursor: pointer;">
						<div class="box">
							<div class="box-content">
								<a href="#" style="color: black; text-decoration: none;">
									<h4>
										<span
											style="float: left; margin: 2%;">
											<img width="30px" src="img_1/m_${i.index+4 }.png">	
										</span>
									</h4>
									<h4 class="tag-title text-left">${pvo.p_name }</h4> <br>
								</a>
								<hr style="margin: 2%;">
								<img src="${pvo.p_img }" style="width: 100%; height: 250px;">
								<br>
								<hr style="margin: 3px;">
								<!-- 가게정보 -->
								<div class="rc_detail">
									<table class="" width=100%>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-map-marker"><b>
															${pvo.p_addr }</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-usd"><b> ${pvo.p_price }</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-time"><b> ${pvo.p_time }</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<h5>
													<span class="glyphicon glyphicon-eye-open"
														style="margin: 2px;">${pvo.p_hit }</span>
													<!--조회수  -->
													<!-- <span class="glyphicon glyphicon-heart"
														style="margin: 2px;">4</span> -->
													<!--찜 수   -->
												</h5>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!--  -->
			
		</div>
	</div>

</body>
</html>
