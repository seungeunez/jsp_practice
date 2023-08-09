package mainController.item;

import java.io.IOException;
import java.util.Collection;

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

@WebServlet(urlPatterns = {"/item/imagewritebatch.do"})
@MultipartConfig
public class ItemImageWriteBatchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Long ino = Long.parseLong(request.getParameter("ino"));
		Collection<Part> partList = request.getParts();		
		
		for(Part file : partList) {
			if(file.getName().equals("file[]")) {
				ItemImage obj = new ItemImage();
				obj.setItemno(ino); // 물품 번호
				obj.setFilename(file.getSubmittedFileName()); // 첨부한 파일명
				obj.setFilesize(file.getSize()); // 첨부한 파일 크기
				obj.setFiletype(file.getContentType()); // 첨부한 파일의 종류(gif, jpg, png ...)
				obj.setFiledata(file.getInputStream().readAllBytes()); // 첨부한 파일 실제 데이터

				// mapper로 insert 수행
				// insert all 한 번에 추가하기
				MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).insertItemImageOne(obj);
			}
			
		}

		//상대경로를 이용한 페이지 이동
		response.sendRedirect("imagewrite.do?ino=" + ino);
		
		
	}
}

