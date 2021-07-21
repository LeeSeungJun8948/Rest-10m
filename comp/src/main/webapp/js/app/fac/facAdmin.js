console.log(contextPath);
function test() {
	if(!checkNull($('#facilitiesName').val())) {
			toastr.warning('설비명을 입력해주십시오.');
			return false;
		} else if(!checkNull($('#empNo').val())) {
			toastr.warning('사원을 입력해주십시오.');
			return false;
		} else if(!checkNull($('#processCode').val())) {
			toastr.warning('공정을 입력해주십시오.');
			return false; 
		} else if(!checkNull($('#facInspection').val())) {
			toastr.warning('점검주기를 입력해주십시오.');
			return false; 
		}
			return true; 
	}	
   
// 탭 기능
$( function() {
    $( "#tabs" ).tabs({ activate: function( event, ui ) {
		console.log()
		var tabId = $(ui.newPanel).attr("id");
		if(tabId == 'tabs-1'){
			grid.refreshLayout();
		} else if(tabId == 'tabs-2'){		
			grid2.refreshLayout();
		}
	}});
 		 });

	//input file 업로드를 버튼으로 업로드 하게 바꾸는 기능
	const imgBtn = document.querySelector('#btnImg');
	const input = document.querySelector('#img');

	imgBtn.addEventListener('click', function(event) {
		input.click();
	});

	// 이미지 미리보기 기능
	function setThumbnail(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = document.getElementById('image');
			img.setAttribute("src", event.target.result);
			document.querySelector("div#imagePreview").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

	// 탭1 gird 설비 관리 목록
	const dataSource = {
		api : {
			readData : {
				url : contextPath + '/ajax/facList2.do',
				method : 'GET'
			},
			deleteData : {
				url : contextPath + '/ajax/deleteFac.do',
				method : 'POST'
			}
		},
		contentType : 'application/json'
	}
	
	const grid = new tui.Grid({
		el : document.getElementById('grid'),
		data : dataSource,
		rowHeaders : [ 'checkbox' ],
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
			header : '사원명',
			name : 'employeeName'
		}, {
			header : '구매금액',
			name : 'price'
		}, {
			header : '정기점검주기',
			name : 'facInspection'
		}, {
			header : '구매일자',
			name : 'purchaseDate'
		}]
		
	});
		
	// grid에서 선택한 자재 정보 가져오기
	grid.on('click', (ev) => {
		//console.log(grid.getRow(ev.rowKey).facCode);
		var key = grid.getRow(ev.rowKey).facCode;
		// console.log(key);
		var image = grid.getRow(ev.rowKey).img;
		// console.log(image);
		
		$.ajax({
				
				type : "get",
				url : contextPath + "/ajax/facInfo.do",
				data : {
					'facCode' : key
				},
				dataType : "json",
				async : false,
				success : function(data) {
					$('#facCode').val(data.facCode);
					$('#facilitiesName').val(data.facilitiesName);
					$('#model').val(data.model)
					$('#facSize').val(data.facSize);
					$('#productionCompany').val(data.productionCompany);
					$('#purpose').val(data.purpose)
					$('#volume').val(data.volume);
					$('#productionDate').val(data.productionDate);
					$('#empNo').val(data.empNo);
					$('#employeeName').val(data.employeeName);
					$('#price').val(data.price);
					$('#facInspection').val(data.facInspection);
					$('#purchaseDate').val(data.purchaseDate);
					if(image != null){
					$("#image").attr("src", "filedown.do?fileName="+image);
					}
					else{ 
					$("#image").attr("src", "filedown.do?fileName=noimg.png");
					}
					$('#processCode').val(data.processCode);
					$('#processName').val(data.processName);
				},

				error : function() {
				}
			});
		});
            
	// 탭2 grid 설비 공정 목록
	const dataSource2 = {
		api : {
			readData : {
				url : contextPath + '/ajax/facProcessList.do',
				method : 'GET'
			}
		},
		contentType : 'application/json'
	}

	const grid2 = new tui.Grid({
		el : document.getElementById('grid2'),
		data : dataSource2,
		scrollX : false,
		scrollY : false,
		columns : [ {
			header : '설비코드',
			name : 'facCode'
		}, {
			header : '설비명',
			name : 'facilitiesName'
		},  {
			header : '공정코드',
			name : 'processCode'
		}, {
			header : '공정이름',
			name : 'processName'	
		}]
	});

		


	// 삭제버튼
	$("#btnDelete").on("click", function() {
		grid.removeCheckedRows(false);
		grid.request('deleteData');
	});

	
	// 수정버튼
	/*$("#btnUdate").on("click", function() {
		event.preventDefault();
    
    	var form = $('#frm')[0]
   		var data = new FormData(form);
	$.ajax({
				
			type : "POST",
			enctype: 'multipart/form-data',
			url : "ajax/updateFac.do",
			data : data,
			dataType : "json",
			processData: false,
     	   	contentType: false,
       		cache: false,
			async : false,
			success : function(data) {
				if(data == 1){
					alert('수정 완료');
					grid.readData(1, null, true);
				}
					
				else
					alert('수정 실패');
			},
			error : function(request, status, error) {
			}
		});	
	});*/
	
	$('#btnNew').on('click',function(){
		var img = document.getElementById('image');
		img.setAttribute("src", '');
		$('input').val('');
	})
	
function checkNull(value){
		return (value != null && value != '' && value != '[object HTMLInputElement]') || value === 0 || value === '0';
	}; 
	
function numberWithCommas(x) {
  x = x.replace(/[^0-9]/g,'');   
  x = x.replace(/,/g,'');        
  $("#price").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ","));  
}


var forGrid = false;

$('#btnProcModal').on('click',function(e){
	$('#processCode').val('');
	$('#processName').val('');
	$('#procContent').load(contextPath + "/modal/procModal.do");
});

$('#btnEmpModal').on('click',function(e){
	$('#employeeName').val('');
	$('#empCode').val('');
	$('#empContent').load(contextPath + "/modal/empListModal.do");
});

	