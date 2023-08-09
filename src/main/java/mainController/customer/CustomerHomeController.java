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

@WebServlet(urlPatterns= {"/customer/home.do"})
public class CustomerHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 HttpSession httpSession = request.getSession();
	     String role = (String)httpSession.getAttribute("role");
	     
	     if(role == null || role.equals("customer")) {
	    	 
	    	 List<Item> list = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).selectItemListAll();	
	  	   
	 		//대표이미지 번호를 받아서 Item에 추가하기 //customer_home.jsp에서 필요함 고객홈페이지에 가장 먼저 등록한 이미지 출력하려고 사용했음
	 		for(Item obj : list) {
	 			
	 			//mapper를 호출하여 해당물품의 가장먼저등록했던 이미지번호 1개를 가져옴
	 	   		long imageNo = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).selectItemImageMinOne(obj.getNo());
	 	   		
	 	   		obj.setImageNo(imageNo);
	 	   	}
	 	   	 
	 	   	request.setAttribute("list", list);
	 	   	request.getRequestDispatcher("/WEB-INF/member/customer_home.jsp").forward(request, response);
	    	 
	     }else {
	    	 //403페이지 만들기
	     }
		
	     
	/*	
		List<Item> list = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).selectItemListAll();	
	   
		
		//대표이미지 번호를 받아서 Item에 추가하기 //customer_home.jsp에서 필요함 고객홈페이지에 가장 먼저 등록한 이미지 출력하려고 사용했음
		for(Item obj : list) {
			
			//mapper를 호출하여 해당물품의 가장먼저등록했던 이미지번호 1개를 가져옴
	   		long imageNo = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).selectItemImageMinOne(obj.getNo());
	   		
	   		obj.setImageNo(imageNo);
	   	
	   	}
	   	 
	   	request.setAttribute("list", list);
	   	request.getRequestDispatcher("/WEB-INF/member/customer_home.jsp").forward(request, response);
		*/
	     
	   	
	}


	
	
	
}
