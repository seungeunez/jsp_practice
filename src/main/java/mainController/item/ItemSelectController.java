package mainController.item;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ItemMapper;

@WebServlet(urlPatterns = {"/item/select.do"})

public class ItemSelectController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Item> list = MyBatisContext.getSqlSession()
				.getMapper(ItemMapper.class).selectItemList("name", "");

		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/item/item_select.jsp").forward(request, response);
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
