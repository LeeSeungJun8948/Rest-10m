<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<h2>주문관리참조 조회</h2>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="searchBtn">조회</button>
	<button type="reset" class="btn btn-primary" id="resetBtn">새자료</button>
</div>
<div class="row">
	<div class="mb-2 col-lg-6">
		<form id="dataForm" name="dataForm">
			<table class="table">
				<tbody>
					<tr>
						<th>진행구분</th>
						<td>
							<div class="row ml-4">
								<div class="col-md-2">
									<input class="form-check-input" type="radio" name="orderState"
										value="unPlan" id="unPlan" checked> <label
										class="form-check-label" for="unPlan">미계획</label>
								</div>
								<div class="col-md-2">
									<input class="form-check-input" type="radio" name="orderState"
										value="working" id="working"> <label
										class="form-check-label" for="working">진행중</label>
								</div>
								<div class="col-md-2">
									<input class="form-check-input" type="radio" name="orderState"
										value="planComplete" id="planComplete"> <label
										class="form-check-label" for="planComplete">진행완료</label>
								</div>
							</div>

						</td>
					</tr>

					<tr>
						<th>주문일자*</th>
						<td>
							<div class="row">
								<div class="col-md-5">
									<input type="date" class="form-control" id="fromDate"
										name="fromDate">
								</div>
								~
								<div class="col-md-5">
									<input type="date" class="form-control" id="toDate"
										name="toDate">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>고객사</th>
						<td><input type="text" id="companyCode" name="companyCode" />
							<button id="btnCompModal" type="button" class="btn btn-toggle"
								data-remote="false" data-toggle="modal" data-target="#compModal">
								<img alt="btn_search"
									src="<c:url value='/images/app/all/btn_search.png'/>">
							</button> <input type="text" id="companyName" name="companyName"
							readonly="true" /></td>
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
</div>
<div id="grid"></div>

<div class="modal fade" id="compModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="compContent" align="center"></div>
	</div>
</div>
<div class="modal fade" id="prodModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="prodContent" align="center"></div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/bus/busList.js"></script>