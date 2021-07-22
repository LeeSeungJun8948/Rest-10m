<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-md-8">
		<h1 class="h3 mb-4 text-gray-700">설비 생산이력 조회</h1>
	</div>
</div>
	<div class="mb-4" align="right" role="form">
		<button type="button" class="btn-two blue small" id="btnRead">조회</button>
	</div>

<form id="frm" name="frm">
	<div class="row">
		<div class="mb-2 col-md-6">
			<table class="table">
				<tbody>
					<tr>
						<th>작업일자</th>
						<td>
							<div class="row">
								<div class="col-md-5">
									<input type="date" class="form-control" id="startDate" name="startDate">
								</div>
								~ 
								<div class="col-md-5">
									<input type="date" class="form-control" id="endDate" name="endDate">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>설비명</th>
						<td>
							<div class="row">
								<div class="col-md-4">
									<input readonly class="form-control" type="text" id="facilitiesName" name="facilitiesName">
								</div>
								<button id="btnFacModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#facModal">
										<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>	
							</div>
						</td>
					</tr>
					<tr>
						<th>제품명</th>
						<td>
							<div class="row">
								<div class="col-md-4">
									<input readonly class="form-control" type="text" id="productName" name="productName">
								</div>
								<button id="btnProdModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#prodModal">
										<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>	
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="mb-4 col-lg-6">
		</div>
	</div>
</form>

<div id="grid"></div>

<div class="modal fade" id="facModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content" id="facContent" align="center">
		</div>
	</div>
</div>

<div class="modal fade" id="prodModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="prodContent" align="center"></div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/fac/facProdList.js"></script>