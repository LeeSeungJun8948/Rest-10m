<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
</head>
	<h1>불량코드관리</h1>
<body>
	<div>
		<form id="searchCheck" name="searchCheck">
			<div class="row">
			<select name="searchCondition" id="searchCondition"
				title="검색조건2-검색어구분" style="width: 80px; height: 26px">
				<option value="id">ID</option>
				<option value="employeeName">이름</option>
			</select> <input id="searchKeyword" name="searchKeyword" type="text"
				title="검색어" class="form-control"
				style="width: 200px; margin-left: 10px">
			</div>	
			<button type="button" class="btn btn-primary" id="btnSearch">조회</button>
			<a id="search" href="empModal.do" rel="modal:open"
				class="btn btn-primary">등록</a>
			<button type="button" class="btn btn-primary" id="btnUpdate">저장</button>
			<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
		</form>
	</div>
	<div id="grid">
		<script type="text/javascript">
			const dataSource = {
				api : {
					readData : {
						url : 'ajax/empList.do',
						method : 'GET'
					},
					deleteData : {
						url : 'ajax/deleteEmp.do',
						method : 'POST'
					},
					updateData : {
						url : 'ajax/updateEmp.do',
						method : 'PUT'
					},
					createData : {
						url : 'ajax/insertEmp.do',
						method : 'POST'
					},
				},
				contentType : 'application/json'
			};

			const grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : dataSource,
				//data : gridData,
				rowHeaders : [ 'checkbox' ],
				scrollX : false,
				scrollY : false,
				columns : [
				/* 					{
				 header : '사원번호',
				 name : 'empCode',
				 editor:'text'
				 },  */
				{
					header : '아이디',
					name : 'id',
/* 					className : 'empId' */
					editor:'text'
				}, {
					header : '사원명',
					name : 'employeeName',
					editor : 'text'
				}, {
					header : '비밀번호',
					name : 'pwd',
					editor : 'text'
				}, {
					header : '직책',
					name : 'auth',
					editor : 'text'
				}, {
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
					editor : {
						type : 'datePicker',
						options : {
							language : 'ko',
							format : 'yyyy-MM-dd'
						}
					}
				}, {
					header : '소속업체',
					name : 'companyCode',
					editor : 'text'
				}, {
					header : '월급',
					name : 'salary',
					editor : 'text',
				 formatter({value}) {
		      			return format(value);
		    		}
				}, {
					header : '생년월일',
					name : 'birthDay',
					editor : {
						type : 'datePicker',
						options : {
							language : 'ko',
							format : 'yyyy-MM-dd'
						}
					}
				} ]
			});
			$.fn.serializeObject = function() {
				var o = {};
				var a = this.serializeArray();
				$.each(a, function() {
					if (o[this.name]) {
						if (!o[this.name].push) {
							o[this.name] = [ o[this.name] ];
						}
						o[this.name].push(this.value || '');
					} else {
						o[this.name] = this.value || '';
					} 
				});
				return o;
			};
		
			
			$("#btnUpdate").on("click", function() {
				grid.request('updateData', {
					checkedOnly : true
				});
			})

			$("#btnDelete").on("click", function() {
				grid.removeCheckedRows(false);
				grid.request('deleteData');
			})

			$("#btnSearch").on("click", function() {
				var param = $('#searchCheck').serializeObject();
				grid.readData(1, param, true);
			})
			//처리하기	
			grid.on('response', function(data) {
				grid.resetOriginData();
			})
			
			function format(value){
				value = value * 1;
				return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			}
		</script>
	</div>
</body>
</html>