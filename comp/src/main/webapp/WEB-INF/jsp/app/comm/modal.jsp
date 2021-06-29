<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Remember to include jQuery :) -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet"
   href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>


<!-- Modal -->
    <form action="getInfoProduct.do" method="post" id="frm">
    	<input type="hidden" id="prdCode" name="prdCode">

  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title">제품검색</h5>
      			</div>
      			<div class="modal-body">
        			<!-- 필요한것 집어넣기 BODY 부분 -->
        	<div id="grid">
		       <script type="text/javascript">
        			const dataSource = {
						api : {
							readData : {url: 'ajax/bomList.do', method:'GET' },
						},
						contentType: 'application/json'
				};
				const grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : dataSource,
					scrollX : false,
					scrollY : false,
					columns : [
					{
						header : '제품코드',
						name : 'productCode',
					},
					{
						header :'제품명',
						name : 'productName',
					}, 
					{
						header :'규격',
						name : 'unitNo',
					}
					]
				});
				grid.on('click', function(ev) {
				    var values = grid.getRow(ev.rowKey);
				    var prdCode = values.productCode; // 1
				    $('prdCode').val(prdCode);
				    console.log(prdCode);
				});

				</script>   	
				
			</div>
      			</div>
      			<div class="modal-footer">
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        	<input type="submit" class="btn btn-primary" >
      			</div>
    	</div>
	</div>
</form>