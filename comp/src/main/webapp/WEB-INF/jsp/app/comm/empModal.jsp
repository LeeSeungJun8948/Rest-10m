<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Remember to include jQuery :) -->
<style type="text/css">

.blocker {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	z-index: 100;
	padding: 20px;
	box-sizing: border-box;
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.75);
	text-align: center
}



.modal {
	display: none;
	vertical-align: middle;
	position: relative;
	z-index: 2;
	max-width: 1000px; 
	box-sizing: border-box;
	width: 100%;
	background: #fff;
	padding: 15px 30px;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	-o-border-radius: 8px;
	-ms-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: 0 0 10px #000;
	-moz-box-shadow: 0 0 10px #000;
	-o-box-shadow: 0 0 10px #000;
	-ms-box-shadow: 0 0 10px #000;
	box-shadow: 0 0 10px #000;
	text-align: left
}


</style>

<!-- Modal -->
  <form action="insertEmp.do" method="post" >
  	    		<div class="modal-content" >
      			<div class="modal-header">
        			<h5 class="modal-title">
        			<strong>사원등록</strong>
        			</h5>
      			</div>
      			<div class="modal-body" >
	<div>
		<h5>
			<strong>사원번호 &nbsp;&nbsp;:&nbsp;&nbsp;</strong>
			<input type="text" id="empCode" name="empCode" value="${max+1 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<strong>사원이름&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
			<input type="text" id="employeeName" name="employeeName" >
		</h5>
	</div>
	<div class="row">
		<div>
		</div>
			<table class="table table-bordered" >
				<tbody>					
			      <tr>
			        <td>아이디</td>
			        <td><input type="text" id="id" name="id"></td>
			        <td>비밀번호</td>
			        <td><input type="text" id="pwd" name="pwd"></td>
			        <td>부서코드</td>
			        <td><input type="text" id="dept" name="dept"></td>
			      </tr>
			      <tr>
			        <td>직급</td>
			        <td><input type="text" id="auth" name="auth"></td>
			        <td>전화번호</td>
			        <td><input type="text" id="phone" name="phone"></td>
			        <td>이메일</td>
			        <td><input type="text" id="email" name="email"></td>
			      </tr>
			      <tr>
			        <td>입사일</td>
			        <td><input type="date" id="hireDate" name="hireDate"></td>
			        <td>업체코드</td>
			        <td><input type="text" id="companyCode" name="companyCode"></td>
			        <td>생년월일</td>
			        <td><input type="date" id="birthDay" name="birthDay"></td>
			      </tr>
			      <tr>
			        <td>연봉</td>
			        <td><input type="text" id="salary" name="salary"></td>
			      </tr> 
				</tbody>
			</table>
		</div>
      			</div>
      			<div class="modal-footer">
		        	<input type="submit" class="btn btn-primary">
		        	<a href="#close-modal" rel="modal:close" class="close-modal btn btn-primary">닫기</a>
      			</div>
    	</div>
	</form>
