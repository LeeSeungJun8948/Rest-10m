<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
table, th, td {
	border : 2px solid;
	border-spacing : 0;
	margin: auto;
	padding: 5px;
}
table{
	width: 450px;
}
@media print {
	.page {
		size: 150mm 105mm;
	}
}
</style>
<body onLoad="window.print()">
<div id="content" style="margin: 1px">
	<table>
		<tr>
			<th width="300px" colspan="2">
				<img class="image" src="${pageContext.request.contextPath}/fac/mng/filedown.do?fileName=${barcode }">
			</th>
		</tr>
		<tr>
			<th width="100px">
				<h3>생산코드</h3>
			</th>
			<th>
				<h3>${vo.prorCode }</h3>
			</th>
		</tr>
		<tr>
			<th>
				<h3>제품명</h3>
			</th>
			<th>
				<h3>${vo.productName }</h3>
			</th>
		</tr>
		<tr>
			<th>
				<h3>고객사</h3>
			</th>
			<th>
				<h3>${vo.companyName }</h3>
			</th>
		</tr>
		<tr>
			<th>
				<h3>지시량</h3>
			</th>
			<th>
				<h3>${vo.prorCount }</h3>
			</th>
		</tr>
	</table>
	</div>
</body>
<script>
var inbody = document.body.innerHTML; // 이전 body 영역 저장
window.onbeforeprint = function(){ // 프린트 화면 호출 전 발생하는 이벤트
    document.body.innerHTML = document.getElementById('content').innerHTML; // 원하는 영역 지정
}

window.onafterprint = function(){ // 프린트 출력 후 발생하는 이벤트
    document.body.innerHTML = inbody; // 이전 body 영역으로 복구
}



</script>