<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="flex row">
	<div class="card col-4">
		<table class="table mt-2">
			<thead>
				<tr>
					<th>자재코드</th>
					<th>자재명</th>
					<th>규격</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="mat" items="${ matList}">
					<tr>
						<td>${mat.materialCode}</td>
						<td>${mat.materialName}</td>
						<td>null</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="col-8">
		<form>
			<table>
				<tr>

				</tr>
			</table>
		</form>
	</div>

	<div id="grid">
		<script type="text/javascript">
			var gridData;

			$.ajax({
				type : "get",
				url : "ajax/matForm.do",
				dataType : "json",
				async : false,
				success : function(data) {
					gridData = data;
				},
				error : function() {
				}
			});

			const grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : gridData,
				scrollX : false,
				scrollY : false,
				columns : [ {
					header : '설비코드',
					name : 'facCode'
				}, {
					header : '설비명',
					name : 'facilitiesName'
				}, {
					header : '모델',
					name : 'model'
				}, {
					header : '규격',
					name : 'facSize'
				}, {
					header : '제작업체',
					name : 'productionCompany'
				}, {
					header : '용도',
					name : 'purpose'
				}, {
					header : '용량/규격',
					name : 'volume'
				}, {
					header : '제작일자',
					name : 'productionDate'
				}, {
					header : '사원번호',
					name : 'empNo'
				}, {
					header : '구매금액',
					name : 'price'
				}, {
					header : '정기점검주기',
					name : 'facInspection'
				}, {
					header : '구매일자',
					name : 'purchaseDate'
				}, {
					header : '이미지',
					name : 'img'
				}, {
					header : '공정코드',
					name : 'processCode'
				} ]
			});
		</script>
	</div>

</div>