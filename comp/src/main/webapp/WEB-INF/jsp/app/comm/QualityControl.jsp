<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<form action="proudctListExcel.do" method="post" id="excelFrm" name="excelFrm" ></form>
	<form action="insertProduct.do"    method="post" id="frm" encType="multipart/form-data">
	<div class="flex row">
		<div class="col-8">
			<h3 class="mb-4">제품  / 품질 표준서 관리</h3>
		</div>
	</div>
		<div class="mb-4" align="right">
			<button type="reset"  class="btn-two blue small" id="btnNew">초기화</button>
			<button type="button" class="btn-two blue small" id="btnexcel" onclick="excel()">엑셀</button>
			<button type="button" class="btn-two blue small" id="btninsert" onclick="save()">저장</button>
			<button type="button" class="btn-two blue small" id="btnDelete">삭제</button>
		</div>
	<div class="flex row">
	<div class="col-9 input-group input-group-sm align-self-start mt-4">
		<table class="table">
			<tr>
				<th><span>제품코드</span></th>
				<td width="200px">
					<input id="productCode" name="productCode" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm"
							value="${max+1 }">
				</td>
				<th><span>제품명</span></th>
				<td width="200px">
					<input id="productName" name="productName" type="text" class="form-control" >
				</td>
				<th><span>Q.C담당자</span></th>
				<td>
					<select name="empCode" id="empCode" class="form-control" style="width: 50%">
						<option value="">선택하세요</option>
						<c:forEach var="emp" items="${empList }">
							<option value="${ emp.empCode }">${emp.employeeName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th><span>규격</span></th>
				<td>
					<input readonly id="stdId" name="stdId" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm"
					value="R_STD">
				</td>
				<th><span>규격코드</span></th>
				<td>
						<select name="stdNo" id="stdNo" class="form-control">
							<option value="">선택하세요</option>
							<c:forEach var="rStd" items="${std}">
								<option value="${rStd.code}">${rStd.code }</option>
							</c:forEach>
						</select>
				</td>
				<th><label for="useAt">사용여부</label></th>
				<td><input id="useAt" name="useAt" type="checkbox" onchange="YnCheck();" value="${data.data.contents.useAt }"
						 class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</td>
			</tr>
			<tr>
				<th><span>단위</span></th>
				<td>
					<input readonly id="unitId" name="unitId" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm"
					 value="R_UNIT">
				</td>
				<th><span>관리단위</span></th>
				<td>
					<select name="unitNo" id="unitNo" class="form-control">
						<option value="">선택하세요</option>
						<c:forEach var="rUnit" items="${unit}">
							<option value="${rUnit.code}">${rUnit.code}</option>
						</c:forEach>
					</select>
				</td>
				<th>성적서</th>
				<td>
					<input type="file" id="qcImg"
							name="uploadFile" accept="image/*" style="display: none"
							onchange="setThumbnail(event);">
					<button type="button" id="btnQcImg" class="btn-two blue small">첨부</button>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="col-3" style="height:300px; ">
		<div id="imagePreview">
			<img id="image" style="width: 300px; height: 300px; "/>
		</div>
	</div>
</div>
</form>
	<div class="row" style="margin-top: 10px">
		<div class="col-6">
			<h3 class="mb-4">제품리스트</h3>
		</div>
		
	</div>
	<div id="proGrid"></div>
	
	


<script type="text/javascript" 
		 src="${pageContext.request.contextPath}/js/app/comm/Quality.js"></script>

