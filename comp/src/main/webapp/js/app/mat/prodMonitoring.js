// ${pageContext.request.contextPath}/ajax/getProdMonitoring.do

var time = document.getElementById("time"); 
var date = document.getElementById("date");

function getDate(){
	
	var today = new Date();

	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	
	var dateString = year + '-' + month  + '-' + day;
	
	date.innerHTML = dateString;

}

function getTime(){
	
    const now = new Date();
    const hour = now.getHours();
    const minutes = now.getMinutes();
    const seconds = now.getSeconds();
    //clock.innerHTML = hour +":" + minutes + ":"+seconds;
    time.innerHTML = `${hour<10 ? `0${hour}`:hour}:${minutes<10 ? `0${minutes}`:minutes}:${seconds<10 ? `0${seconds}`:seconds}`
}

function setInfo(){
	
	$('#data').empty();
	
	$.ajax({
		url: contextPath + '/ajax/getProdMonitoring.do',
		dataType: 'json',
		success : function(data){
			
			for(var info of data){
				if(checkNull(info.procName)){
					$('<tr>').append($('<td>').html(info.facilitiesName).prop('align','center').css('border','2px solid').css('backgroundColor','#ABF200'))
						.append($('<td>').html(info.procName).prop('align','center').css('border','2px solid'))
						.append($('<td>').html(info.prodName).prop('align','center').css('border','2px solid'))
						.append($('<td>').html(info.prorCount + info.unitNo).prop('align','right').addClass('number').css('border','2px solid'))
						.append($('<td>').html(info.workCount + info.unitNo).prop('align','right').addClass('number').css('border','2px solid'))
						.append($('<td>').html(info.errorCount + info.unitNo).prop('align','right').addClass('number').css('border','2px solid'))
						.append($('<td>').html(parseInt( (info.workCount*1) / (info.prorCount*1) * 100 ) +'%').addClass('number').prop('align','right').css('border','2px solid')
																																.css('backgroundColor','#FFA7A7'))
						.css('border','2px solid')
						.appendTo($('#data'));
						
				}else{
					$('<tr>').append($('<td>').html(info.facilitiesName).prop('align','center').css('border','2px solid').css('backgroundColor','#ABF200'))
							.append($('<td>').prop('colspan','6').css('border','2px solid')
											.prop('align','center')
											.html('대기중').css('backgroundColor','#BDBDBD'))
							.css('border','2px solid')
							.appendTo($('#data'));
				}			
				
			}
		}
	})
	
	$('tbody').css('border','td','2px solid');
	$('tbody').css('border','2px solid');
}

window.onload = function(){
	getDate();
	setInterval(getTime, 1000);	
	setInfo();
}

$('#btnRefresh').on('click',function(){
	setInfo();
})

function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}