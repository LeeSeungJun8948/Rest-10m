<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<body>

	<div class="flex row">
		<div class="col-8">
			<h3>제품 품질 표준서 관리</h3>
		</div>
		<div class="col-4" align="right">
			<button class="btn btn-primary" id="btnNew" type="button">
				초기화</button>
			<button type="submit" class="btn btn-primary">저장</button>
			<button class="btn btn-primary" id="btnUdate" type="button">
				수정</button>
		</div>
	</div>
	<div class="flex row">
	<div class="col-9 input-group input-group-sm align-self-start mt-4">
		<form id="frm" class="form-inline" role="form">
			<div class="row">
				<div class="input-group-prepend col-4">
					<span class="input-group-text" >제품코드</span>
					<input id="productCode" name="productCode" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group-prepend col-4">
					<span class="input-group-text" >제품명</span>
					<input id="productName" name="productName" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group-prepend col-4">
					<span class="input-group-text" >Q.C담당자</span>
					<select name="employeeName" id="employeeName" class="form-control">
						<c:forEach var="emp" items="${empList }">
							<option value="${ emp.empCode }">${emp.employeeName }</option>
						</c:forEach>
					</select>
				</div>
				
				<div class="col-12 mb-3"></div>
				
				<div class="input-group-prepend col-4">
					<span class="input-group-text" >규격</span>
					<input readonly id="stdId" name="stdId" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
						<button id="btnProductModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#productModal">
							<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
						</button>	
				</div>
				<div class="input-group-prepend col-lg-4" >
						<span class="input-group-text" >규격코드</span>
						<input readonly id="stdNo" name="stdNo" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group-prepend col-4">
					<span class="input-group-text" >사용여부</span>
					<input id="useAt" name="useAt" type="checkbox" 
						 class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm"
						 <c:if test="${use.useAt eq 'Y'} ">checked="checked"</c:if>>
				</div>
				
				<div class="col-12 mb-3"></div>
				
				<div class="input-group-prepend col-4">
					<span class="input-group-text" >단위</span>
					<input readonly id="unitId" name="unitId" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
						<button id="btnUnitModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#unitModal">
							<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
						</button>	
				</div>
				<div class="input-group-prepend col-lg-4" >
						<span class="input-group-text" >관리단위</span>
						<input readonly id="unitNo" name="unitNo" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group-prepend col-lg-4">
					<input type="file" id="qcImg"
							name="uploadFile" accept="image/*" style="display: none"
							onchange="setThumbnail(event);">
					<button type="button" class="input-group-text" id="btnQcImg">성적서첨부</button>
				</div>
			</div>
		</form>
	</div>
	
	<div class="col-3" style="height:300px; ">
		<div id="imagePreview"   >
			<img id="image" style="width: 300px; height: 300px; "/>
		</div>
	</div>
</div>

	<div class="row">
		<div class="col-6">제품</div>
		<div class="col-6" align="right">
			<button type="button" class="btn btn-primary" id="RowInsert">+</button>
			<button type="button" class="btn btn-primary" id="btnInsert">저장</button>
			<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
		</div>
	</div>

	<div id="proGrid"></div>
	
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" id="productContent" align="center">
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="unitModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" id="unitContent" align="center">
			</div>
		</div>
	</div>
	

</body>
<script type="text/javascript" src="js/app/comm/Quality.js"></script>
</html>