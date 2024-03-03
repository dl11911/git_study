package board.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class BoardPaging {

    private int currentPage; // 현재 페이지
    private int pageBlock; // [이전] [1] [2] [3] [다음]
    private int pageSize; // 1페이지당 5개씩
    private int totalA; // 총글수
    private StringBuffer PagingHTML;

    public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalA() {
		return totalA;
	}

	public void setTotalA(int totalA) {
		this.totalA = totalA;
	}

	public StringBuffer getPagingHTML() {
		return PagingHTML;
	}

	public void setPagingHTML(StringBuffer pagingHTML) {
		PagingHTML = pagingHTML;
	}

	public void makePagingHTML() {
    	PagingHTML = new StringBuffer();
		
		int totalP = (totalA + pageSize-1) /pageSize;//총 페이지 수
		
		int startPage = (currentPage-1)/pageBlock * pageBlock + 1 ; 
		int endPage = startPage + pageBlock -1 ;
		
        if(endPage > totalP) endPage = totalP;
        
        if(startPage != 1 )
        	PagingHTML.append("<span id='paging' onclick='boardPaging("+(startPage-1) + ")'>이전</span>");
        
        for(int i=startPage; i<=endPage; i++) {
        	if(i == currentPage)
        		PagingHTML.append("<span id='currentPaging' onclick='boardPaging(" + i + ")'>" + i + "</span>");
        	else
        		PagingHTML.append("<span id='paging' onclick='boardPaging(" + i + ")'>" + i + "</span>");
        }
        
        if(endPage < totalP)
        	PagingHTML.append("<span id='paging' onclick='boardPaging("+ (endPage+1)+")'>다음</span>");
	}
}
