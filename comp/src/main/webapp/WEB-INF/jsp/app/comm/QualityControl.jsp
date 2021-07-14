<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


	<form action="insertProduct.do" method="post" id="frm" encType="multipart/form-data">
	<div class="flex row">
		<div class="col-8">
			<h3>제품  / 품질 표준서 관리</h3>
		</div>
		<div class="col-4" align="right">
			<button class="btn btn-primary" id="btnNew" type="button">
				초기화</button>
			<button type="submit" class="btn btn-primary" id="btninsert">저장</button>
			<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
		
		</div>
	</div>
	<div class="flex row">
	<div class="col-9 input-group input-group-sm align-self-start mt-4">
	
			<div class="row">
				<div class="input-group-prepend col-4">
					<span class="input-group-text" >제품코드</span>
					<input id="productCode" name="productCode" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm"
							value="${max+1 }">
				</div>
				<div class="input-group-prepend col-4">
					<span class="input-group-text" >제품명</span>
					<input id="productName" name="productName" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group-prepend col-4">
					<span class="input-group-text" >Q.C담당자</span>
					<select name="empCode" id="empCode" class="form-control">
						<option value="">선택하세요</option>
						<c:forEach var="emp" items="${empList }">
							<option value="${ emp.empCode }">${emp.employeeName }</option>
						</c:forEach>
					</select>
				</div>
				
				<div class="col-12 mb-3"></div>
				
				<div class="input-group-prepend col-4">
					<span class="input-group-text" >규격</span>
					<input readonly id="stdId" name="stdId" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm"
					value="R_STD">
							
				</div>
				<div class="input-group-prepend col-lg-4" >
					<span class="input-group-text" >규격코드</span>
						<select name="stdNo" id="stdNo" class="form-control">
							<option value="">선택하세요</option>
							<c:forEach var="rStd" items="${std}">
								<option value="${rStd.code}">${rStd.code }</option>
							</c:forEach>
						</select>
				</div>
				<div class="input-group-prepend col-4">
					<label for="useAt" class="input-group-text">사용여부</label>
					<input id="useAt" name="useAt" type="checkbox" onchange="YnCheck();" value="${data.data.contents.useAt }"
						 class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					
				</div>
				
				<div class="col-12 mb-3"></div>
				
				<div class="input-group-prepend col-4">
					<span class="input-group-text" >단위</span>
					<input readonly id="unitId" name="unitId" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm"
					 value="R_UNIT">
						
				</div>
				<div class="input-group-prepend col-lg-4" >
					<span class="input-group-text" >관리단위</span>
					<select name="unitNo" id="unitNo" class="form-control">
							<option value="">선택하세요</option>
							<c:forEach var="rUnit" items="${unit}">
								<option value="${rUnit.code}">${rUnit.code}</option>
							</c:forEach>
						</select>
				</div>
				<div class="input-group-prepend col-lg-4">
					<input type="file" id="qcImg"
							name="uploadFile" accept="image/*" style="display: none"
							onchange="setThumbnail(event);">
					<button type="button" class="input-group-text" id="btnQcImg">성적서첨부</button>
				</div>
			</div>
		
	</div>
	
	<div class="col-3" style="height:300px; ">
		<div id="imagePreview"   >
			<img id="image" style="width: 300px; height: 300px; "/>
		</div>
	</div>
</div>
</form>
	<div class="row" style="margin-top: 10px">
		<div class="col-6">
			<h2>제품리스트</h2>
		</div>
		
	</div>

	<div id="proGrid"></div>
	
	


<script type="text/javascript" src="js/app/comm/Quality.js"></script>

