package mainController.item;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.ItemImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mapper.ItemImageMapper;

@WebServlet(urlPatterns = {"/item/imagewrite.do"})
@MultipartConfig
public class ItemImageWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//1. 주소창의 물품번호 가져오기
		String ino = request.getParameter("ino");
		request.setAttribute("ino", ino); // value="${ino}
		
		
		//2. 물품번호에 해당하는 이미지 번호들
		List<Long> imageNo = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).selectItemImageNo(Long.parseLong(ino));
		request.setAttribute("imageNo", imageNo);
		
		
		//3. 화면 나오게함 (마지막) 순서중요
		request.getRequestDispatcher("/WEB-INF/item/item_image_write.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Long ino = Long.parseLong(request.getParameter("ino"));
		Part file = request.getPart("file");
		
		ItemImage obj = new ItemImage();
		obj.setItemno(ino); // 물품 번호
		obj.setFilename(file.getSubmittedFileName()); // 첨부한 파일명
		obj.setFilesize(file.getSize()); // 첨부한 파일 크기
		obj.setFiletype(file.getContentType()); // 첨부한 파일의 종류(gif, jpg, png ...)
		obj.setFiledata(file.getInputStream().readAllBytes()); // 첨부한 파일 실제 데이터
		System.out.println(obj);
		
		//mapper로 추가 후
		int ret = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).insertItemImageOne(obj);
		

		if (ret == 1) {
		
			//절대 경로를 이용한 페이지 이동
			response.sendRedirect(request.getContextPath() + "/item" + "/imagewrite.do?ino=" + ino);

		} else { 
			
			//상대경로를 이용한 페이지 이동
			response.sendRedirect("imagewrite.do?ino=" + ino);
		}
		
	}
}

