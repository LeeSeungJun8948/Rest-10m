const pdataSource = {
	api : {
		readData : {url : contextPath + '/ajax/getProductList.do', method : 'GET'},
		deleteData :{url:  contextPath + '/ajax/deleteProduct.do', method:'POST'}
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
					editor : 'text',
					align: 'center'
				}, 
				{
					header : '제품명',
					name : 'productName',
					editor : 'text',
					align: 'center'
				}, 
				{
					header : '규격',
					name :  'stdId',
					align: 'center'
				},
				{
					header : '규격코드',
					name :  'stdNo',
					align: 'center'
				},
				{
					header : '단위',
					name :  'unitId',
					align: 'center'
				},
				{
					header : '관리단위',
					name :  'unitNo',
					align: 'center'
				},
				{
					header : '사원코드',
					name :  'empCode',
					align: 'center'
				},
				{
					header : '성적서',
					name :  'qcImg',
					align: 'center'
				},
				
				{
					header : '사용여부',
					name :  'useAt',
					align: 'center',
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
		url :  contextPath + "/ajax/getProduct.do",
		data : {
			'productCode' : key
		},
		dataType:"json",
		async : false,
		
		success : function(data){
			//단건 조회시 input value값 가져오기 
			$('#productCode').val(data.data.contents.productCode);
			$('#productName').val(data.data.contents.productName);
			$('#empCode').val(data.data.contents.empCode);
			$('#stdNo').val(data.data.contents.stdNo);
			$('#stdId').val(data.data.contents.stdId);
			$('#unitNo').val(data.data.contents.unitNo);
			$('#unitId').val(data.data.contents.unitId);
			
			//단건 조회시 체크박스 체크여부
			if(use == 'Y') {
				$('#useAt').attr("checked", true);
			
			}else if(use == 'N'){
				$('#useAt').attr("checked", false);
				$('#useAt').val(use);
				console.log(use);
			}
		
			if(image != null){
				$("#image").attr("src", "qcfiledown.do?fileName="+image);
				}else{ 
					$("#image").attr("src", "qcfiledown.do?fileName=noimg.png");
				}
			
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
			document.querySelector("div#imagePreview").appendChild(qcImg);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

//input file 업로드를 버튼으로 업로드 하게 바꾸는 기능
const imgBtn = document.querySelector('#btnQcImg');
const input = document.querySelector('#qcImg');

	imgBtn.addEventListener('click', function(event) {
		input.click();
	});


	
/*//초기화 버튼
$('#btnNew').on('click',function(){
		var img = document.getElementById('image');
		img.setAttribute("src", '');
		$('input').val('');
})
*/

	
//그리드 리스트 삭제
$("#btnDelete").on("click",function() {
	progrid.removeCheckedRows(false);
	progrid.request('deleteData');
})

//체크박스 체크 >> DB에 insert
function YnCheck(){
	
	if($('#useAt').is(':checked') == true){
	
		$('#useAt').val('Y');

	}else{
		$('#useAt').val('N');
		}
}

function save(){
	if(confirm("저장하시겠습니까?")) {
		$('#frm').submit();	
 		}
	}
function excel(){

		$('#excelFrm').submit();	
 	
	}

// 모달

$("#btnProductModal").on("click", function(e) {
    $('#productContent').load("productModal.do");
});

$("#btnUnitModal").on("click", function(e) {	
    $('#unitContent').load("unitModal.do");
});





