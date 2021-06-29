<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
</head>
<body>
	<div>
		<h1>제품BOM관리</h1>
	</div>
	<div>
		<table>
			<tr>
				<th width="100px" scope="row">
				제품코드
					<span style="color: red">*</span>
				</th>
				<td width="380px">
					<input type="text" maxlength="20" tabindex="1" value="${info.productCode }">
					<button id ="findbtn" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal">
					검색
					</button>
				</td>
				<th scope="row">제품명</th>
				<td width="380px">${info.productName }</td>
				<th scope="row">규격</th>
				<td width="380px">${info.unitNo }</td>
			</tr>
			<tr>
				<th>고객코드</th>
				<td>${info.companyCode }</td>
				<th>고객사명</th>
				<td>${info.companyName }</td>
				<td><button type="button" onclick="bomSearch()" value="${info.productCode}" name="item">제품소요관리</button></td>
			</tr>
		</table>
	</div>
	<div>
		${bomInfo.companyCode }
	</div>

	<!-- Modal -->
    <form action="getInfoProduct.do" method="post" id="frm">
    	<input type="hidden" value="" name="productCode" id="productCode">
    </form>
	<div id="modal" class="modal fade" tabindex="-1" role="dialog">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title">제품검색</h5>
      			</div>
      			<div class="modal-body">
        			<table>
        				<tr>
        					<th>제품코드</th>
        					<th>제품명</th>
        					<th>규격</th>
        					<th>선택</th>
        				</tr>
        				<c:forEach items="${productList }" var="pl">
        					<tr>
        						<td>${pl.productCode }</td>
        						<td>${pl.productName }</td>
        						<td>${pl.unitNo }</td>
        						<td><input type="checkbox" value="${pl.productCode}" name="itemSel"></td>
        					</tr>
        				</c:forEach>
        			</table>
      			</div>
      			<div class="modal-footer">
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        	<button type="button"  onclick="fnSearch()" class="btn btn-primary" >검색</button>
      			</div>
    	</div>
	</div>
</div>

 <script>
 	function fnSearch(){
		$("input[name=itemSel]").each(function(){
			if($(this).is(":checked")==true){
				$("#productCode").val($(this).val());
				$("#frm").submit();
			}	
		});
 	}
 
   </script>    	

</body>
</html>