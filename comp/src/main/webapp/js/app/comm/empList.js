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
	rowHeaders : [ 'checkbox' ],
	scrollX : false,
	scrollY : false,
	columns : [ {
		header : '아이디',
		name : 'id',
		}, {
		header : '사원명',
		name : 'employeeName',
		}, {
		header : '직책',
		name : 'auth',
		}, {
		header : '전화번호',
		name : 'phone',
		}, {
		header : '이메일',
		name : 'email',
		}, {
		header : '입사일',
		name : 'hireDate',
		}, {
		header : '소속업체',
		name : 'companyCode',
		}, {
		header : '월급',
		name : 'salary',
		 formatter({value}) {
   			return format(value);
	   		}
		}, {
		header : '생년월일',
		name : 'birthDay',
		},  {
		header : '부서코드',
		name : 'dept',
		hidden: true
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
		
// 모달
$("#btnEmpModal").on("click", function() {
	$('#empCode').val("");
	$('#id').val("");
	$('#employeeName').val("");
	$('#auth').val("");
	$('#phone').val("");
	$('#email').val("");
	$('#hireDate').val("");
	$('#companyCode').val("");
	$('#salary').val("");
	$('#birthDay').val("");
	$('#dept').val("");
	$('#pwd').val("");
	
	$('#empModal').modal();
});

// 더블클릭 모달
grid.on('dblclick', (ev) => {
	var id = grid.getValue(ev.rowKey, 'id');
	var employeeName = grid.getValue(ev.rowKey, 'employeeName');
	var auth = grid.getValue(ev.rowKey, 'auth');
	var phone = grid.getValue(ev.rowKey, 'phone');
	var email = grid.getValue(ev.rowKey, 'email');
	var hireDate = grid.getValue(ev.rowKey, 'hireDate');
	var companyCode = grid.getValue(ev.rowKey, 'companyCode');
	var salary = grid.getValue(ev.rowKey, 'salary');
	var birthDay = grid.getValue(ev.rowKey, 'birthDay');
	var dept = grid.getValue(ev.rowKey, 'dept');
	var empCode = grid.getValue(ev.rowKey, 'empCode');
	
	$('#empCode').val(empCode);
	$('#id').val(id);
	$('#employeeName').val(employeeName);
	$('#auth').val(auth);
	$('#phone').val(phone);
	$('#email').val(email);
	$('#hireDate').val(hireDate);
	$('#companyCode').val(companyCode);
	$('#salary').val(salary);
	$('#birthDay').val(birthDay);
	$('#dept').val(dept);
	$('#pwd').val("");
	
	$('#empModal').modal();
});

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

function fnSearch(){
	if(confirm("저장하시겠습니까?")) { 			
		$("#frm").submit();
		toastr.success("저장되었습니다.");
	}
}