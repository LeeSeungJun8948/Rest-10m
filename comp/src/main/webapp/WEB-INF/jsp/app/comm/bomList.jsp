<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<style type="text/css">
.findbtn {
	vertical-align: middle;
	font-size: inherit; ! important;
	width: 21px;
	height: 21px;
	min-height: 21px !important;
	border-radius: .25em;
	border: 0;
	background-size: 60%;
}

.w-20 {
	width: 13%;
}

.w-30 {
	width: 30%;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="flex row">
		<div class="col-8">
			<h1>제품BOM관리</h1>
		</div>
		<div class="col-4" align="right">
			<form action="deleteSelectBom.do" id="deletefrm" name="deletefrm"
				method="post">
				<input id="productCode2" name="productCode2" type="hidden"
					value="${info.productCode }">
			</form>
			<button type="reset" class="btn-two blue small">초기화</button>
			<button type="button" class="btn-two blue small" id="btnInsert">저장</button>
			<button type="button" class="btn-two blue small" id="delBom">Bom삭제</button>
		</div>
	</div>
	<div class="flex row">
		<div class="input-group-prepend col-4">
			<span class="input-group-text">제품코드</span>
			<form id="searchCheck" name="searchCheck" class="form w-a">
				<input readonly id="pdc" name="productCode" type="text"
					value="${info.productCode }" class="form-control w-50"
					aria-label="Small" aria-describedby="inputGroup-sizing-sm"
					style="float: left">
			</form>
			<a id="search" href="modal.do" rel="modal:open"> <img
				alt="btn_search"
				src="<c:url value='/images/app/all/btn_search.png'/>">
			</a>
		</div>
		<div class="input-group-prepend col-4">
			<span class="input-group-text">제품명</span> <input id="productName"
				name="productName" type="text" value="${info.productName }"
				class="form-control w-50" aria-label="Small"
				aria-describedby="inputGroup-sizing-sm">
		</div>
		<div class="input-group-prepend col-4">
			<span class="input-group-text">규격</span> <input id="unitNo"
				name="unitNo" type="text" value="${info.unitNo }"
				class="form-control w-20" aria-label="Small"
				aria-describedby="inputGroup-sizing-sm">
		</div>

		<div class="col-12" style="margin-bottom: 10px; top: 10px;"></div>

		<div class="input-group-prepend col-4">
			<span class="input-group-text">회사코드</span> <input id="companyCode"
				name="companyCode" type="text" value="${compList.compCode }"
				class="form-control w-30" aria-label="Small"
				aria-describedby="inputGroup-sizing-sm">
		</div>
		<div class="input-group-prepend col-4">
			<span class="input-group-text">회사명</span> <input id="companyName"
				name="companyName" type="text" value="${compList.compName }"
				class="form-control w-50" aria-label="Small"
				aria-describedby="inputGroup-sizing-sm">
		</div>
	

	</div>
	<div class="flex row" style="margin-top: 40px">
		<div class="col-8">
			<h3>제품 소요량 관리</h3>
		</div>
		<div class="col-4" align="right">
			<button type="button" class="btn-two blue small" id="btnMaterial">조회</button>
			<button type="button" class="btn-two blue small" id="btnRowInsert">행추가</button>
			<button type="button" class="btn-two blue small" id="btnDelete">삭제</button>
		</div>
	</div>
	<div id="bomgrid" style="z-index: 10" class="bgird"></div>
	<script type="text/javascript">
    	const dataSource = {
			api : {
				readData : {url: contextPath +'/ajax/getInfoProduct.do', method:'get', initParams: { productCode: '${info.productCode }'}},
				createData : { url: contextPath + '/ajax/insertBom.do', method: 'POST'},
				updateData : { url: contextPath + '/ajax/updateBom.do', method: 'PUT' },
				deleteData : { url: contextPath + '/ajax/deleteBom.do', method: 'POST' },
				modifyData : { url: contextPath + '/ajax/modifyBom.do', method: 'PUT'}
				},
			contentType: 'application/json'
			}; 
			const grid = new tui.Grid({
				el : document.getElementById('bomgrid'),
				data : dataSource,
				rowHeaders: ['checkbox'],
				scrollX : false,
				scrollY : true,
				columns : [
				{
					header : '제품코드',
					name : 'productCode',
					hidden : true
				},
				{
					header : '자재코드',
					name : 'materialCode',
					editor:'text',
						onAfterChange(ev){
						setMatCode(ev);
					}
				},
				{
					header :'자재명',
					name : 'materialName'
				},
				{
					header :'사용량(KG)',
					name : 'kg',
					editor:'text'
				},
				{
					header :'공정코드',
					name : 'processCode',
					editor:'text',
					onAfterChange(ev){
					setProCode(ev);
					}
				},
				{
					header :'공정명',
					name : 'processName'
				},
				{
					header :'비고',
					name : 'etc',
					editor:'text'
				}
				]
			});
		
			$.fn.serializeObject = function() {
				var o = {};
				var a = this.serializeArray();
				$.each(a, function() {
					if (o[this.name]) {
						if (!o[this.name].push) {
							o[this.name] = [o[this.name]];
						}
						o[this.name].push(this.value || '');
					} else {
						o[this.name] = this.value || '';
					}
				});
				return o;
			};
			
			
			$("#btnMaterial").on("click",function() {
		
				grid.readData(1, param, true);
			})  
			
			$("#btnRowInsert").on("click", function(){
				var newProductCode;
				newProductCode = $("#pdc").val();
				<!--
				$.ajax({
					type:"get",
					url:"ajax/getNewProductCode.do",
					datatype:"json",
					async: false,
					success : function(data){
						newProductCode = data.productCode;
					}
				});
				-->
				newRowData ={'productCode': newProductCode };
				grid.appendRow(newRowData,{
					at : grid.getRowCount(),
					focus :true
				});
			});
			$("#btnDelete").on("click",function() {
					grid.removeCheckedRows(false);
					grid.request('deleteData');
			})
			$("#btnInsert").on("click", function(){
				//grid.request('createData');
					 	var param = $('#searchCheck').serializeObject();
				 		grid.readData(1, param, true);
				 		grid.request('modifyData', {
					    checkedOnly: true
					  });
				 		grid.on('successResponse' , function(ev){
				 			var text = JSON.parse(ev.xhr.responseText);
							if (text.check == 'save') {
								
							}
				 		});
				 		toastr.success("저장되었습니다.");
			})
			function setMatCode(ev){
				var rowKey = ev.rowKey;
				var materialCode = grid.getValue(rowKey,'materialCode');
				if(checkNull(materialCode)){
					$.ajax({
						type:"get",
						data: {"materialCode" : materialCode},
						url: contextPath +"/ajax/getMatName.do",
						datatype:"json",
						async: false,
						success : function(data){
							grid.setValue(rowKey,'materialName',data.materialName,false);
						
						},
						error:function(request, status, error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}
			}
			function setProCode(ev){
				var rowKey = ev.rowKey;
				var processCode = grid.getValue(rowKey,'processCode');
				if(checkNull(processCode)){
					$.ajax({
						type:"get",
						data: {"processCode" : processCode},
						url: contextPath +"/ajax/getProName.do",
						datatype:"json",
						async: false,
						success : function(data){
							grid.setValue(rowKey,'processName',data.processName,false);
						},
						error:function(request, status, error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}
			} 
		
			function checkNull(value){
				return value != null && value != '' && value != '[object HTMLInputElement]';
			}
			
			$(document).ready(function(){
				$("#delBom").click(function(){
					document.deletefrm.submit();
				});
			});
			var context ='${pageContext.request.contextPath}';
			var matCoderowKey;
			//클릭시 모달 창 띄우기
			grid.on('click', (ev) => {
				procCoderowKey = ev.rowKey;
				var pc = grid.getRow(ev.rowKey).processCode;
				var pn = grid.getRow(ev.rowKey).processName;
				if(ev.columnName == 'processName'){
					var href="procCodeModal.do";
	               	window.event.preventDefault();
	              	$('.jquery-modal').remove(); 
	              	$('.modal').remove(); 
	               	this.blur();
	               	$.get(href, function(html){
	                  var modalOpen = $(html).appendTo('body').modal();
	                 });
				  }
	          });
		
			//그리드 자재명 클릭시 모달실행
			grid.on('click', (ev) => {
				matCoderowKey = ev.rowKey;
				var mc = grid.getRow(ev.rowKey).materialCode;
				var mn = grid.getRow(ev.rowKey).materialName;
				if(ev.columnName == 'materialName'){
					var href= context + "/modal/matCodeModal.do";
	               	window.event.preventDefault();
	              	$('.jquery-modal').remove(); 
	              	$('.modal').remove(); 
	               	this.blur();
	               	$.get(href, function(html){
	                  var modalOpen = $(html).appendTo('body').modal();
	                 });
				  }
	          });
			

	</script>

</body>
</html>