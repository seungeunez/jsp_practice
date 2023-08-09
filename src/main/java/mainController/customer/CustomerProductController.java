package mainController.customer;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.ItemImageMapper;
import mapper.ItemMapper;

@WebServlet(urlPatterns= {"/customer/product.do"})
public class CustomerProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();
	    String role = (String)httpSession.getAttribute("role");
	     
	    if(role == null || role.equals("customer")) {
	    	
	    	String itemno = request.getParameter("itemno");
			
			if(itemno == null) {
				response.sendRedirect("home.do");
				return;
			}
			
			//itemmapper에서 물품정보 받기
			Item obj = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).selectItemOne(Long.parseLong(itemno));
			request.setAttribute("obj", obj);
			
			
			//itemimage에서 물품이미지 번호 받기
			List<Long> imageNo = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).selectItemImageNo(Long.parseLong(itemno));
			request.setAttribute("imageNo", imageNo);
			
		   	request.getRequestDispatcher("/WEB-INF/member/customer_product.jsp").forward(request, response);
	 		
	    }else {
	    	 //에러 페이지 뜨ㅣ우기
	    }
		
		
	   	
	}


	
	
	
}
