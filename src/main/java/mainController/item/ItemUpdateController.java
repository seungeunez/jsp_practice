package mainController.item;

import java.io.IOException;

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

@WebServlet(urlPatterns = { "/item/imageupdate.do" })
@MultipartConfig() /*사진관련된거엔 꼭 필수임!*/
public class ItemUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ItemUpdateController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Long ino = Long.parseLong(request.getParameter("ino")); // 물품번호
		Long imageNo = Long.parseLong(request.getParameter("imageNo")); // 이미지 번호
		Part file = request.getPart("file"); // 첨부한 파일
		
		System.out.println(ino.toString());
		System.out.println(imageNo.toString());

		if (file.getSize() > 0) { // 파일이 첨부되었을때

			ItemImage obj = new ItemImage();
			obj.setNo(imageNo);
			obj.setItemno(ino);
			obj.setFilename(file.getSubmittedFileName()); // 첨부한 파일명
			obj.setFilesize(file.getSize()); // 첨부한 파일 크기
			obj.setFiletype(file.getContentType()); // 첨부한 파일의 종류(gif, jpg, png ...)
			obj.setFiledata(file.getInputStream().readAllBytes()); // 첨부한 파일 실제 데이터

			int ret = MyBatisContext.getSqlSession().getMapper(ItemImageMapper.class).updateItemImageOne(obj);

			if (ret == 1) { // 이미지 변경 성공했을때
				request.setAttribute("message", "변경완료했습니다");
				request.setAttribute("url", "imagewrite.do?ino="+ino );
				request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);
			} else { // 변경 완료 안됨
				request.setAttribute("message", "변경실패했습니다");
				request.setAttribute("url", "imagewrite.do?ino="+ino );
				request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);
			}
		}
		else { // 변경사항 없습니다.
			request.setAttribute("message", "변경 사항 없음");
			request.setAttribute("url", "imagewrite.do?ino="+ino );
			request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);
			
		}
	}

}
