package mainController;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns= {"/map.do"})
public class LoginController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public LoginController() {
        super();
    }
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/main/map.jsp").forward(request, response);
	}
	
	

}
