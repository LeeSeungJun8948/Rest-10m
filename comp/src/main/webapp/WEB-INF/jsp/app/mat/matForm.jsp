<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
</style>
<div class="row">
	<div class="col-md-8">
		<h1 class="h3 mb-4 text-gray-700">자재 정보 관리</h1>
	</div>
	<div class="col-md-3 mb-4 mr-1" align="right">
		<button type="button" class="btn-two blue small" id="btnSave">저장</button>
	</div>
</div>

<div class="col-11 mb-4" align="right">
	<button type="button" class="btn-two small blue" id="btnGridAdd">추가</button>
	<button type="button" class="btn-two small blue" id="btnGridDel">삭제</button>
</div>
<div class="col-11">
	<form id="frm" name="frm">		
		<div class="row">
			<div class="col-4 mr-0">
				<input type="text" id="materialName" name="materialName" class="form-control w-5" placeholder="자재명">
			</div>
			<div class="ml-0 mb-4">
				<button class="btn-two small blue" id="btnRead" type="button"> 검색 </button>
			</div>
		</div>	
	</form>	
	<div id="matList">
	</div>
</div>
	
<div class="modal fade" id="matModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="matContent" align="center">
		</div>
	</div>
</div>

<div class="modal fade" id="compModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="compContent" align="center">
		</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/mat/matForm.js"></script>