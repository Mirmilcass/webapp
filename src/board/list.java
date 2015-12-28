package board;

public class list {
	int reqPageNo;
	BoardData data[];
	String reqPage;
	BoardMgr mgr;
	int count = 1;

	public list() {
		reqPage = request.getParameter("page"); // page
		if (reqPage != null)
			reqPageNo = Integer.parseInt(reqPage);

		mgr = BoardMgr.getInstance();
		int pageCount = mgr.getPageCount("Board_list");
		if (pageCount == 0) {

		} else {
			if (reqPageNo < 1) {
				reqPageNo = 1;
			}
			// 현재 보여지고 있는 페이지의 정보
			data = mgr.selectedBoardDataList("Board_list", reqPageNo);
			for (int i = 0; i < data.length; i++) {
				if (data[i].getNested() > 0) {

				}
			}
		}
		
		// 페이지 넘버 보여주는 곳.
		for (int i = 1; i <= pageCount; i++) {
			
		}
	}
}
