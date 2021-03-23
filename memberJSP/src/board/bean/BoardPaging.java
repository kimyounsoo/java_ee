package board.bean;

import lombok.Data;

@Data
public class BoardPaging {
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지당 5개씩
	private int totalA;//총글수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		//총 페이지 수 
		//int totalP = (totalA + 4) / 5; // 5개씩 뿌릴때
		int totalP = (totalA + pageSize-1) / pageSize; // 공식화
		//int totalP = (totalA % 5 == 0) ? (totalA / 5) : (totalA / 5 + 1); //총 페이지 수
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1;// startpage 공식 [1][4][7]등등
		int endPage = startPage + pageBlock - 1;
		if(endPage > totalP) endPage = totalP; //글수가 모자라서 마지막 페이지 [9] 없을때 if 문
		
		//이전 만들기
		if(startPage > 1) // 또는 startPage > pageBlock
			pagingHTML.append("[<a id='paging' href='boardList.jsp?pg="+(startPage-1)+"'>이전</a>]");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage) // i가 현재페이지라면
				pagingHTML.append("[<a id='currentPaging' href='boardList.jsp?pg="+i+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id='paging' href='boardList.jsp?pg="+i+"'>"+i+"</a>]");
		}//for
		
		if(endPage < totalP)
			pagingHTML.append("[<a id='paging' href='boardList.jsp?pg="+(endPage+1)+"'>다음</a>]");
			
	}
	
}

//String, StringBuffer 차이는 StringBuffer는 편집이 가능하다
//[1]
//[1][2]
//[1][2][3] 글수가 늘어나면 이렇게 계속 편집이 돼야해서 StringBuffer 사용

//StringBuffer : 일반 String과 달리 
//StringBuffer는 하나의 메모리 공간을 잡고 들어오는 데이터를 차곡차곡 쌓는다. 
//그리고 append(), delete() 등의 메소드를 통해 수정, 삭제가 가능하다. 
//유의할점은 "delete(0,10)"은 0번인덱스부터 9번인덱스까지만 
//삭제하고 10번인덱스부터 살린다는 뜻이다. 
//그리고 차곡차곡 쌓는 개념이기에 원하는 결과를 얻어 출력 후, buffer를 비워줘야 한다.