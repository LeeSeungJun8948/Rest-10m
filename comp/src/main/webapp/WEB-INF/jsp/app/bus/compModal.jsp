<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
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
<form action="getInfoProduct.do" method="post" id="frm">
	<input type="hidden" id="companyCode" name="companyCode">
</form>
<div class="modal-dialog" role="document" style="z-index: 100">
	<div class="modal-content">
		<div class="modal-header">
			<form id="productSearchForm" name="productSearchForm">
				<select name="searchCondition" id="searchCondition"
					title="검색조건2-검색어구분" style="width: 80px; height: 26px">
					<option value="companyCode">업체코드</option>
					<option value="companyName" selected="selected">업체명</option>
				</select> <input id="searchKeyword" name="searchKeyword" type="text"
					title="검색어" class="form-control"
					style="width: 200px; margin-left: 10px">
				<button type="button" class="btn btn-primary" id="btnCheck">조회</button>
			</form>
		</div>
		<div class="modal-body">
			<!-- 필요한것 집어넣기 BODY 부분 -->
			<div id=matGrid></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button id=btnSearch type="button" onclick="fnSearch()"
					class="btn btn-primary">검색</button>
			
			</div>

			<script type="text/javascript">
				const dataSourc = {
					api : {
						readData : {
							url : 'ajax/exportForm.do',
							method : 'GET'
						},

					},
					contentType : 'application/json'
				};
				const matGrid = new tui.Grid({
					el : document.getElementById('matGrid'),
					data : dataSourc,
					scrollX : false,
					scrollY : false,
					rowHeaders : [ 'rowNum' ],
					columns : [ {
						header : '업체코드',
						name : 'companyCode',
					}, {
						header : '업체명',
						name : 'companyName',
					}, {
						header : '사업자등록변호',
						name : 'unitId',
					} ,{
						header : '전화번호',
						name : 'unitId',
					}]
				});

				matGrid.on('click', function(ev) {
					var values = matGrid.getRow(ev.rowKey);
					var compCode = values.companyCode;
					$('#companyCode').val(compCode);
					console.log(compCode);

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

				$("#btnCheck").on("click", function() {
					var param = $('#productSearchForm').serializeObject();
					matGrid.readData(1, param, true);
				})
			</script>

		</div>
	</div>
</div>
<script>
	function fnSearch() {
		$("#frm").submit();
	}
	// bom 자재리스트 버튼
	$('#btnSearch').on('click', function() {
		var prm = $('#frm').serializeObject();
		grid.readData(1, prm, true);
	})
</script>