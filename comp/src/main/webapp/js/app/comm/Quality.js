const pdataSource = {
	api : {
		readData : {url : 'ajax/getProductList.do', method : 'GET'},
		modifyData : {url: 'ajax/modifyProduct.do', method : 'PUT'},
		deleteData :{url: 'ajax/deleteProduct.do', method:'POST'}
			},
	contentType : 'application/json'
};

const progrid = new tui.Grid({
	el : document.getElementById('proGrid'),
	data : pdataSource,
	rowHeaders: ['checkbox'],
	scrollX : false,
	scrollY : false,
	columns : [ 
				{
					header : '제품코드',
					name : 'productCode',
					editor : 'text'
				}, 
				{
					header : '제품명',
					name : 'productName',
					editor : 'text'
				}, 
				{
					header : '규격',
					name :  'stdId'
					
				},
				{
					header : '규격코드',
					name :  'stdNo'
						
				},
				{
					header : '단위',
					name :  'unitId'
						
				},
				{
					header : '관리단위',
					name :  'unitNo',
						
				},
				{
					header : '사원코드',
					name :  'empCode',
					editor : 'text'
				},
				{
					header : '성적서',
					name :  'qcImg'
				},
				
				{
					header : '사용여부',
					name :  'useAt',
					formatter:'listItemText',
					editor:{
						type:'select',
						options:{
							listItems:[
								{text:'사용',value:'Y'},
								{text:'미사용', value:'N'}
								]
						}
					}
				},

				]
	});
			
	


//클릭시 단건 조회
progrid.on('click', (ev)=>{
	//console.log(progrid.getRow(ev.rowKey).productCode);
	
	var key = progrid.getRow(ev.rowKey).productCode;
	
	var image = progrid.getRow(ev.rowKey).qcImg;
	var use = progrid.getRow(ev.rowKey).useAt;

	$.ajax({
		
		type:"get",
		url : "ajax/getProduct.do",
		data : {
			'productCode' : key
		},
		dataType:"json",
		async : false,
		
		success : function(data){
			//단건 조회시 input value값 가져오기 
			$('#productCode').val(data.data.contents.productCode);
			$('#productName').val(data.data.contents.productName);
			$('#employeeName').val(data.data.contents.empCode);
			$('#stdNo').val(data.data.contents.stdNo);
			$('#stdId').val(data.data.contents.stdId);
			$('#unitNo').val(data.data.contents.unitNo);
			$('#unitId').val(data.data.contents.unitId);
			//단건 조회시 체크박스 체크여부
			if(use == 'Y') {
				$('#useAt').attr("checked", true);
			
			}else if(use == 'N'){
				$('#useAt').attr("checked", false);
			}
		
			if(image != null){
				$("#image").attr("src", "qcfiledown.do?fileName="+image);
				}else{ 
					$("#image").attr("src", "qcfiledown.do?fileName=noimg.png");
				}
			console.log(data.data.contents.useAt);
			console.log(data);
		},
		error : function(){
			alert("실패");
		}
	});
});



// 이미지 미리보기 기능
	function setThumbnail(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = document.getElementById('image');
			img.setAttribute("src", event.target.result);
			document.querySelector("div#imagePreview").appendChild(qcimg);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

//input file 업로드를 버튼으로 업로드 하게 바꾸는 기능
const imgBtn = document.querySelector('#btnQcImg');
const input = document.querySelector('#qcImg');

	imgBtn.addEventListener('click', function(event) {
		input.click();
	});
//수정버튼
$("#btnUdate").on("click", function() {
		event.preventDefault();
    
    	var form = $('#frm')[0]
   		var data = new FormData(form);
	
	$.ajax({
				
			type : "POST",
			enctype: 'multipart/form-data',
			url : "ajax/updateProdcut.do",
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
	});

	
//초기화 버튼
$('#btnNew').on('click',function(){
		var img = document.getElementById('image');
		img.setAttribute("src", '');
		$('input').val('');
})

//그리드 추가/업데이트
$("#btnInsert").on("click", function(){
		//progrid.request('createData');
		progrid.request('modifyData', {
		checkedOnly: true
		});
	});
	
//그리드 리스트 삭제
$("#btnDelete").on("click",function() {
	progrid.removeCheckedRows(false);
	progrid.request('deleteData');
})

//체크박스 체크 >> DB에 insert
function YnCheck(){
	
	if($('#checkUse').is(':checked') == true){
		$('#useAt').val('Y');
	}else{
		$('#useAt').val('N');
		}
}



// 모달

$("#btnProductModal").on("click", function(e) {
    $('#productContent').load("productModal.do");
});

$("#btnUnitModal").on("click", function(e) {	
    $('#unitContent').load("unitModal.do");
});





