<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#prodMonitor *{
	color: #000000;
}
tbody {
	border : 2px solid;
	border-spacing : 0;
	font-size: 24px;
	padding: 5px;
}

tbody *, thead > tr{
	border : 2px solid;
	border-spacing : 0;
	text-align: center;
	padding: 5px;
}

thead th{
	border : 2px solid;
	border-spacing : 0;
	text-align: center;
	padding: 10px;
	font-size: 24px;
}

.number{
	text-align: right;
}

</style>
<div class="row" id="prodMonitor">
	<table class="col-10" align="center">
		<thead>
			<tr class="mb-4">
				<td colspan="3" style="background-color: #0054FF; ">
					<div>
						<h2 style=" margin: 5%;"> <b style="color: #ffffff;"> 진행 공정 작업실적 현황 </b> </h2>
					</div>
				</td>
				<td colspan="4" style="background-color: #0054FF; ">
					<div class="col-12" align="right">
						<b><span id="date" style="font-size: 24px; color: #ffffff;"> </span> : <span style="font-size: 24px; color: #ffffff;" id="time"></span></b>
						<button class="btn" id="btnRefresh"><img alt="btn_refresh" src="<c:url value='/images/app/all/btn_refresh.png'/>"></button>
					</div> 
				</td>
			</tr>
			<tr style="background-color: #FFE400;">
				<th>
					설 비 명
				</th>
				<th>
					공 정 명
				</th>
				<th>
					제 품 명
				</th>
				<th>
					금일계획
				</th>
				<th>
					현재실적
				</th>
				<th>
					현재불량
				</th>
				<th>
					실적율
				</th>
			</tr>
		</thead>
		
		<tbody id="data">
		
		</tbody>
			
	</table>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/mat/prodMonitoring.js"></script>