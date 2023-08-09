package mainController.item;

import java.io.IOException;

import config.MyBatisContext;
import dto.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;
import mapper.ItemMapper;

@WebServlet(urlPatterns= {"/item/write.do"})
public class ItemWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ItemWriteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//main.jsp 파일 랜더링
		request.getRequestDispatcher("/WEB-INF/item/item_write.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Item item = new Item();
		item.setName(request.getParameter("name")); //()안에 들어가는건 jsp에 있는 name 속성 값들임
		item.setContent(request.getParameter("content"));
		item.setPrice(Long.parseLong(request.getParameter("price")));
		item.setQuantity(Long.parseLong(request.getParameter("quantity")) );
		//System.out.println(item.toString()); //전달받은 값 확인용
		
		//mapper를 통해 데이터 추가
		int ret = MyBatisContext.getSqlSession().getMapper(ItemMapper.class).insertItemOne(item);
		
		
		if(ret == 1) {
			
			//절대 경로를 이용한 페이지 이동
			response.sendRedirect(request.getContextPath() + "/item" + "/select.do");
			
			//상대 경로를 이용한 페이지 이동
			//response.sendRedirect("select.do");
			
		} else {
			
			//상대 경로를 이용한 페이지 이동
			response.sendRedirect("write.do");
		}
		
	
	}

}
