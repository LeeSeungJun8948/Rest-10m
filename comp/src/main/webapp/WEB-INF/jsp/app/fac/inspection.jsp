<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">설비 점검내역 관리</h1>
<form id="frm" name="frm">
	<div class="flax row">
		<div class="mb-4 col-10f">
			<table class="table">
				<tbody>
					<tr>
						<th>점검일자</th>
						<td>
							<div class="row">
								<div class="col-md-5">
									<input type="date" class="form-control" id="startDate" name="startDate" >
								</div>
								~ 
								<div class="col-md-5">
									<input type="date" class="form-control" id="endDate" name="endDate" >
								</div>
								<button type="button" class="btn btn-primary" id="btnRead">조회</button>
							</div>
						</td>
					</tr>			
				</tbody>
			</table>
		</div>
	</div>
</form>
<div class="mb-4" align="left">
	<button type="button" class="btn btn-primary" id="btnSave" name="btnSave" >저장</button>
	<button type="button" class="btn btn-info" id="btnAdd" name="btnAdd" >추가</button>
	<button type="button" class="btn btn-info" id="btnDel" name="btnDel" >삭제</button>
</div>
<div id="grid"></div>

<div class="modal fade" id="facModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content" id="facContent" align="center">
		</div>
	</div>
</div>
<script type="text/javascript" src="js/app/fac/inspection.js"></script>