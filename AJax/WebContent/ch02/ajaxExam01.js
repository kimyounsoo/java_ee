var httpRequest = null;

function startMethod(){
	httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = resultProcess;
	httpRequest.open("GET", "ajaxExam01.xml", true);
	httpRequest.send();
}

function resultProcess(){
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			var div = document.getElementById("displayArea");
			div.innerHTML = httpRequest.responseText;
			
			/*div.style.visibility = "visible";*//* 숨겨진채로 크기가 고정된다 */
			div.style.display="block";
		}
	}
}