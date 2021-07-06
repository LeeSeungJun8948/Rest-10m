<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>
function test() {
	var check=document.frm.facCode.value;
	if(!check) {
		alert("설비코드 필수입력");
		document.frm.facCode.focus();
		return false;
	} else return true;
}
</script>
	<h1 class="h3 mb-4 text-gray-700">설비 수리내역 관리</h1>
	<form action="insertRep.do" method="post" id="frm" name="frm" onsubmit="return test()">
		<div class="mb-4">
			<input type="submit" class="btn btn-primary" value="저장">
			<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
			<button type="button" class="btn btn-primary" id="btnUpdate">수정</button>
			<button type="reset" class="btn btn-primary">새입력</button>
		</div>
		<div class="row">  
			<div class="mb-4 col-lg-8">
				<table class="table">
					<tbody>
						<tr>
							<th>수리코드</th>
							<td><input type="text" id="repairCode" name="repairCode"
							style="background-color: #e2e2e2;" readonly></td>
							<th>설비코드</th>
							<td><input type="text" id="facCode" name="facCode"></td>
							<th>수리일자</th>
							<td><input type="date" id="repairDate" name="repairDate"></td>
						</tr>
						<tr>
							<th>수리내역</th>
							<td><input type="text" id="repairComment" name="repairComment"></td>
							<th>업체코드</th>
							<td><input type="text" id="companyCode" name="companyCode"></td>
							<th>수리금액</th>
							<td><input type="text" id="cost" name="cost"></td>
						</tr>
						<tr>
							<th>비고</th>
							<td><input type="text" id="etc" name="etc"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	<div id="grid"></div>
		<script type="text/javascript">
			const dataSource = {
					api : { 
						readData : {url: 'ajax/repList.do', method:'GET'},
						deleteData : {url: 'ajax/deleteRep.do', method:'POST'}
					},
					contentType: 'application/json'
			}

			const grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : dataSource,
				rowHeaders: ['checkbox'],
				scrollX : false,
				scrollY : false,
				columns : [{
					header : '수리코드',
					name : 'repairCode'
				},
					{
					header : '설비코드',
					name : 'facCode'
				}, {
					header : '수리일자',
					name : 'repairDate'
				}, {
					header : '수리내역',
					name : 'repairComment'
				}, {
					header : '업체코드',
					name : 'companyCode'
				}, {
					header : '수리금액',
					name : 'cost'
				}, {
					header : '비고',
					name : 'etc'
				} ]
			});
			
		//삭제버튼	
			$("#btnDelete").on("click",function() {
				grid.removeCheckedRows(false);
				grid.request('deleteData');
		})
		
		// input 데이터 불러오기
		grid.on('click', function(ev) {
			var key=grid.getRow(ev.rowKey).repairCode;
			console.log(key);
			$.ajax({
				type : "get",
				url : "ajax/repInfo.do",
				data : {
					'repairCode' : key
				},
				dataType : "json",
				async : false,
				success : function(data) {
					$('#repairCode').val(data.repairCode);
					$('#facCode').val(data.facCode);
					$('#repairDate').val(data.repairDate);
					$('#repairComment').val(data.repairComment);
					$('#companyCode').val(data.companyCode);
					$('#cost').val(data.cost);
					$('#etc').val(data.etc);
						
				},
				error : function(){
					
				}
				
			});
		});
		
		// 수정
		$('#btnUpdate').on('click',function(){
			
			$.ajax({
				
				type : "get",
				url : "ajax/updateRep.do",
				data : $('#frm').serialize(),
				dataType : "json",
				async : false,
				success : function(data) {
					if(data == 1)
						alert('수정 완료');
					else
						alert('수정 실패');
				},
				error : function(request, status, error) {
				}
			});
		});
		</script>