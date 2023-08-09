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


//127.0.0.1:8080/web02/api/seller/join.json
@WebServlet(urlPatterns = { "/api/seller/join.json" })
public class RestSellerJoinController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson(); //라이브러리를 이용한 객체 생성
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		
		//해쉬암호
		String hashPW = Hash.hashPW(request.getParameter("id"), request.getParameter("pw"));
		
		//Member 객체 생성
		Member obj = new Member();
		obj.setId(request.getParameter("id"));
		obj.setPassword(hashPW);
		obj.setName(request.getParameter("name"));
		obj.setAge(Integer.parseInt(request.getParameter("age")));
		obj.setRole("seller");
		System.out.println(obj.toString());
		
		//DB에 전송
		int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).insertMemberOne(obj); // 성공하면 1 실패하면 0이 담긴다
		  

		// ret을 json으로 변환
		Map<String, Object> map = new HashMap<>(); //map이 json문서로 바꾸기 쉬워서 쓰는거임
		map.put("ret", ret); //map => {"ret":0} {"ret":"ret값"}
		
		//오브젝트 타입(map인거임 지금은)을 josn으로 변경 (gson을 써서 변경했음)
		String jsonString = gson.toJson(map); 
		
		
		response.setContentType("application/json");
		//호출된 곳으로 값 전송 (실제 전송)
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush(); //여기까지 가서 다시 seller_join.jsp로 가서 ret==1맞는지 확인하고 
	}
}



