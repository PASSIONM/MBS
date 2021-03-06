<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<jsp:include page="header.jsp"></jsp:include>

<div class="row"
	style="margin-top: 68px; border-bottom: 1px solid #cccccc; width: 100%">

	<div class="col-md-9"
		style="border-right: 1px solid #cccccc; padding: 10px">
		<div class="container w3-round" id="imgcon"
			style="border: 1px solid #cccccc; width: 100%; height: 300px;white-space:nowrap;overflow-x:auto;overflow-y:hidden">
			<h3>현재 예약중인 항목</h3>
				<c:if test="${empty rlist}">
				<div style="margin-top:80px">
					<h1  style="margin-left:100px">예약중인 항목이 존재하지 않습니다.</h1>
					</div>
				</c:if>
				<c:if test="${!empty rlist}">
				<c:forEach items="${rlist}" var="rvo"	>
						<div class="w3-white w3-round-xlarge"
							style="padding: 10px; width: 200px; height: 220px; border: 1px solid #cccccc; margin-right:20px;display:inline-block">
							<div style="width: 100%; height: 140px; border: 1px solid #cccccc">
							<a href="user_content.do" id="img">
							<img src="getBlobImg.do?no=${rvo.str_number}" style="width:100%;height:100%"/>
							</a>
							</div>
							<p align="center">${rvo.str_name}</p>
							 <p align="center"><font>${rvo.rsv_day}</font><font color="blue" style="margin-left:20px">${rvo.rsv_personnel}명 </font></p>
					</div>
				</c:forEach>
				</c:if>
			</div>
		<div class="container" style="padding:10px">
		<h3 style="margin-left:20px">문의 내역</h3>
		<c:if test="${empty qlist}">
				<div style="margin-top:80px">
					<h1 style="margin-left:100px">내가 문의한 항목이 존재하지 않습니다</h1>
					<div style="margin-top:50px">
					<a href="question.do" style="margin-left:350px"><button class="btn btn-default">문의하러 가기</button></a>
					</div>
					</div>
				</c:if>
		<c:if test="${!empty qlist}">
		<c:forEach items="${qlist}" var="qvo">
		<div class="form-inline" style="padding:20px;height:80px;margin:0px 30px">
			<div class="form-group" style="width:70%">
			<div class="w3-row">
				<div class="w3-col" style="width:60%">
					<p style="color:red;float:left;width:70px" class="openval">${qvo.qst_open}</p>
					<p><b><a href="user_question" style="color:black">${qvo.qst_title}</a></b>
					<font color="gray" style="font-size:10px;">[문의번호:${qvo.qst_no}]</font></p>
				</div>
				<div class="w3-rest" align="right" style="vertical-align:bottom"><p style="font-size:12px;color:gray">${qvo.qst_date}<p></div>
				</div>
				<p>${qvo.qst_content}</p>
			</div>
		</div>
		<div style="width:70%; height:5px; margin:5px 30px; border-bottom:1px solid #aaaaaa"></div>
		</c:forEach>
		<div style="width:70%;margin-top:50px" align="right">
			<a href="user_question.do"><button class="btn btn-default">문의내역 모두보기</button></a>
		</div>
		</c:if>
		</div>
		
	</div>
	<div class="col-md-3" style="padding: 10px">
		<div class="w3-border w3-round-xlarge" style="width:100%;border:1px solid #cccccc;padding:10px;height:300px;" align="center">
			<div style="margin-top:15px">
				<h4><b>사용자 정보 </b></h4>
				<div style="width:90%; height:5px; margin-bottom:5px; border-bottom:1px solid #aaaaaa"></div>
				<p>${mvo.mb_id}</p>
				<div style="width:90%; height:5px; margin-bottom:5px; border-bottom:1px solid #aaaaaa"></div>
				<p id="mbbir">${mvo.mb_birth}</p>
				<div style="width:90%; height:5px; margin-bottom:5px; border-bottom:1px solid #aaaaaa"></div>
				<p id="mbtel">${mvo.mb_tel}</p>
				<div style="width:90%; height:5px; margin-bottom:5px; border-bottom:1px solid #aaaaaa"></div>
				<p>${mvo.mb_email}</p>
				<div style="width:90%; height:5px; margin-bottom:5px; border-bottom:1px solid #aaaaaa"></div>
				<div align="center"  style="margin-top:20px" >
					<a href="user_edit.do"><button class="w3-button w3-small w3-border w3-white w3-round">회원정보 수정</button></a>
					<a href="user_changepw.do"><button class="w3-button w3-small w3-border w3-white w3-round">비밀번호 변경</button></a>
				</div>
			</div>
		</div>
		<div align="center" style="padding:30px; margin-top:50px">
			<div class="row" style="margin:0px auto">
		<table class="w3-table" style="margin:25px 0px;height:200px">
			<tr style="border-bottom:1px solid #cccccc; width:200px;height:30px">
				<th>공지</th>
				<th style="width:40px"></th>
				<th style="width:30px" align="right"><a href="notice.do">+</a></th>
			</tr>
			<c:forEach var="nvo" items="${nlist}">
				<tr>
					<td><a href="#">${nvo.ntc_title}</a></td>
					<td colspan="2" align="right"><font color="gray" style="font-size:10px">${nvo.ntc_date}</font></td>
				</tr>
			</c:forEach>
		</table>
		<table class="w3-table" style="margin:25px 0px;height:200px">
			<tr style="border-bottom:1px solid #cccccc; width:200px;height:30px">
				<th>진행중인 이벤트</th>
				<th style="width:60px"></th>
				<th style="width:30px" align="right"><a href="event.do">+</a></th>
			</tr>
			<c:forEach var="evo" items="${elist}">
				<tr>
					<td><a href="#">${evo.evt_title}</a></td>
					<td colspan="2" align="right">
						<font color="gray" style="font-size:10px">${evo.evt_endtime}까지</font>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		
		
		
		var len = $('.openval').length;
		for(var i=0;i<len;i++){
		if($('.openval').eq(i).text() == 0){
			$('.openval').eq(i).css("color","red");
			$('.openval').eq(i).text("[열람안함]");
		}
		else if($('.openval').eq(i).text() == 1){
			$('.openval').eq(i).css("color","green");
			$('.openval').eq(i).text("[문의완료]");
		}
		}
		var mb_bir = $('#mbbir').text();
		var biry = mb_bir.substring(0,4);
		var birm = mb_bir.substring(5,7);
		var bird = mb_bir.substring(8,10);
		
		$('#mbbir').text(biry+"년 "+birm+"월 "+bird+"일");
		var mb_tel = $('#mbtel').text();
		console.log(mb_tel)	
		if(mb_tel.length == 10){
			var tel1 = mb_tel.substring(0,3);
			var tel2 = mb_tel.substring(3,6);
			var tel3 = mb_tel.substring(6,10);
			$('#mbtel').text(tel1+'-'+tel2+'-'+tel3);
		}
		if(mb_tel.length == 11){
			var tel1 = mb_tel.substring(0,3);
			var tel2 = mb_tel.substring(3,7);
			var tel3 = mb_tel.substring(7,11);
			$('#mbtel').text(tel1+'-'+tel2+'-'+tel3);
		}
		
	});
</script>
<jsp:include page="footer.jsp"></jsp:include>