package mainController.purchase;

import java.io.IOException;

import config.MyBatisContext;
import dto.Purchase;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.ItemImageMapper;
import mapper.PurchaseMapper;

@WebServlet(urlPatterns= {"/purchase/select.do"})
public class PurchaseSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//select.do라고 떠서 강제로 select.do?menu=1로 설정되게 했음
		String menu =  request.getParameter("menu");
		if(menu == null) {
			response.sendRedirect("select.do?menu=1");
			return; //메소드 종료
		}
		
		request.getRequestDispatcher("/WEB-INF/member/purchase_select.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		

		
	}
	
	
	


	
	
	
}
