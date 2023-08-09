package mainController.customer;

import java.io.IOException;

import config.MyBatisContext;
import dto.Address;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.AddressMapper;

@WebServlet(urlPatterns= {"/customer/insertaddress.do"})
public class CustomerAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = (String) request.getSession().getAttribute("id");
		
		Address obj = new Address();
		
		obj.setMemberid(id);
		obj.setPostcode(request.getParameter("postcode"));
		obj.setAddress(request.getParameter("address") + " "
						+ request.getParameter("detailAddress") 
						+ request.getParameter("extraAddress"));	//원랜 테이블 만들 때 상세주소, 비고 등 총 3개를 만들었어야 했음
		
		int ret = MyBatisContext.getSqlSession().getMapper(AddressMapper.class).insertAddressOne(obj);
		
		if(ret == 1) {
			response.sendRedirect("mypage.do?menu=5");
			return;
		}
		
		response.sendRedirect("mypage.do?menu=5");
			
		
		
		
		

		
	}
	
	
	


	
	
	
}
