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
<form action="getQcProduct.do" method="post" id="profrm">
	<input type="hidden" id="productCode" name="productCode">
</form>
<div class="modal-dialog" role="document" style="z-index: 100">
	<div class="modal-content">
		<div class="modal-header">
		</div>
		<div class="modal-body">
			<!-- 필요한것 집어넣기 BODY 부분 -->
			<div id=qclGrid></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button id=btnSearch type="button" onclick="fnSearch()"
					class="btn-two blue small">검색</button>
			</div>
			<script type="text/javascript">
			const qcdataSource = {
					api : {
						readData : {url : 'ajax/getProductList.do',method : 'GET'},

					},
					contentType : 'application/json'
				};
				const qcGrid = new tui.Grid({
					el : document.getElementById('qclGrid'),
					data : qcdataSource,
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

				
			
				
			</script>
			
		</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/modal/qcModal.js"></script>
