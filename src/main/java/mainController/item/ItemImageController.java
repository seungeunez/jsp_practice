package mainController.item;

import java.io.IOException;

import config.MyBatisContext;
import dto.ItemImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ItemImageMapper;


//컨트롤러 아니고, DB에 있는 이미지를 url형태로 변경해서 반환
// jsp에서 src에 이미지의 위치를 설정하는 용도로 사용
// <img src="/web02/item/image?no=1004" style="width:60px; height:60px;" />

@WebServlet(urlPatterns = {"/item/image"})
public class ItemImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ItemImageController() {
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ItemImageMapper mapper 
			= MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class);
		
		long no = Long.parseLong(request.getParameter("no"));
		
		// no를 전달하여 mapper에서 ItemImage 정보 1개 가져옴
		ItemImage obj = mapper.selectItemImageOne(no);
		
		// 이미지라는 것을 알려줌
		response.setContentType(obj.getFiletype()); // 이건 이미지다. html이 아니다
		response.setStatus(200); // 200은 정상적인 처리 결과다
		response.getOutputStream().write(obj.getFiledata()); // 이게 실제 정보다	
	}
	
	// src 태그는 get만 가능
	
	// 크롬에게 html로 구성된 파일이다라고 알려주는 것
	// request.getRequestDispatcher("/WEB-INF/itemimageinsert1.jsp").forward(request, response);
}
