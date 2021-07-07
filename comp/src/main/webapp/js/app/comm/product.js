$( function() {
    $( "#tabs" ).tabs({ activate: function( event, ui ) {
		console.log()
		var tabId = $(ui.newPanel).attr("id");
		if(tabId == 'tabs-1'){
			grid.refreshLayout();
		} else if(tabId == 'tabs-2'){		
			grid2.refreshLayout();
		}
	}});
 		 } );


//input file 업로드를 버튼으로 업로드 하게 바꾸는 기능
	const imgBtn = document.querySelector('#btnImg');
	const input = document.querySelector('#img');

	imgBtn.addEventListener('click', function(event) {
		input.click();
	});

	// 이미지 미리보기 기능
	function setThumbnail(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = document.getElementById('image');
			img.setAttribute("src", event.target.result);
			document.querySelector("div#imagePreview").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	
	
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

//행추가
$("#btnRowInsert").on("click", function(){
		grid.appendRow();
	});

$("#btnInsert").on("click", function(){
		//grid.request('createData');
		grid.request('modifyData', {
		checkedOnly: true
		});
})

$("#btnDelete").on("click",function() {
	grid.removeCheckedRows(false);
	grid.request('deleteData');
})

$('#btnSearch').on('click', function() {
		var prm = $('#frm').serializeObject();
		grid.readData(1, prm, true);
	})
