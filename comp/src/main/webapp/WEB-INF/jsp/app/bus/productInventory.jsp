<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

	<h1 class="h3 mb-4 text-gray-700">제품재고조회</h1>
	<div class="mb-4" align="right">
		<button type="button" class="btn btn-primary" id="btnView">조회</button>
		<button type="reset" class="btn btn-primary" id="btnReset">새자료</button>
		<button type="button" class="btn btn-primary" id="btnSave">저장</button>
		<button type="button" class="btn btn-primary" id="btnDel">삭제</button>
	</div>
	<div class="mb-2 col-lg-6">
		<form id="inputFrm" name="inputFrm">
			<table class="table">
				<tbody>
					<tr>
						<th>정산일자</th>
						<td><input type="date" name="fromDate" id="fromDate" value=${exportDate }> ~
				<input type="date" name="toDate" id="toDate" value=${exportDate }></td>
					</tr>
					<tr>
						<th>제품코드</th>
						<td><input type="text" id="prductCd" name="prductCd" /> <a
							href="modal.do" rel="modal:open" class="btn btn-primary"> <img
								src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.png'/>">
						</a> <input type="text" id="prductNm" name="prductNm" maxlength="20"
							readonly="true" /></td>



					</tr>
					<tr>
						<th>특기사항</th>
						<td><input type="text" id="comments" name="comments"></td>
					</tr>
				</tbody>
			</table>
		</form>

	</div>

	<div id="grid">
		<script type="text/javascript">
	
		
	var dataSource = {
				api : {
					readData : {url: 'ajax/productInventory.do', method:'POST' }
				},
				contentType: 'application/json'
				
		};
	
		
		const grid = new tui.Grid({
			el : document.getElementById('grid'),
			data : dataSource,
			scrollX : false,
			scrollY : false,
			rowHeaders: ['checkbox'],
			columns : [ {
				header : '제품코드',
				name : 'productCode'
			}, {
				header : '제품명',
				name : 'productName'
			},{
				header : '규격',
				name : 'stdId'
			}, {
				header : '단위',
				name : 'unitId'
			}, {
				header : '제품LOT_NO',
				name : 'productLot'
			}, {
				header : '제품재고',
				name : 'productCount'
			},  {
				header : '제품상태',
				name : 'productState'
			},{
				header : '비   고',
				name : 'remark'
			} 
			], summary:{
		        height:40,
		        position:'bottom',
		        columnContent:{
		        	companyName:{
		                template(summary) {
		                    return '합계';
		                } 
		            },
		            productCount:{
		                template(summary) {
		                    return (summary.sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		                }
		            }
		        }
		    },
		    columnOptions: {
		        resizable : true
		    }

		});

		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [o[this.name]];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};
		
		
		//조회버튼
		$('#btnView').on('click',function(){
				   var param = $('#inputFrm').serializeObject();
				   console.log(param)
				   grid.readData(1, param, true);
				});
		$('#resetBtn').on('click', function(){
			grid.clear();
		});

	</script>
	</div>
</body>
</html>
</body>
</html>

