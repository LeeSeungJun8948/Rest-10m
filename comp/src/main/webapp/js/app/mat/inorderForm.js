
	
var listData; // list그리드에 넣을 데이터

$('[readonly]').css('background-color','#EAEAEA');


$( document ).ready(function() {	
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
   	showInorderList();
});

function showInorderList(){
	
	var listData;
	
	$.ajax({
		type : "get",
		url : "ajax/inorderList.do",
		data : $('#frm').serialize(),
		dataType : "json",
		async : false,
		success : function(data) {
			listData = data;
		},
		error : function(request, status, error) {
			// alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	
	
	// listGrid 생성
	const listGrid = new tui.Grid({
		el : document.getElementById('inorderList'),
		data : listData,
		scrollX : true,
		scrollY : true,
		bodyHeight: 360,
		columns : [ {
			header : '발주번호',
			name : 'inorderCode',
			width : 80,
			align: 'center'
		}, {
			header : '발주일자',
			name : 'inorderDate',
			width : 120,
			align: 'center'
		}, {
			header : '자재코드',
			name : 'materialCode',
			width : 80,
			align: 'center'
		}, {
			header : '자재명',
			name : 'materialName',
			width : 120,
			align: 'left'
		}, {
			header : '발주업체',
			name : 'companyName',
			width : 120,
			align: 'center'
		}, {
			header : '입고일자',
			name : 'inDate',
			width : 120,
			align: 'center'
		}, {
			header : '발주량',
			name : 'inorderCount',
			width : 120,
			align: 'right'
		}, {
			header : '입고량',
			name : 'inCount',
			width : 120,
			align: 'right'
		}, {
			header : '미입고량',
			name : 'yetCount',
			width : 120,
			align: 'right'
		}, {
			header : '비고',
			name : 'comments',
			width : 120,
			align: 'right'
		} ]
		/**
		,
		summary: {
			height: 40,
		   		position: 'bottom',
		   		columnContent: {
	        	inDate: {
	        		align : 'center',
	                template(summary) {
	        			return '합 계';
	                } 
	            },	
				inorderCount: {
	        		align : 'center',
	                template(summary) {
						var summaryResult = (summary.sum)/2;
	        			return format(summaryResult);
	                } 
	            },
				inCount: {
	        		align : 'center',
	                template(summary) {
	        			var summaryResult = (summary.sum)/2;
	        			return format(summaryResult);
	                } 
	            },
				yetCount: {
	        		align : 'center',
	                template(summary) {
	        			var summaryResult = (summary.sum)/2;
	        			return format(summaryResult);
	                } 
	            }
			}
		} */
	});
	
	function format(value){
		 return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

}
// listData 가져오기
