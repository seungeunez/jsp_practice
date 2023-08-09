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

@WebServlet(urlPatterns= {"/customer/deleteAddress.do"})
public class CustomerAddressDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String) request.getSession().getAttribute("id");
		Long no = Long.parseLong(request.getParameter("no"));
		
		Address obj = new Address();
		obj.setNo(no);
		obj.setMemberid(id);
		
		int ret = MyBatisContext.getSqlSession().getMapper(AddressMapper.class).deleteAddressOne(obj);
		
		if(ret == 1) {
			response.sendRedirect("mypage.do?menu=5");
			return;
		}
		response.sendRedirect("mypage.do?menu=5");
		

		
	}
	
	
	


	
	
	
}
