package restController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import config.MyBatisContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.BoardMapper;

//목적: 데이터베이스 일부를 변경하는 것 (조회수를)
//변경은 PUT (조회수 수정)
@WebServlet(urlPatterns = { "/api/board/updatehit.json" })
public class RestBoardUpdateHitController extends HttpServlet {

	private Gson gson = new Gson(); //라이브러리를 이용한 객체 생성
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글 번호 받기
		String strNo = request.getParameter("no");
		
		//형변환
		Long no = Long.parseLong(strNo);
		
		
		//DB전송
		int ret = MyBatisContext.getSqlSession().getMapper(BoardMapper.class).updateBoardHit(no);
		
		
		
		// 전달할 값을 map타입으로 설정
		// ret을 json으로 변환
		Map<String, Integer> map = new HashMap<>();
		map.put("result", ret); //ret에 1이 담겨있을테니 ret로 받음
		response.setContentType("application/json");
		String res = gson.toJson(map);
		
		//호출된 곳으로 값 전송
		PrintWriter out = response.getWriter();
		out.print(res);
		out.flush();
	}
	
	

}
