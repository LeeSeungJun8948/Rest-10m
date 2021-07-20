<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#companyCode, .white{
	background-color: #FFFFFF;
}
#companyName{
	background-color: #EAEAEA;	
}
.normal{
	background-color: #f4f4f4;
    border-color: #eee;
}
</style>
<div class="row">
	<div class="col-md-8">
		<h1 class="h3 mb-4 mt-4 text-gray-700">공통코드관리</h1>
	</div>
	<div class="col-md-2 mb-4" align="right">
		<button class="btn-two blue small" id="btnSave" type="button"> 저장 </button>
	</div>
</div>
<div class="row">
	<div id="codeIdGrid" class="col-3">
		<div class="row">
			<div class="col-6 mr-0">
				<input type="text" id="srcCodeIdNm" name="srcCodeIdNm" class="form-control w-5" placeholder="코드ID명">
			</div>
			<div class="ml-0 mb-4">
				<button class="btn-two small blue" id="btnSrc" type="button"> 검색 </button>
				<button class="btn-two small blue" id="btnNewCodeId" type="button"> 추가 </button>
				<button class="btn-two small blue" id="btnDelCodeId" type="button"> 삭제 </button>
			</div>
		</div>
	</div>
	
	<div class="col-7">
		<div align="right" class="mb-4">
			<button class="btn-two small blue" id="btnNewCode" type="button"> 추가 </button>
			<button class="btn-two small blue" id="btnDelCode" type="button"> 삭제 </button>
		</div>
		<div>
			<form name="frm" id="frm">
				<table class="table">
					<tr>
						<th>코드ID</th>
						<td> <input readonly type="text" class="form-control" id="codeId" name="codeId"></td>
						<th>코드ID명</th>
						<td> <input type="text" class="form-control" id="codeIdNm" name="codeIdNm"></td>
						<th>사용여부</th>
						<td> 
							<select name="codeIdUseAt" id="codeIdUseAt" class="form-control">
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>코드ID설명</th>
						<td colspan="5"> <input type="text" class="form-control" id="codeIdDc" name="codeIdDc"></td>
						
					</tr>
				</table>
			</form>
		</div>
		<div id="codeGrid">
		</div>
	</div>
</div>
	

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/mat/commonCodeForm.js"></script>
