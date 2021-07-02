<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	max-width: 1100px;
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
	text-align: left;
	max-height: 600px;
}
</style>
<div class="mb-4" align="right">
	<button type="reset" class="btn btn-primary" id="btnReset">새자료</button>
	<button type="reset" class="btn btn-primary" id="btnSave">저장</button>
	<a href="#close-modal" rel="modal:close"
		class="close-modal btn btn-primary">닫기</a>
</div>
<div>
	<div class="modal-header">
		<h5 class="modal-title">
			<strong>작업등록</strong>
		</h5>
	</div>
</div>
<div>
	<form id="insertWork" name="#">
		<div class="row">
			<div>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td>작업일자</td>
							<td><input type="date" id="#" name="#"></td>
							<td>공정명</td>
							<td><input type="text" id="#" name="#"></td>
							<td>사원명</td>
							<td><input type="text" id="#" name="#">돋보기</td>
						</tr>
						<tr>
							<td>작업지시번호</td>
							<td><input type="text" id="#" name="#"></td>
							<td>제품코드</td>
							<td><input type="text" id="#" name="#"></td>
							<td>LOTNO</td>
							<td><input type="text" id="#" name="#"></td>
						</tr>
						<tr>
							<td>작업량</td>
							<td><input type="text" id="#" name="#"></td>
							<td>불량코드</td>
							<td><input type="text" id="#" name="#">
							<button id="btnMatCodeModal" type="button" class="btn btn-toggle">
									<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
								</button></td>
							<td>불량량</td>
							<td><input type="text" id="#" name="#"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div>
			<h5>
				<strong>작업시작&nbsp;&nbsp;:&nbsp;&nbsp;</strong> <input type="text"
					id="#" name="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<strong>작업종료&nbsp;&nbsp;:&nbsp;&nbsp;</strong> <input type="text"
					id="#" name="#">
			</h5>
		</div>
		<div class="modal-footer">
			<input type="submit" class="btn btn-primary"> <a
				href="#close-modal" rel="modal:close"
				class="close-modal btn btn-primary">닫기</a>
		</div>
	</form>
</div>

