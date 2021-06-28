<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비 관리</title>
</head>
<body>
	<div>
		<h2>설비관리</h2>
	</div>
	<div>
		<div>
			<button type="button" class="btn btn-load" id="loadBtn">조회</button>
			<button type="button" class="btn btn-save" id="saveBtn">저장</button>
			<button type="button" class="btn btn-del" id="delBtn">삭제</button>
		</div>
	</div>
	<form id="dataForm" name="dataForm" autocomplete="off">
		<div class="grid-option-area">
			<div class="flex row">
				<div class="col-10f">
					<table class="table table-bbs table-write" summary="내용.....">
						<colgroup>
							<col style="width: 90px">
							<col style="width: 200px">
							<col style="width: 90px">
							<col style="width: 200px">
							<col style="width: 90px">
							<col style="width: 230px">
						</colgroup>
						<tbody>
							<tr style="height: 37px !important;">
								<th>설비코드</th>
								<td data-input="search" data-fn-name="fnEqpDtaSearchView">
									<input class="form-control w140" type="text" id="machCode"
									name="machCode" data-origin="" maxlength="20" /></td>
								<th>설 비 명</th>
								<td><input class="form-control w140" type="text"
									id="machNm" name="machNm" maxlength="20" /></td>
								<th>모 델 명</th>
								<td><input class="form-control w140" type="text"
									id="machModel" name="machModel" maxlength="20" /></td>
							</tr>
							<tr>
								<th>설비규격</th>
								<td colspan="3"><input class="form-control w140"
									type="text" id="machSize" name="machSize" maxlength="20" /></td>
								<th>제작업체</th>
								<td><input class="form-control w140" type="text"
									id="machNm" name="machNm" maxlength="20" /></td>
								<th>용 도</th>
								<td><input class="form-control w140" type="text" id="usest"
									name="usest" maxlength="20" /></td>
							</tr>
							<tr>
								<th>용량/규격</th>
								<td><input class="form-control w140" type="text" id="capa"
									name="capa" maxlength="20" /></td>
								<th>작 업 자</th>
								<td><input class="form-control ta-l" type="text"
									id="worker" name="worker" maxlength="20" style="width: 80px;" />
									<button>검색</button>
									</td>
							</tr>
							<tr>
								<th>용 도</th>
								<td><input class="form-control w140" type="text" id="usest"
									name="usest" maxlength="20" /></td>
								<th>용량/규격</th>
								<td><input class="form-control w140" type="text" id="capa"
									name="capa" maxlength="20" /></td>
								<th>제작일자</th>
								<td>
									<div
										class="tui-datepicker-input tui-datetime-input tui-has-focus"
										style="width: 150px;">
										<input type="text" id="medate" name="medate"
											aria-label="Date-Time"> <span class="tui-ico-date"></span>
									</div>
									<div id="medate-wrapper" style="margin-top: -1px;"></div>
								</td>
							</tr>
							<tr>
								<th>구매금액</th>
								<td><input class="form-control right w140" placeHolder="0"
									data-input="comma_number" type="text" id="mepc" name="mepc"
									maxlength="9" /> <input type="hidden" id="eqpImgFile"
									name="eqpImgFile" /></td>
								<th>구매일자</th>
								<td>
									<div
										class="tui-datepicker-input tui-datetime-input tui-has-focus"
										style="width: 160px;">
										<input type="text" id="indate" name="indate"
											aria-label="Date-Time"> <span class="tui-ico-date"></span>
									</div>
									<div id="indate-wrapper" style="margin-top: -1px;"></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>