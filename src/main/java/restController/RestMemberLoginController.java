package restController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import config.Hash;
import config.MyBatisContext;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.MemberMapper;


//127.0.0.1:8080/web02/api/member/login.json
@WebServlet(urlPatterns = { "/api/member/login.json" })
public class RestMemberLoginController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson(); //라이브러리를 이용한 객체 생성
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		String hashPW = Hash.hashPW(request.getParameter("id"), request.getParameter("pw"));
		
		Member obj = new Member();
		obj.setId(request.getParameter("id"));
		obj.setPassword(hashPW);
		System.out.println(obj.toString());
		
		Member ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).SelectMemberLogin(obj);
		  
		
		response.setContentType("application/json");
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("ret", 0); //실패시
		
		if(ret != null) {
			
			//react.js, vue.js등의 프런트엔드 프레임워크 개발시 토큰을 발행시킴
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("id", ret.getId());// ret에 저장되어있으니 ret에서 id를 갖고 오면 된다
			httpSession.setAttribute("role", ret.getRole());
			httpSession.setAttribute("age", ret.getAge());
			httpSession.setAttribute("name", ret.getName());
			
			map.put("ret", 1); //성공시
			
		}

		String jsonString = gson.toJson(map);
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();
	}
}



