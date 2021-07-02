<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.findbtn{
	vertical-align: middle;
	font-size: inherit; !important;
	width: 21px;
	height: 21px;
	min-height: 21px !important;
	border-radius: .25em;
	border: 0;
	background-size: 60%;
}	
	
</style>	
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet"
   href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

</head>
<body>
	<div class="flex row">
		<div class="col-8">
			<h1>제품BOM관리</h1>
		</div>
		<div class="col-4" align="right">
			<form action="deleteBom.do" id="deletefrm" name="deletefrm" method="post">
				<input id="productCode2" name="productCode2" type="hidden" value="productCode">
			</form>
			<button type="button" class="btn btn-primary" onclick="location.href='bomList.do' ">초기화</button>
			<button type="button" class="btn btn-primary" id="btnInsert">저장</button>
			<button type="button" class="btn btn-primary" id="delBom">Bom삭제</button>
		</div>
	</div>
	<div>
		<table>
			<tr>
				<th width="100px" scope="row">
				제품코드
					<span style="color: red">*</span>
				</th>  
				<td width="450px">
				<form id="searchCheck" name="searchCheck">
					<input type="text" maxlength="20" tabindex="1" id='pdc' name="productCode" value="${info.productCode }">
				</form>	
					<a id="search" href="modal.do" rel="modal:open" class="btn btn-primary" >검색</a>
				</td>
				<th scope="row">제품명</th>
				<td width="450px">${info.productName }</td>
				<th scope="row">규격</th>
				<td width="450px">${info.unitNo }</td>
			</tr>
			<tr>
				<th>고객코드</th>
				<td>
				<c:forEach items="${companyList}" var="cc" varStatus="i">
				${cc.companyCode }
				<c:if test="${fn:length(companyList) != i.count}">,</c:if>
				</c:forEach>
				</td>
				
				<th>고객사명</th>
				<td>
				<c:forEach items="${companyList}" var="cn" varStatus="l">
				${cn.companyName }
				<c:if test="${fn:length(companyList) != l.count}">,</c:if>
				</c:forEach>
				</td>
				<td><button type="button" class="btn btn-primary" id="btnMaterial">자재소요관리</button></td>
			</tr>
		</table>
	</div>
	<div class="flex row" style="margin-top: 40px">
		<div  class="col-8">
			<h3>제품 소요량 관리</h3>
		</div>
		<div class="col-4" align="right">
			<button type="button" class="btn btn-primary" id="btnRowInsert">행추가</button>
			<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
		</div>
	</div>
	<div id="bomgrid" style="z-index:10" class="bgird"></div>
		<script type="text/javascript">
        	const dataSource = {
				api : {
							readData : {url: 'ajax/getInfoProduct.do', method:'get'},
							createData : { url: 'ajax/insertBom.do', method: 'POST'},
							updateData : { url: 'ajax/updateBom.do', method: 'PUT' },
							deleteData : { url: 'ajax/deleteBom.do', method: 'POST' },
							modifyData : { url: 'ajax/modifyBom.do', method: 'PUT'}
						},
						contentType: 'application/json'
				}; 
			const grid = new tui.Grid({
					el : document.getElementById('bomgrid'),
					data : dataSource,
					rowHeaders: ['checkbox'],
					scrollX : false,
					scrollY : false,
					columns : [
					{
						header : '제품코드',
						name : 'productCode',
						hidden : true
						
					},
					{
						header : 'Bom넘버',
						name : 'bomNo',
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
					var param = $('#searchCheck').serializeObject();
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
				})
					
				
				function setMatCode(ev){
					var rowKey = ev.rowKey;
					var materialCode = grid.getValue(rowKey,'materialCode');
					if(checkNull(materialCode)){
						$.ajax({
							type:"get",
							data: {"materialCode" : materialCode},
							url: "ajax/getMatName.do",
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
							url: "ajax/getProName.do",
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
				
				
		</script>
		<script>
		$(document).ready(function(){
			$("#delBom").click(function(){
			
				document.deletefrm.submit();
			});
		});
		
		</script>
</body>
</html>