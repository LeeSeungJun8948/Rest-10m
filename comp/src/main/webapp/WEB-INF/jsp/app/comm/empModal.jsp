<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Remember to include jQuery :) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link href="${pageContext.request.contextPath}/css/jquery.modal.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
<link rel="stylesheet"
   href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<style type="text/css">
</style>

<!-- Modal -->
  <form action="" method="post" >
  		<div id="myModal" class="modal-dialog modal-center modal-lg" role="document" style="z-index:1;">
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
			<input type="text" id="empCode" name="empCode">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<strong>사원이름&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
			<input type="text" id="employeeName" name="employeeName">
		</h5>
	</div>
	<div class="row">
		<div>
		</div>
			<table class="table table-bordered">
				<tbody>					
			      <tr>
			        <td>아이디</td>
			        <td><input type="text" id="id" name="id"></td>
			        <td>비밀번호</td>
			        <td><input type="text" id="pwd" name="pwd"></td>
			        <td>부서명</td>
			        <td><input type="text" id="dept" name="dept"></td>
			      </tr>
				</tbody>
			</table>
	</div>
      			</div>
      			<div class="modal-footer">
		        	<input type="submit" class="btn btn-primary">
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      			</div>
    	</div>
	</div>
	</form>
