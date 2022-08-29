package model2.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;

/**
 * Servlet implementation class ListController
 */
@WebServlet("/mvcboard/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MVCBoardDAO dao=new MVCBoardDAO();
		Map<String,Object> map=new HashMap<String, Object>();
		String searchField=request.getParameter("searchField");
		String searchWord=request.getParameter("searchWord");
		if(searchWord!=null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		int totalCount=dao.selectCount(map);
		/********************** 페이징처리 계산 *********************************/
		//책에서는 web.xml에서 읽어옴.
		int pageSize=10;
		int blockPage=5;
		
		//현재페이지 수집
		int pageNum=1;
		String pageTemp=request.getParameter("pageNum");
		if(pageTemp!=null&&!pageTemp.equals("")){
			pageNum=Integer.parseInt(pageTemp);
		}
		//paging query에서 사용할 start, end값 계산
		int start=(pageNum-1)*pageSize+1;
		int end=pageNum*pageSize;
		map.put("start",start);
		map.put("end",end);
		/********************** 페이징처리 계산.끝 *********************************/
		
		
		/**********************첨부파일 이미지변환*************************************/
		
		/**********************첨부파일 이미지변환*************************************/
		 
		
		List<MVCBoardDTO> boardLists=dao.selectListPage(map);
		dao.close();
		
		//1.2.3.4.5 페이지번호 생성
		String paginImg=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do");
		map.put("pagingImg", paginImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		request.setAttribute("boardLists", boardLists);
		request.setAttribute("map", map);
		request.getRequestDispatcher("/Model2/List.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
