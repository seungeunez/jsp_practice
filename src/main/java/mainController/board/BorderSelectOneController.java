package mainController.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import config.MyBatisContext;
import dto.Board;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;

@WebServlet(urlPatterns= {"/board/selectone.do"})
public class BorderSelectOneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private Gson gson = new Gson();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//1. 주소창의 no값 가져오기
		 String no = request.getParameter("no");
		 
		 
//		 Long hitNo = Long.parseLong(no);

		//2. no값 없으면 목록으로 보내기
		 if(no == null) {
			 response.sendRedirect("select.do");
			 return;
		 }
		 
		//3. no값을 이용해서 mapper 호출 후 결과 받기
		 
		 Board obj = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).selectOneBoard(Long.parseLong(no));
		 long pre = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).preBoardOne(Long.parseLong(no));
		 long next = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).nextBoardOne(Long.parseLong(no));
//		 int ret = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).updateBoardHit(Long.parseLong(no));
		 
		
		// 전달할 값을 map타입으로 설정
//		Map<String, Integer> map = new HashMap<>();
//		map.put("result", ret); //ret에 1이 담겨있을테니 ret로 받음
//		
//		response.setContentType("application/json");
//		String res = gson.toJson(map);
//		PrintWriter out = response.getWriter();
//		out.print(res);
//		out.flush();
		 
		 
		//4. view로 전달
		request.setAttribute("obj", obj);
		request.setAttribute("pre", pre);
	    request.setAttribute("next", next);
		
		
		//5. view 표시 board_selectone.jsp화면에 표시
		request.getRequestDispatcher("/WEB-INF/board/board_selectone.jsp").forward(request, response);
	
	
		
	
	
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
