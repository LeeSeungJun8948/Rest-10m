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
			

$("#RowInsert").on("click", function(){
				progrid.appendRow();
			});
			

var stdRowkey;
var snoRowkey;
var uiRowkey;
var unRowkey;
// 규격 /규격코드 가져오기 -모달
progrid.on('click', (ev) => {
	stdRowkey= ev.rowKey;
	snoRowkey= ev.rowKey;
	uiRowkey = ev.rowKey;
	unRowkey = ev.rowkey;
	if(ev.columnName =='stdId' || ev.columnName =='stdNo'){
		var href="productModal.do";
		window.event.preventDefault();
		$('.jquery-modal').remove();
		$('.modal').remove();
		this.blur();
		$.get(href, function(html){
			var modalOpen = $(html).appendTo('body').modal();
			});
		} else if(ev.columnName == 'unitId' || ev.columnName == 'unitNo'){
			var href="unitModal.do";
			window.event.preventDefault();
			$('.jquery-modal').remove();
			$('.modal').remove();
			this.blur();
			$.get(href, function(html){
				var modalOpen = $(html).appendTo('body').modal();
			});
		}
	});
	
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
			$('#productCode').val(data.productCode);
			$('#productName').val(data.productName);
			$('#employeeName').val(data.employeeName);
			$('#stdId').val(data.stdId);
			$('#unitNo').val(data.unitNo);
			$('#useAt').val(data.useAt);
			alert();
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
	
//초기화 버튼
$('#btnNew').on('click',function(){
		var img = document.getElementById('image');
		img.setAttribute("src", '');
		$('input').val('');
})

// 모달
var forGrid = false;

$("#btnProductModal").on("click", function(e) {
    $('#productContent').load("productModal.do");
});

$(document).on('show.bs.modal','#btnProductModal', function (){});

$('#stdId').on('click',function(){
	$('#productModal').modal('show');
	$('#productContent').load("productModal.do");
	
})