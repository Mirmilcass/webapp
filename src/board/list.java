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
			// ���� �������� �ִ� �������� ����
			data = mgr.selectedBoardDataList("Board_list", reqPageNo);
			for (int i = 0; i < data.length; i++) {
				if (data[i].getNested() > 0) {

				}
			}
		}
		
		// ������ �ѹ� �����ִ� ��.
		for (int i = 1; i <= pageCount; i++) {
			
		}
	}
}
