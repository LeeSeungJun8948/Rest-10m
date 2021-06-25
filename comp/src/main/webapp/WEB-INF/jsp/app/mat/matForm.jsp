<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<body>

	<div id="matList" class="col-4"></div>
	<div id="matInfo" class="col-8"></div>

	<script type="text/javascript">
		var gridData;
		
		$.ajax({
			type : "get",
			url : "ajax/matList.do",
			dataType : "json",
			async : false,
			success : function(data) {
				gridData = data;
			},
			error : function() {
			}
		});

		
		const grid = new tui.Grid({
		      el: document.getElementById('matList'),
		      data: gridData,
		      scrollX: false,
		      scrollY: false,
		      columns: [
		        {
		          header: '자재코드',
		          name: 'materialCode',
		          width: 80
		        },
		        {
		          header: '자재명',
		          name: 'materialName'
		        },
		        {
			      header: '구분',
			      name: 'matNm',
			   	  width: 80
			    }
		      ]
		    });
		
		
	</script>


</body>
</html>