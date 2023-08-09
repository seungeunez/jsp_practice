package mainController.customer;

import java.io.IOException;

import config.Hash;
import config.MyBatisContext;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.MemberMapper;

@WebServlet(urlPatterns= {"/customer/logout.do"})
public class CustomerLogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//로그아웃을 위한 세션 초기화 시키기
		
		HttpSession httpSession = request.getSession();
	
		httpSession.invalidate(); // 이게 진짜 초기화 완전 처음처럼 만들어버리는

		response.sendRedirect("home.do");
		

	}
	
	
}
