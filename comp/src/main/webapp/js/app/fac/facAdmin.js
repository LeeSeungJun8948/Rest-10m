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
 		 } );
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
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#imagePreview").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

	/* var gridData;
	
	$.ajax({
		type : "get",
		url : "ajax/facList.do",
		dataType : "json",
		async : false,
		success : function(data) {
			gridData = data;
		},
		error : function() {
		}  
	}); */
	
	
	// 탭1 gird 설비 관리 목록
	const dataSource = {
		api : {
			readData : {
				url : 'ajax/facList.do',
				method : 'GET'
			},
			deleteData : {
				url : 'ajax/deleteFac.do',
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
		
	// grid에서 선택한 자재 정보 가져오기
	grid.on('click', (ev) => {
		//console.log(grid.getRow(ev.rowKey).facCode);
		var key = grid.getRow(ev.rowKey).facCode;
		console.log(key);
		
		$.ajax({
				
				type : "get",
				url : "ajax/facInfo.do",
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
					$('#price').val(data.price);
					$('#facInspection').val(data.facInspection);
					$('#purchaseDate').val(data.purchaseDate);
					$('#image').val(data.img);
					$('#processCode').val(data.processCode);
				},
				error : function() {
				}
			});
	});
            
	// 탭2 grid 설비 공정 목록
	const dataSource2 = {
		api : {
			readData : {
				url : 'ajax/facProcessList.do',
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
	$("#btnUdate").on("click", function() {
	
	$.ajax({
				
			type : "get",
			url : "ajax/updateFac.do",
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