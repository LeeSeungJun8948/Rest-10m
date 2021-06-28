<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<body>

	<div id="matList" class="col-4"></div>
	<div id="matInfo" class="col-8">
		<div class="col-sm-6" >
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th scope="row"> 자재코드 </th>
						<td> <input name="materialCode" type="text"> </td>
						<th> 자재명 </th>
						<td> <input name="materialName" type="text"> </td>
					</tr>
					
					<tr>
						<th scope="row"> 입고업체 </th>
						<td> <input name="companyCode" type="text"> </td>
						<th> 업체명 </th>
						<td> <input name="companyName" type="text"> </td>
						<th> 관리단위 </th>
						<td> <input name="unitNo" type="text"> </td>
					</tr>
					<tr>
						<th scope="row"> 안전재고 </th>
						<td> <input name="saveStock" type="text"></td>
						<th> MIN재고 </th>
						<td> <input name="minStock" type="text"> </td>
						<th> MAX재고 </th>
						<td> <input name="maxStock" type="text"> </td>
						<th> 1M소요량 </th>
						<td> <input name="monthStock" type="text"> </td>
					</tr>
				</tbody>
			</table>
		</div>
		<form>
			
		</form>
	</div>

	<script type="text/javascript">
	
	
		var listData;
		
		var selectedMaterialCode;

		$.ajax({
			type : "get",
			url : "ajax/matList.do",
			dataType : "json",
			async : false,
			success : function(data) {
				listData = data;
			},
			error : function() {
			}
		});

		const listGrid = new tui.Grid({
			el : document.getElementById('matList'),
			data : listData,
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '자재코드',
				name : 'materialCode',
				width : 80
			}, {
				header : '자재명',
				name : 'materialName'
			}, {
				header : '구분',
				name : 'matNm',
				width : 80
			} ]
		});
		
		$(matList).on('click','tr',function(){
			alert($(this).children().eq(0).children().eq(0).html());
			
			$.ajax({
				
				type : "get",
				url : "ajax/matInfo.do",
				data : {
					'materialCode' : $(this).children().eq(0).children().eq(0).html()
				},
				dataType : "json",
				async : false,
				success : function(data) {
					alert('성공' + data.materialName);
					
					
				},
				error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
		
			
			
		});
		
		

		/**
	
		 */
	</script>


</body>
</html>