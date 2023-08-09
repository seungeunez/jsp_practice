package mainController.board;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.Board;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;

@WebServlet(urlPatterns= {"/board/deleteone.do"})
public class BorderDelectOneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		
	}
   
	
	

}
