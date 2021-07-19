<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<h1 class="h3 mb-4 text-gray-700">사원관리</h1>
<form id="searchCheck" name="searchCheck">
	<div class="row">
		<select class="custom-select" name="searchCondition" id="searchCondition" title="검색조건2-검색어구분" style="width: 80px;">
			<option value="id">ID</option>
			<option value="employeeName">이름</option>
		</select> 
		<input id="searchKeyword" name="searchKeyword" type="text" title="검색어" class="form-control" style="width: 200px; margin-left: 10px">
		<button type="button" class="btn btn-primary" id="btnSearch">
			<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
		</button>
	</div>	
	<div class="mb-4" align="right">
		<button id="btnEmpModal" type="button" class="btn btn-primary" data-remote="false" data-toggle="modal" data-target="#empModal">등록</button>
		<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
	</div>
</form>
<div id="grid"></div>

<div class="modal fade" id="empModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="min-width: 60%; display: table;">
		<div class="modal-content" id="empContent" align="center">
			<form id="frm" action="insertEmp.do" method="post">
				<div class="modal-header">
					<h5 class="modal-title">
						<strong>사원등록</strong>
					</h5>
				</div>
				<div class="modal-body">
					<div>
						<table class="table table-bordered">
							<tr>
								<td>사원번호
									<input readonly type="text" class="form-control" id="empCode" name="empCode">
								</td>
								<td>사원이름
									<input type="text" class="form-control" id="employeeName" name="employeeName">
								</td>
							</tr>
						</table>	
					</div>
					<div class="row">
						<div></div>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>아이디</td>
									<td><input type="text" class="form-control" id="id" name="id"></td>
									<td>비밀번호</td>
									<td><input type="text" class="form-control" id="pwd" name="pwd"></td>
									<td>부서코드</td>
									<td><input type="text"  class="form-control" id="dept" name="dept"></td>
								</tr>
								<tr>
									<td>직급</td>
									<td><input type="text" class="form-control" id="auth" name="auth"></td>
									<td>전화번호</td>
									<td><input type="text" class="form-control" id="phone" name="phone"></td>
									<td>이메일</td>
									<td><input type="text" class="form-control" id="email" name="email"></td>
								</tr>
								<tr>
									<td>입사일</td>
									<td><input type="date" class="form-control" id="hireDate" name="hireDate"></td>
									<td>업체코드</td>
									<td><input type="text" class="form-control" id="companyCode" name="companyCode"></td>
									<td>생년월일</td>
									<td><input type="date" class="form-control" id="birthDay" name="birthDay"></td>
								</tr>
								<tr>
									<td>연봉</td>
									<td><input type="text" class="form-control" id="salary" name="salary"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button id="btnSave" class="btn btn-primary" onclick="fnSearch()">저장</button> 
					<a href="#" rel="modal:close" >
						<button class="btn btn-primary">닫기</button>
					</a>
				</div>
			</div>
		</form>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/viewWork.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/comm/empList.js"></script>