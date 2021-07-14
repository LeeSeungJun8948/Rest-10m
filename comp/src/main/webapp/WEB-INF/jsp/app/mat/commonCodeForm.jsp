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
</style>
<div class="row">
	<div class="col-md-8">
		<h1 class="h3 mb-4 mt-4 text-gray-700">자재정보관리</h1>
	</div>
	<div class="col-md-4 mb-4" align="right">
		<button class="btn btn-primary" id="btnNew" type="button"> test </button>
	</div>
</div>	
<div class="row">				
	<div id="codeIdGrid" class="col-3">
	</div>
	
	<div class="col-6">
		<div>
		</div>
		<div id="codeGrid">
		</div>
	</div>
</div>
	

<script type="text/javascript" src="js/app/mat/commonCodeForm.js"></script>
