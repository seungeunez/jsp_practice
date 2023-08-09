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
import mapper.MemberMapper;


//127.0.0.1:8080/web02/api/member/idcheck.json?id=중복확인용_아이디
@WebServlet(urlPatterns = { "/api/member/idcheck.json" })
public class RestMemberIDCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson(); //라이브러리를 이용한 객체 생성

	public RestMemberIDCheckController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		String id = request.getParameter("id");
        
      // 아이디를 전달하면 존재하면 1 없으면 0 반환
		int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).selectMemberIDCheck(id);
		  
		response.setContentType("application/json");
		  
		Map<String, Object> map = new HashMap<>();
		map.put("ret", ret);
		String jsonString = gson.toJson(map);
		  
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

	}

}
