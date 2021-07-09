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
					name :  'qcImg',
					editor : 'text'
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
	console.log(progrid.getRow(ev.rowKey).productCode);
	
	var key = progrid.getRow(ev.rowKey).productCode;
	

	$.ajax({
		
		type:"get",
		url : "ajax/getProduct.do",
		data : {
			'productCode' : key
		},
		dataType:"json",
		async : false,
		
		success : function(data){
			$('#productCode').val(data.data.contents.productCode);
			$('#productName').val(data.data.contents.productName);
			$('#employeeName').val(data.data.contents.empCode);
			$('#stdNo').val(data.data.contents.stdNo);
			$('#stdId').val(data.data.contents.stdId);
			$('#unitNo').val(data.data.contents.unitNo);
			$('#unitId').val(data.data.contents.unitId);
			$('#useAt').val(data.data.contents.useAt);
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
			document.querySelector("div#imagePreview").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

//input file 업로드를 버튼으로 업로드 하게 바꾸는 기능
const imgBtn = document.querySelector('#btnQcImg');
const input = document.querySelector('#qcImg');

	imgBtn.addEventListener('click', function(event) {
		input.click();
	});

	
//초기화 버튼
$('#btnNew').on('click',function(){
		var img = document.getElementById('image');
		img.setAttribute("src", '');
		$('input').val('');
})


$("#btnInsert").on("click", function(){
		//progrid.request('createData');
		progrid.request('modifyData', {
		checkedOnly: true
		});
	});
$("#btnDelete").on("click",function() {
	progrid.removeCheckedRows(false);
	progrid.request('deleteData');
})





// 모달

$("#btnProductModal").on("click", function(e) {
    $('#productContent').load("productModal.do");
});

$("#btnUnitModal").on("click", function(e) {
    $('#unitContent').load("unitModal.do");
});





