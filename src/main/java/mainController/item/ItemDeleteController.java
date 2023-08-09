package mainController.item;

import java.io.IOException;

import config.MyBatisContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ItemImageMapper;

@WebServlet(urlPatterns= {"/item/imagedelete.do"})
public class ItemDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ItemDeleteController() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Long ino = Long.parseLong(request.getParameter("ino")); //name 값
		Long imageNo = Long.parseLong(request.getParameter("imageno")); //name 값

		
		//mapper를 통해 데이터 삭제
		int ret = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).deleteItemImageOne(imageNo);
		
		
		//적절한 페이지로 이동
		if(ret == 1) {
			
			//절대 경로를 이용한 페이지 이동
			response.sendRedirect(request.getContextPath() + "/item" + "/imagewrite.do?ino="+ino);
			
		} else {
			
			//상대 경로를 이용한 페이지 이동
			response.sendRedirect("imagewrite.do?ino="+ino);
		}
		
	
	}

}
