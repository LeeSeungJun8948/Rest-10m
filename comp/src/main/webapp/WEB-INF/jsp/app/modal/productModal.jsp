<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal-dialog" role="document" style="z-index: 100">
	<div class="modal-content">
		<div class="modal-header">
		</div>
		<div class="modal-body">
			<!-- 필요한것 집어넣기 BODY 부분 -->
			<div id=CodeGird></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button id=btnSearch type="button" onclick="fnSearch()"
					class="btn btn-primary">검색</button>
			</div>

			<script type="text/javascript">
				const cdataSource = {
					api : {
						readData : {url : 'ajax/getCodeList.do',method : 'GET'}

					},
					contentType : 'application/json'
				};
				const CodeGrid = new tui.Grid({
					el : document.getElementById('CodeGird'),
					data : cdataSource,
					scrollX : false,
					scrollY : false,
					rowHeaders : [ 'rowNum' ],
					columns : [ {
						header : '규격코드',
						name : 'codeId'
					}, {
						header : '규격',
						name : 'code'
					}
					]
				});

				QcMatGrid.on('click', function(ev) {
					
					var values = QcMatGrid.getRow(ev.rowKey);
					var prdCode = values.productCode;
					$('#productCode').val(prdCode);
					console.log(prdCode);

				});

				
				function fnSearch() {
				$("#frm").submit();
				}
				// bom 자재리스트 버튼
				$('#btnSearch').on('click', function() {
					var prm = $('#frm').serializeObject();
					grid.readData(1, prm, true);
				})
			</script>

		</div>
	</div>
</div>

</body>
</html>