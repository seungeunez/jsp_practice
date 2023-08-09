package mainController.customer;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import config.MyBatisContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.PurchaseMapper;

@WebServlet(urlPatterns= {"/customer/deletepurchase.do"})
public class CustomerDeletePurchaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//n개의 값을 받을 때는
		String[] chk = request.getParameterValues("chk[]");
		String id = (String) request.getSession().getAttribute("id");
		
		Map<String, Object> map = new HashMap<>();
		map.put("chk", chk);
		map.put("id", id);
		
		//배열 출력 방법  Arrays.asList() || Arrays.toString()
		System.out.println(Arrays.toString(chk)); 
		
		
		
		MyBatisContext.getSqlSession().getMapper(PurchaseMapper.class).deletePurchase(map);
		response.sendRedirect("mypage.do?menu=4");
	
	
	}
	

	
}
