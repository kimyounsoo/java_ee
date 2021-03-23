<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="rs" dataSource="jdbc/oracle">
select * from usertable
</sql:query>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<!-- 테이블의 타이틀(필드명 꺼내온다) 1차원배열로꺼내옴 필드명 배열캡처 참조-->
<tr>
 <c:forEach var="columnName" items="${rs.columnNames }"> <!-- 메소드명을 변수처럼 쓴다 getColumnNames() 에서 바꿈 -->
    <th width="100">${columnName }</th>
  </c:forEach>
  <th width="150">비고</th>
</tr>
      <!-- 필드도 꺼내올 차례다 -->
      <tr>
         <c:forEach var="row" items="${rs.rowsByIndex }"> <!-- rowsByIndex배열 캡쳐확인 행 "rs.RowsByIndex()" 에서 "rs.rowsByIndex" 로 바꿔 쓸수 있다. -->
            <tr>
               <c:forEach var="column" items="${row }">   <!-- 열 -->
                  <td width="100" align="center">${column }</td>
               </c:forEach>
               <td width="150" align="center">
               	<input type="button" value="수정" onclick="location.href='jstlModifyForm.jsp?id=${row[1]}'">
               	<input type="button" value="삭제" onclick="del('${row[1]}')">
               	</td>
            </tr>            
         </c:forEach>       
         </tr>  
      </table>
<script type="text/javascript">
function del(id){
	if(confirm("삭제하시겠습니까?")){
		location.href='jstlDelete.jsp?id='+id; //${row[1]}'; 에서 변경
	} //동의를 구하는 팝업창(alert 과 같은모습) T/F, == true 필요없다
}
</script>
</body>
</html>