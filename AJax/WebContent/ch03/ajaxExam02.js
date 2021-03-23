var httpRequest = null;

function startMethod(){
	httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = resultProcess;
	httpRequest.open("GET", "ajaxExam02.xml", true); // xml가서 데이터 가져온후 resultProcess 가고resultProcess 에서  processXML 간다
	httpRequest.send(null);
}

function resultProcess(){
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				processXML();
		}
	}
}

function processXML(){
	//기존의 내용을 제거 안하면 계속 내용이 계속 붙어서 나온다
	var resultDisplay = document.getElementById("resultDisplay");
	while(resultDisplay.hasChildNodes()){ // for문을 돌리면 0번지우면 지워지고 다음 0번을 또지워서 돌아가질않는다?? 아무튼 while문 돌려야한다
		resultDisplay.removeChild(resultDisplay.firstChild);
		
	}//while
	//----------------
	var xmlDoc = httpRequest.responseXML;
	
	var trTag = "";
	var tdTag = "";
	
	var subjects = xmlDoc.getElementsByTagName("subject");
	for(var i=0; i<subjects.length; i++){
		trTag = document.createElement("tr");
		
		var childs = subjects[i].childNodes; //subjects.item[i] //childNodes s 붙였기때문에 list로 나온다
		//alert(childs.length); // 찍어보면 xml의 subject안에 엔터값 4개까지 포함되서 7개나온다
		for(var j=0; j<childs.length; j++){
			
			if(childs[j].firstChild != null){
				var text = childs[j].firstChild;//.nodeValue; //.nodeValue 빼면 텍스트가 된다 alert띄울려고 붙였던것
				
				tdTag = document.createElement("td");
				tdTag.appendChild(text);
				
				trTag.appendChild(tdTag);
				//alert(text);
				
			}//if
		}//for j
		
		document.getElementById("resultDisplay").appendChild(trTag); // html에  자식클래스 tr태그 붙여주기
	}//for i
}