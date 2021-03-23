<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
double[] maxTemperature = {10.2, 11.8, 12.9, 9.0};

for(int i=0 ; i<maxTemperature.length; i++){
	
	out.print(maxTemperature[i]); // 0번째 배열부터 3번까지
	
	if(i < maxTemperature.length-1){ // 0 < 4-1 맞기때문에 , 찍어주고 3<3 맞지 않기때문에 , 안찍어준다(9.0에 안찍힌다)
		out.print(",");
	}
}
%>
