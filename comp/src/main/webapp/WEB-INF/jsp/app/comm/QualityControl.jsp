<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet"
   href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<title>Insert title here</title>
<style type="text/css">
	th{
	width: 120px;
	}
	td{
	width: 300px;
	}
</style>
</head>
<body>
	<div>
		<h3>제품 품질 표준서 관리</h3>
	</div>
	<div>
		<table>
			<tr>
				<th scope="row">제품코드 <span style="color: red">*</span>
				</th>
				<td width="300px">

					<form id="searchCheck" name="searchCheck" style="float: left">
						<input type="text" size="20" tabindex="1" id='pdc'
							name="productCode" value="${proInfo.productCode }"
							style="margin-top: 4px">
					</form> <a id="search" href="QcModal.do" rel="modal:open"
					class="btn btn-primary" style="margin-left: 10px"> <img
						src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.png'/>">
				</a>
				</td>
				<th scope="row">제품명</th>
				<td ><input type="text" value="${proInfo.productName }"></td>
				<th scope="row">규격</th>
				<td><input type="text" value="${proInfo.stdId }"></td>
				<th>Q.C담당자</th>
				<td><input type="text" value="${proInfo.employeeName }"></td>
			</tr>
			<tr>
				<th >고객코드</th>
				<td><input type="text" size="20" 
					<c:forEach items="${company}" var="compCode" >
						company_code="${compCode.companyCode }"
					</c:forEach>
					></td>
					
				
				

				<th >고객사명</th>
				<td><c:forEach items="${company}" var="compName" varStatus="l">
				${compName.companyName }
				<c:if test="${fn:length(company) != l.count}">,</c:if>
					</c:forEach></td>
				<th >관리단위</th>
				<td><input type="text" value="${proInfo.unitNo }"></td>
				<th>사용여부</th>
				<td><input type="checkbox" name="checkYn" id="checkYn" style="width: 20px; height: 20px" 
					<c:if test="${proInfo.useAt eq 'Y'}">checked="checked"</c:if> 
					value="${proInfo.useAt }" ></td>
			</tr>
		</table>
	</div>
	
</body>
</html>