<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>

</script>
</head>
<body>
		<h1 class="h3 mb-4 text-gray-700">생산계획 관리</h1>
		<div class="mb-4">
			<button type="button" class="btn btn-primary">조회</button>
			<button type="button" class="btn btn-primary">추가</button>
			<button type="button" class="btn btn-primary" id="btnUpdate">저장</button>
			<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
		</div>
		<div id="grid">
			<script type="text/javascript">

				var gridData;
				
				$.ajax({
					type : "get",
					url : "ajax/empList.do",
					dataType : "json",
					async : false,
					success : function(data) {
						gridData = data;
					},
					error : function() {
					}
				});
				const dataSource = {
						api : {
							readData : {url: 'ajax/empList.do', method:'GET' },
							deleteData : { url: 'ajax/deleteEmp.do', method: 'DELETE' },
							updateData : { url: 'ajax/updateEmp.do', method: 'PUT' }
						},
						contentType: 'application/json'
				};
				
				const grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : dataSource,
					//data : gridData,
				    rowHeaders: ['checkbox'],
					scrollX : false,
					scrollY : false,
					columns : [
					{
						header :'아이디',
						name : 'id'
					}, 
					{
						header :'사원명',
						name : 'employeeName'
					}, 
					{
						header : '사번',
						name : 'empCode'
					}, 
					{
						header : '비밀번호',
						name : 'pwd'	
					}, 
					{
						header : '직책',
						name : 'auth',
						editor : 'text'
					},
					{
						header : '전화번호',
						name : 'phone',
						editor : 'text'
					}, {
						header : '이메일',
						name : 'email',
						editor : 'text'
					}, {
						header : '입사일',
						name : 'hireDate',
						editor : 'text'
					}, {
						header : '소속업체',
						name : 'companyCode',
						editor : 'text'
					}, {
						header : '월급',
						name : 'salary',
						editor : 'text'
					}, {
						header : '생년월일',
						name : 'birthDay',
						editor : 'text'
					}
					]
				});

				
				//update 버튼에 function 추가
				$("#btnUpdate").on("click",function(){
					const { rowKey, columnName } = grid.getFocusedCell();
					  if (rowKey && columnName) {
					    grid.finishEditing(rowKey, columnName);
					  }
					  grid.request('updateData', {
					    checkedOnly: true
					  });
				})
//					grid.request('updateData')
				
				
				//delete 버튼에 function 추가
				$("#btnDelete").on("click",function(){
					grid.request('deleteData')
				})
				
				//처리하기	
				grid.on('response', function(data) {
					grid.resetOriginData();
				}) 			
			</script>
		</div>
</body>
</html>