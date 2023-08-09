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
import mapper.MemberMapper;

@WebServlet(urlPatterns= {"/seller/join.do"})
public class SellerJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SellerJoinController() {
        super();
    }
    
    //1. 판매자용 회원가입 화면만들기
    //2. 판매자 회원가입용 rest api만들기
    //3. axios.post를 이용한 회원가입

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/member/seller_join.jsp").forward(request, response);
	}

	
}
