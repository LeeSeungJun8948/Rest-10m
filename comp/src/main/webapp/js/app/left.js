$(document).ready(function() {
	var uniqId = '${loginVO.uniqId}';
	$.ajax({
		url: '${pageContext.request.contextPath}/getMenuList.do',
		type: 'POST',
		data: {
			'uniqId': uniqId
		},
		dataType: 'json',
		success: function(result) {
			var str = '';
			for (var i = 1; i < result.data.contents.length; i++) {
				if (i != 1 && result.data.contents[i].chkURL == 'dir') {
					str += '</div></div></li>';
				}
				if (result.data.contents[i].chkURL == 'dir') {
					str += '<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse' + i + '" aria-expanded="true" aria-controls="collapse' + i + '">'
						+ '<i class="fas fa-fw fa-book"></i>'
						+ '<span>' + result.data.contents[i].menuNm + '</span>'
						+ '</a>'
							+ '<div id="collapse' + i + '" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">'
						+ '<div class="bg-white py-2 collapse-inner rounded">'
				} else if (result.data.contents[i].chkURL != null) {
					str += '<a class="collapse-item" href="${pageContext.request.contextPath}' + result.data.contents[i].chkURL + '">' + result.data.contents[i].menuNm + '</a>'
				}
			}
			$('#menu').append(str);
		}
	});
});