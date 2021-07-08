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
									<input type="date" class="form-control" id="startDate" name="startDate">
								</div>
								~ 
								<div class="col-md-5">
									<input type="date" class="form-control" id="endDate" name="endDate">
								</div>
								<button type="button" class="btn btn-primary" id="btnRead">조회</button>
							</div>
						</td>
					</tr>			
				</tbody>
			</table>
		</div>
	</div>
<div id="grid"></div>
</form>
<script>
const dataSource = {
		api : {
			readData : {url: 'ajax/inspectionList.do', method:'GET' }
		},
		contentType: 'application/json'
	};

	const grid = new tui.Grid({
		el : document.getElementById('grid'),
		data : dataSource,
		scrollX : false,
		scrollY : false,
		rowHeaders : [ 'checkbox' ],
		columns : [ {
			header : '정기점검코드',
			name : 'inspectionCode'
		}, {
			header : '판정',
			name : 'judgement'
		}, {
			header : '조치사항',
			name : 'insComment'
		}, {
			header : '전점검일',
			name : 'beforeDate'
		}, {
			header : '점검일',
			name : 'today'
		}, {
			header : '차기점검일',
			name : 'afterDate'
		}, {
			header : '설비코드',
			name : 'facCode'
		}]
	});
</script>