package mainController.board;

import java.io.IOException;

import config.MyBatisContext;
import dto.Board;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;

@WebServlet(urlPatterns= {"/board/write.do"})
public class BorderWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BorderWriteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//main.jsp 파일 랜더링
		request.getRequestDispatcher("/WEB-INF/board/board_write.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title"); //jsp에 있는 title과 content와 writer를 여기에
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		Board obj = new Board();
		obj.setTitle(title);
		obj.setContent(content);
		obj.setWriter(writer);
		
		System.out.println(obj.toString()); //확인용
		
		//1. DB추가하기
		int ret = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).insertBoardOne(obj);
		
		if(ret == 1) { //성공하면 목록 페이지로 이동
			response.sendRedirect("select.do");
		}else { //실패하면 글쓰기 페이지로
			response.sendRedirect("write.do");
		}
		
		
		
		
		
	}

}
