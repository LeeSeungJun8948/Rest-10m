<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.modal-backdrop {
       top: 0;
    left: 0;
    z-index: 1040;
    width: 100vw;
    height: 100vh;
    background-color: #000;
}


.blocker, .modal {
	z-index: 100;
	}
</style>

<div id="modalContent" >
	<div class="modal-header">
	</div>
		<div class="modal-body">
			<!-- 필요한것 집어넣기 BODY 부분 -->
			<div id=CodeListGird></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="#" rel="modal:close" ><button class="btn btn-primary">검색</button></a>
			</div>

			<script type="text/javascript">
				var cdataSource = {
					api : {
						readData : {url : 'ajax/getCodeList.do',method : 'GET'}

					},
					contentType : 'application/json'
				};
				var CodeGrid = new tui.Grid({
					el : document.getElementById('CodeListGird'),
					data : cdataSource,
					rowHeaders: ['checkbox'],
					scrollX : false,
					scrollY : false,
					
					columns : [ {
						header : '규격코드',
						name : 'codeId'
					}, {
						header : '규격',
						name : 'code'
					}
					]
				});

				
			</script>
		
		</div>
	
</div>

