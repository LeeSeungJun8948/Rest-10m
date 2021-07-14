<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h1 class="h3 mb-4 text-gray-700">제품재고조회</h1>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnView">조회</button>
	<button type="reset" class="btn btn-primary" id="btnReset">새자료</button>
	
</div>
<div class="mb-2 col-lg-6">
	<form id="inputFrm" name="inputFrm">
		<table class="table">
			<tbody>	
			<tr>
					<th>제품Lot</th>
					<td><input type="text" id="productLot" name="productLot" />
						<button id="btnProdLotModal" type="button" class="btn btn-toggle"
							data-remote="false" data-toggle="modal" data-target="#prodLotModal">
							<img alt="btn_search"
								src="<c:url value='/images/app/all/btn_search.png'/>">
						</button></td>
				</tr>
				<tr>
					<th>제품코드</th>
					<td><input type="text" id="productCode" name="productCode" />
						<button id="btnProdModal" type="button" class="btn btn-toggle"
							data-remote="false" data-toggle="modal" data-target="#prodModal">
							<img alt="btn_search"
								src="<c:url value='/images/app/all/btn_search.png'/>">
						</button> <input type="text" id="productName" name="productName"
						maxlength="20" readonly="true" /></td>
				</tr>
			</tbody>
		</table>
	</form>

</div>
<div class="modal fade" id="prodLotModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="prodLotContent" align="center">
		</div>
	</div>
</div>
<div class="modal fade" id="prodModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="prodContent" align="center">
		</div>
	</div>
</div>

<div id="grid"></div>
	<script type="text/javascript" src="js/app/bus/productInventory.js"></script>
	
		
	