package mainController.board;

import java.io.IOException;
import java.util.List;

import config.Hash;
import config.MyBatisContext;
import dto.Board;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.BoardMapper;
import mapper.MemberMapper;

@WebServlet(urlPatterns= {"/board/select.do"})
public class BorderSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BorderSelectController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//주소창에 select.do?page=1이 없을 경우 처리
		String page = request.getParameter("page"); //여기 있는 page가 jsp에서 name속성값임
		if(page == null) {
			response.sendRedirect("select.do?page=1"); //강제로 page=1
			return; //메소드 종료시키기
		}
		
		
		// 1 => 1 10
		// 2 => 11 20
		
		//페이지네이션 시작값
		int start = Integer.parseInt(page) * 10-9;
		
		//페이지네이션 끝값
		int end = Integer.parseInt(page) * 10;
		
		//1. DB에서 게시글 전체 읽기
		List<Board> list = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).selectBoardListPage(start, end);
		
		
		
		//게시판 전체 개수
		long cnt = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).countBoardList();
		
		//2. view로 list 전달
		request.setAttribute("list", list);
		
		// 29 => 3
		// 30 => 3
		// 33 => 4
		// (전체게시글 수 - 1 ) / 10 + 1 
		request.setAttribute("pages", (cnt-1) / 10 + 1);
		
		
		//3. board_select.jsp화면에 표시
		request.getRequestDispatcher("/WEB-INF/board/board_select.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
