<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>Google Nexus Website Menu</title>
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.min.css" />
	<style>
		.container{
			z-index:2;
		}
		.gn-menu-main{
			z-index:10;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		
		<div class="container" style="margin-top:100px; padding:10px">
			<div class="row">
				<form:form action="usr_rsv_edit.do" method="post" modelAttribute="vo">
					<div class="col-md-6" style="padding:20px">
						<div id="carousel" class="carousel slide" data-ride="carousel" data-interval="3000" style="margin-bottom:20px">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#carousel" data-slide-to="0" class="active"></li>
								<li data-target="#carousel" data-slide-to="1"></li>
								<li data-target="#carousel" data-slide-to="2"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" id="back_imgs">
								<div class="item active">
									<img src="get_blob_img.do?idx=1" style="width: 100%; height: 350px"/>
								</div>
								<c:forEach var="i" begin="2" end="${cnt}">
									<div class="item">
										<img src="get_blob_img.do?idx=${i}" style="width: 100%; height: 350px"/>
									</div>
								</c:forEach>
							</div>
							
							<!-- Controls -->
							<div id="mouseup">
								<a class="left carousel-control" href="#carousel" role="button" data-slide="prev"> 
									<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								</a> 
								<a class="right carousel-control" href="#carousel" role="button" data-slide="next"> 
									<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								</a>
							</div>
						</div>
						
						<div id="select" style="margin-bottom:20px">
							<h3>예약 정보</h3>
							<hr />
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">날짜</label>
								<form:input type="text" class="form-control" path="rsv_day" value="${vo.rsv_day}"/>
							</div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">시간</label>
								<form:select class="form-control" path="rsv_time" value="${vo.rsv_time}">
									<option>1</option>
								</form:select>
							</div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">인원</label>
								<form:select class="form-control" path="rsv_personnel" value="${vo.rsv_personnel}">
									<option>1</option>
									<option>2</option>
								</form:select>
							</div>
						</div>
						
						<div id="menu" style="margin-bottom:20px">
							<h3>메뉴선택</h3>
							<hr />
							<div id="menu_detail" class="form-inline" style="margin-bottom:10px">
								<div>
									<c:forEach var="vo1" items="${mlist}" varStatus="i">
										<div class="form-inline">
											<label style="width:100px">${vo1.mn_name}</label>
											<label id="price_${i.index}">${vo1.mn_price}</label>
											<input type="button" class="btn btn-default menu_m" value="-" />
											<input type="text" class="form-control menu_cnt" style="width:50px; text-align:right" value="0" />
											<input type="button" class="btn btn-default menu_p" value="+" />
											<label id="sum_${i.index}" class="sum"></label>
										</div>
									</c:forEach>
								</div>
								<hr />
								<div style="text-align:right"class="form-inline">
									<label>합계</label>
									<label id="total">0원</label>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-6" style="padding:20px">
						<div id="map" style="width:100%;height:350px;margin-bottom:20px"></div>
						
						<div id="info" style="margin-bottom:20px">
							<h3>예약자 정보</h3>
							<hr />
							<div>
								<div class="form-inline" style="margin-bottom:10px">
									<label style="width:100px">이름</label>
									<form:input type="text" class="form-control" path="rsv_sub_name" id="" value="${vo.rsv_sub_name}"/>
								</div>
								<div class="form-inline" style="margin-bottom:10px">
									<label style="width:100px">전화번호</label>
									<form:input type="text" class="form-control" path="rsv_sub_tel" id="" value="${vo.rsv_sub_tel}"/>
								</div>
								<div class="form-inline" style="margin-bottom:10px">
									<label style="width:100px">이메일주소</label>
									<form:input type="text" class="form-control" path="rsv_sub_email" id="" value="${vo.rsv_sub_email}"/>
								</div>
								<div class="form-inline" style="margin-bottom:10px">
									<label style="width:100px">요청사항</label>
									<form:textarea class="form-control" rows="2" path="rsv_sub_request" style="resize:none" value="${vo.rsv_sub_request}"></form:textarea>
								</div>
							</div>
						</div>
						
						<div id="stroe_info" style="margin-bottom:20px">
							<h3>판매자 정보</h3>
							<hr />
							<div>
								<div class="form-inline" style="margin-bottom:10px">
									<label style="width:100px">상호</label>
									${vo.str_name}
								</div>
								<div class="form-inline" style="margin-bottom:10px">
									<label style="width:100px">대표자명</label>
									<input type="text" class="form-control" name="" id="" />
								</div>
								<div class="form-inline" style="margin-bottom:10px">
									<label style="width:100px">소재지</label>
									${vo.str_address}
								</div>
								<div class="form-inline" style="margin-bottom:10px">
									<label style="width:100px">연락처</label>
									${vo.str_tel}
								</div>
							</div>
						</div>
						
						<div style="margin-bottom:10px">
							<input type="submit" class="btn btn-success" value="예약변경"	/>
							<a href="usr_rsv_content.do?rsv_no=${vo.rsv_no}" class="btn btn-info">취소</a>
						</div>
						
					</div>
				</form:form>
			</div>
		</div>
		
		<jsp:include page="v1_footer.jsp"></jsp:include>
	
	</div>
	
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/datepicker-ko.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
	<script>
		$(function() {
			$("#date1").datepicker();
			
			var mapContainer = document.getElementById('map'),
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667),
		        level: 3
		    };  
	
			var map = new daum.maps.Map(mapContainer, mapOption); 
			var geocoder = new daum.maps.services.Geocoder();
			
			geocoder.addressSearch('${vo.str_address}', function(result, status) {
			
			     if (status === daum.maps.services.Status.OK) {
			
			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        var infowindow = new daum.maps.InfoWindow({
			            content: '<div style="text-align:center;padding:6px 0;">${vo.str_name}</div>'
			        });
			        infowindow.open(map, marker);
			
			        map.setCenter(coords);
			    } 
			});
			
			$('.menu_p').click(function(){
				var idx = $(this).index('.menu_p');
				var cnt = $(this).prev().val();
				cnt++;
				$(this).prev().val(cnt);
				
				var price = $('#price_'+idx).text();
				var sum = cnt * price;
				
				$('#sum_'+idx).text(sum);
			
				var len = $('.sum').length;
				var tot = 0;								
				for(var i=0; i<len; i++){
					tot += Number($('#sum_'+i).text());
				}

				$('#total').text(tot+'원');
			});
			
			$('.menu_m').click(function(){
				var idx = $(this).index('.menu_m');
				var cnt = $(this).next().val();
				cnt--;
				if(cnt<=0){
					cnt =0;
				}
				$(this).next().val(cnt);
				
				var price = $('#price_'+idx).text();
				var sum = cnt * price;
				console.log(sum);
				
				$('#sum_'+idx).text(sum);
				
				var len = $('.sum').length;
				var tot = 0;								
				for(var i=0; i<len; i++){
					tot += Number($('#sum_'+i).text());
				}

				$('#total').text(tot+'원');
				
			});
		});
	</script>

</body>
</html>