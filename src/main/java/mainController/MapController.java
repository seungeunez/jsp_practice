package mainController;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns= {"/auth.do"})
public class MapController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public MapController() {
        super();
    }
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/main/login.jsp").forward(request, response);
	}
	
	

}
