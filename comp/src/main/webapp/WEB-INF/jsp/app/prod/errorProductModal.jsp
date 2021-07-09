<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Modal -->
<style>
.blocker, .modal {
	z-index: 100;
	}
</style>
	<div class="modal-content">
		<div class="modal-header">
			<form id="productSearchForm" name="productSearchForm">
				<div class="row">
				<select name="searchCondition" id="searchCondition"
					title="검색조건2-검색어구분" style="width: 80px; height: 26px">
					<option value="productCode">제품코드</option>
					<option value="productName" selected="selected">제품명</option>
				</select> <input id="searchKeyword" name="searchKeyword" type="text"
					title="검색어" class="form-control"
					style="width: 200px; margin-left: 10px">
				<button type="button" class="btn btn-primary" id="btnCheck">조회</button>
				</div>
			</form>
		</div>
		<div class="modal-body">
			<!-- 필요한것 집어넣기 BODY 부분 -->
			<div id=matGrid></div>
			<div class="modal-footer">
			<a href="#" rel="modal:close" ><button class="btn btn-primary">닫기</button></a>
				<button id=btnSelect type="button" class="btn btn-primary">선택</button>
			</div>

			<script type="text/javascript">
				var dataSourc = {
					api : {
						readData : {
							url : 'ajax/bomList.do',
							method : 'GET'
						},

					},
					contentType : 'application/json'
				};
				var matGrid = new tui.Grid({
					el : document.getElementById('matGrid'),
					data : dataSourc,
					scrollX : false,
					scrollY : false,
					rowHeaders : [ 'rowNum' ],
					columns : [ {
						header : '제품코드',
						name : 'productCode',
					}, {
						header : '제품명',
						name : 'productName',
					}, {
						header : '규격',
						name : 'unitNo',
					} ]
				});

				matGrid.on('click', function(ev) {
					var values = matGrid.getRow(ev.rowKey);
					var prdCode = values.productCode;
					$('#productCode').val(prdCode);
					console.log(prdCode);

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
				
				var productCode;
				var productName;
			
				matGrid.on('click', (ev) => { 
					productCode = matGrid.getValue(ev.rowKey, 'productCode');
					productName = matGrid.getValue(ev.rowKey, 'productName');
				});
				
				$('#btnSelect').on('click', function(){
					select();
				});
				
				matGrid.on('dblclick', function(){
					select();
				});
				
				function select()	{
					$('#productCode').val(productCode);
					$('#productName').val(productName);
					$('.jquery-modal').remove();
		            $('.modal').remove();
				}
			</script>

		</div>
	</div>
