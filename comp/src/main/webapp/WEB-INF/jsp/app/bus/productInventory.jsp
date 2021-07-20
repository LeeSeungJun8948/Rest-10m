<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h1 class="h3 mb-4 text-gray-700">제품재고조회</h1>
	<form id="inputFrm" name="inputFrm" method="post"
	action="productInventoryExcel.do">
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnView">조회</button>
	<input type="submit" class="btn btn-primary" id="btnExcel" value="엑셀">
	<button type="reset" class="btn btn-primary" id="btnReset">새자료</button>
	
</div>
<div class="mb-2 col-lg-6">
		<table class="table">
			<tbody>	
			<tr>
						<th>재고상태</th>
						<td>
							<div class="row ml-4">
								<div class="col-md-2">
									<input class="form-check-input" type="radio" name="productState"
										value="productAll" id="productAll" checked> <label
										class="form-check-label" for="productAll">전체</label>
								</div>
								<div class="col-md-2">
									<input class="form-check-input" type="radio" name="productState"
										value="productCount" id="productCount"> <label
										class="form-check-label" for="productCount">재고있음</label>
								</div>
								<div class="col-md-2">
									<input class="form-check-input" type="radio" name="productState"
										value="noProduct" id="noProduct"> <label
										class="form-check-label" for="noProduct">재고없음</label>
								</div>
							</div>

						</td>
					</tr>
			<tr>
					<th>제품Lot</th>
					<td>
					<div class="row">
					<div class="col-md-4">
					<input type="text" class="form-control" id="productLot" name="productLot" max-length="20"
					data-remote="false" data-toggle="modal" data-target="#prodLotModal" />
						</div>
						<button id="btnProdLotModal" type="button" class="btn btn-toggle"
							data-remote="false" data-toggle="modal" data-target="#prodLotModal">
							<img alt="btn_search"
								src="<c:url value='/images/app/all/btn_search.png'/>">
						</button>
						
						</div>
						</td>
				</tr>
				<tr>
						<th>제품명</th>
						<td>
							<div class="row">
								<div class="col-md-4">
									<input class="form-control" type="text"
										id="productCode" name="productCode" data-remote="false" data-toggle="modal"
									data-target="#prodModal">
								</div>
								<button id="btnProdModal" type="button" class="btn btn-toggle"
									data-remote="false" data-toggle="modal"
									data-target="#prodModal">
									<img alt="btn_search"
										src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>
								<div class="col-md-6">
									<input class="form-control" type="text"
										id="productName" name="productName" data-remote="false" data-toggle="modal"
									data-target="#prodModal">
								</div>
							</div>
						</td>
					</tr>

			</tbody>
		</table>
	</form>

</div>
<div class="modal fade" id="prodLotModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="modalContent" align="center">
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/bus/productInventory.js"></script>
	
		
	