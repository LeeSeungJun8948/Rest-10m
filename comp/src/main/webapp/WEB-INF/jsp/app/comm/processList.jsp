<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>공정관리 ${cName.companyName }</h1>
	</div>
	<div align="right" style="margin-bottom: 5px">
			<button type="button" class="btn btn-primary" id="btnRowInsert">행추가</button>
			<button type="button" class="btn btn-primary" id="btnInsert">저장</button>
			<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
	</div>
	<div id="proGrid" style="z-index:10" class="bgird"></div>
		<script type="text/javascript">
        	const dataSource = {
        			api : {
        				readData : {url: 'ajax/processList.do', method:'get'},
        				createData : { url: 'ajax/insertProcess.do', method: 'POST'},
        				updateData : { url: 'ajax/updateProcess.do', method: 'PUT' },
        				deleteData : { url: 'ajax/deleteProcess.do', method: 'POST'},
        				modifyData : { url: 'ajax/modifyProcess.do', method: 'PUT'}
						},
						contentType: 'application/json'
					}; 
			const grid = new tui.Grid({
				el : document.getElementById('proGrid'),
				data : dataSource,
				rowHeaders: ['checkbox'],
				scrollX : false,
				scrollY : false,
				columns : [
					{
						header : '공정코드',
						name :  'processCode',
						editor: 'text'
						
					},
					{
						header : '공정명',
						name : 'processName',
						editor: 'text'
						
					},
					{
						header : '관리단위',
						name : 'unitNo',
						formatter:'listItemText',
						editor: {
							type:'select',
							options:{
								listItems:[
									{text:'KG',value:'KG'},
									{text:'EA',value:'EA'}
								]
							}
						}
					},
					{
						header : '관리코드',
						name : 'unitId',
						editor: 'text',
						hidden : true
						
					},
					{
						header : '외주여부',
						name : 'outStats',
						formatter:'listItemText',
						editor: {
							type:'select',
							options:{
								listItems:[
									{text:'외주',value:'Y'},
									{text:'자사',value:''}
								]
							}
						}
					},
					{
						header : '외주업체명',
						name : 'outCompName'
						
					},
					{
						header : '비고',
						name:'proComment',
						editor:'text'
					}
				]
				});
			
			   var rowKeyG;			
			   
				   grid.on('click', (ev) => {
					   rowKeyG = ev.rowKey;
					   
					   if(ev.columnName == 'outCompName'){
		              	 var href="proModal.do";
		               window.event.preventDefault();
		              $('.jquery-modal').remove();
		               $('.modal').remove();
		               this.blur();
		               $.get(href, function(html){
		                  var modalOpen = $(html).appendTo('body').modal();
		                  });
		               }
		            });
		</script>
</body>
<script type="text/javascript" src="js/app/comm/process.js"></script>
</html>