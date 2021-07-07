var dataSourceModal = {
	contentType: 'application/json',
	api: {
		readData: { url: 'searchPlan.do', method: 'POST' },
  }
}

var gridModal = new tui.Grid({
	el: document.getElementById('gridModal'),
	scrollX: false,
	scrollY: true,
	data: dataSourceModal,
	columns: [{
		header: '생산계획번호',
		name: 'planCode',
		}, {
		header: '계획명',
		name: 'planName',
		}, {
		header: '계획일자',
		name: 'planDate',
		}, {
		header: '특기사항',
		name: 'comments',
		}]
});

// 검색 버튼
$('#btnSearch').on('click',  function(){
	var param = $('#modalFrm').serializeObject();
	gridModal.readData(1, param, true);
});

// 더블클릭해서 계획 불러오기
gridModal.on('dblclick', (ev) => {
	var rowKey = ev.rowKey;
	var obj = gridModal.getRow(rowKey);
	$('#planCode').val(obj.planCode);
	$('#planDate').val(obj.planDate);
	$('#planName').val(obj.planName);
	$('#comments').val(obj.comments);
	grid.readData(1, {planCode: obj.planCode}, true);
	$('.jquery-modal').remove();
	$('.modal').remove();
});