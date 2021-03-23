//빈 객체 선언
var calc = {}

//멤버변수 추가
calc.x = 0;
calc.y = 0;

//멤버함수
calc.setValue = function(p1, p2){
	this.x = p1;
	this.y = p2;
}

calc.plus = function(){
	return this.x + this.y;
}
calc.minus = function(){
	return this.x - this.y;
}

calc.result = function(){
	var value1 = this.plus();
	var value2 = this.minus();
	
	document.write("<p>덧셈 = " + value1 + "</p>");
	document.write("<p>뺄셈 = " + value2 + "</p>");
}

/*class Calc {
	private int x=0;
	private int y=0;
	
	public void setValue(int p1 int p2){
		this.x = p1;
		this.y = p2;
	}
	
	public int plus(){
		return x + y;
	}
	
	public int minus(){
		return x - y;
	}
	public void result(){
		int value1 = this.plus();
	}
}

Calc calc = new Calc();*/