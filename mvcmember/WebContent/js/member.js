function checkWrite(){

	
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("idDiv").innerText = "";
	
	//if(document.writeForm.name.value=="")
	if(document.getElementById("name").value=="")
		//alert("이름을 입력하세요");
		document.getElementById("nameDiv").innerText = "이름을 입력하세요";
		
	//else if(document.writeForm.id.value=="")
	else if(document.getElementById("id").value=="")
		//alert("아이디를 입력하세요");
		document.getElementById("idDiv").innerText = "아이디를 입력하세요";
	
	else if(document.writeForm.pwd.value=="") 
		alert("비밀번호를 입력하세요");
		
	else if(document.writeForm.pwd.value != document.writeForm.repwd.value) 
		alert("비밀번호가 맞지 않습니다");
		
	else if(document.writeForm.id.value != document.writeForm.check.value)
		alert("중복체크 하세요");// 회원가입 눌렀을때 중복체크 안하면 뜨게 함
		//아이디의 값과 체크아이디의 값이 같지 않으면 중복체크 하라고 메세지 띄우기	
		
	else 
		document.writeForm.submit();
}

function checkId(){
	//자바스크립트 변수 설정
	//자료형이 없다 int, String 등
	//var 는 불편하다 찾아오기 var let 차이 찾아오기 모든타입을 지정해주는 var 나 let
	let id = document.getElementById("id").value // 자바스크립트의 변수 선언
	//자바스크립트는 들어오는 데이터의 형태에따라 데이터의 형태가 달라진다
	
	if(id=="")
		//alert("아이디를 입력하세요");
		document.getElementById("idDiv").innerText = "먼저 아이디를 입력하세요";
	else
		window.open("/mvcmember/member/checkId.do?id="+id,"checkId","width=450 height=150"); //팝업창 띄워주는 명령어 writeForm.jsp 와 member.js 는 한몸이라 /mvcmember/member/ 까지도 생략 가능하다
}								//둘중 하나에만 주소를 써주면 된다 "" ""
								//나머지 한군데""에는 팝업창의 아무 이름을 써주면 된다 그래야만 중복체크 창이 여러개 안뜬다
//				http://localhost:8080/memberJSP/member/ 빼도 상관없다

function checkPost(){
	window.open("/mvcmember/member/checkPost.do", "", "width=700 height=500 scrollbars=yes"); //scrollbars=yes 익스플로러를 위한 스크롤바 크롬은 안해줘도 스크롤바가 있다
}

function checkModify(){

	
	document.getElementById("nameDiv").innerText = "";
	
	
	//if(document.writeForm.name.value=="")
	if(document.getElementById("name").value=="")
		//alert("이름을 입력하세요");
		document.getElementById("nameDiv").innerText = "이름을 입력하세요";
		

	
	else if(document.modifyForm.pwd.value=="") 
		alert("비밀번호를 입력하세요");
		
	else if(document.modifyForm.pwd.value != document.modifyForm.repwd.value) 
		alert("비밀번호가 맞지 않습니다");
		

		
	else 
		document.modifyForm.submit();
}

















