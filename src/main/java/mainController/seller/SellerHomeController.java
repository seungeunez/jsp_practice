package mainController.seller;

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


//127.0.0.1:8080/web02/seller/home.do
@WebServlet(urlPatterns= {"/seller/home.do"})
public class SellerHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SellerHomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession httpSession = request.getSession();
	    String role = (String)httpSession.getAttribute("role");
	    if(role == null || role.equals("seller")) {
		
	    	request.getRequestDispatcher("/WEB-INF/member/seller_home.jsp").forward(request, response);
	    	
	    }else {
	    	
	    	//403페이지 만들기
	    	
	    }
		
	}


	
	
	
}
