<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form id="searchCheck" name="searchCheck" method="post"
		action="facListExcel.do">
		<div class="row">
			<div class="col-md-8">
				<h1 class="h3 mb-4 text-gray-700">설비조회</h1>
			</div>
			<div class="col-md-4 mb-4" align="right">
					<input type="submit" class="btn-two blue small" id="btnExcel"
						value="엑셀">
				</div>
		</div>
		<div class="row">
			<div class="mb-2 col-md-4">
				<table class="table">
					<tr>
						<td>
							<div class="row">
								<div class="col-md-4">
									<select class="custom-select" name="searchCondition"
										id="searchCondition" title="검색조건2-검색어구분">
										<option value="facilitiesName">설비명</option>
										<option value="processName">공정명</option>
									</select>
								</div>
								<div class="col-md-5">
									<input id="searchKeyword" name="searchKeyword" type="text"
										title="검색어" class="form-control">
								</div>
								<button type="button" class="btn-two blue small" id="btnSearch">조회</button>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<div id="grid"></div>
	<script type="text/javascript">
		/* var gridData;

		$.ajax({
			type : "get",
			url : "ajax/facList.do",
			dataType : "json",
			async : false,
			success : function(data) {
				gridData = data;
			},
			error : function() {
			}
		}); */
		const dataSource = {
			api : {
				readData : {
					url : contextPath + '/ajax/facList.do',
					method : 'GET'
				},
			},
			contentType : 'application/json'
		}

		const grid = new tui.Grid({
			el : document.getElementById('grid'),
			// data : gridData,
			data : dataSource,
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '설비코드',
				name : 'facCode'
			}, {
				header : '설비명',
				name : 'facilitiesName'
			}, {
				header : '모델',
				name : 'model'
			}, {
				header : '규격',
				name : 'facSize'
			}, {
				header : '제작업체',
				name : 'productionCompany'
			}, {
				header : '용도',
				name : 'purpose'
			}, {
				header : '용량/규격',
				name : 'volume'
			}, {
				header : '제작일자',
				name : 'productionDate'
			}, {
				header : '사원명',
				name : 'employeeName'
			}, {
				header : '구매금액',
				name : 'price'
			}, {
				header : '정기점검주기',
				name : 'facInspection'
			}, {
				header : '구매일자',
				name : 'purchaseDate'
			}, {
				header : '공정명',
				name : 'processName'
			} ]
		});

		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};

		$("#btnSearch").on("click", function() {
			var param = $('#searchCheck').serializeObject();
			grid.readData(1, param, true);
		})
	</script>
</body>
</html>