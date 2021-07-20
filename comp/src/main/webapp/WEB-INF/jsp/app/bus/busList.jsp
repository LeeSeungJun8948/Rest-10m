<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h1 class="h3 mb-4 text-gray-700">주문관리참조 조회</h1>
<form id="dataForm" name="dataForm" method="post"
	action="busListExcel.do">
	<div class="mb-4" align="right">
		<button type="button" class="btn-two blue small" id="searchBtn">조회</button>
		<input type="submit" class="btn-two blue small" id="btnExcel" value="엑셀">
		<button type="reset" class="btn-two blue small" id="resetBtn">새자료</button>
	</div>
	<div class="row">
		<div class="mb-2 col-lg-6">

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
								<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
								<div class="col-md-5">
									<input type="date" class="form-control" id="toDate"
										name="toDate">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>업체명</th>
						<td>
							<div class="row">
								<div class="col-md-4">
									<input class="form-control" type="text" id="companyCode"
										name="companyCode" data-remote="false" data-toggle="modal"
										data-target="#compModal">
								</div>
								<button id="btnCompModal" type="button" class="btn btn-toggle"
									data-remote="false" data-toggle="modal"
									data-target="#compModal">
									<img alt="btn_search"
										src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>
								<div class="col-md-6">
									<input class="form-control" type="text" id="companyName"
										name="companyName" data-remote="false" data-toggle="modal"
										data-target="#compModal">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>제품명</th>
						<td>
							<div class="row">
								<div class="col-md-4">
									<input class="form-control" type="text" id="productCode"
										name="productCode" data-remote="false" data-toggle="modal"
										data-target="#prodModal">
								</div>
								<button id="btnProdModal" type="button" class="btn btn-toggle"
									data-remote="false" data-toggle="modal"
									data-target="#prodModal">
									<img alt="btn_search"
										src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>
								<div class="col-md-6">
									<input class="form-control" type="text" id="productName"
										name="productName" data-remote="false" data-toggle="modal"
										data-target="#prodModal">
								</div>
							</div>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>
</form>
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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/app/bus/busList.js"></script>