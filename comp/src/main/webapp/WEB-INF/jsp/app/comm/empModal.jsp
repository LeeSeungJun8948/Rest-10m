<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Remember to include jQuery :) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet"
   href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
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
  <form action="" method="post" >
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
			<table class="table table-bordered" >
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
	</form>
