package restController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import config.MyBatisContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.PurchaseMapper;


//127.0.0.1:8080/web02/api/purchase/member.json

@WebServlet(urlPatterns = { "/api/purchase/member.json" })
public class RestPurchaseMemberController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson(); //라이브러리를 이용한 객체 생성

	

	//조회하는거니깐 GET이 맞음 post맨에서도 get으로 테스트 해봐야함
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		//mapper를 이용해서 회원별 주문수량 합계	
		response.setContentType("application/json");
		List<Map<String, Object>> list = MyBatisContext.getSqlSession().getMapper(PurchaseMapper.class).selectMemberGroup();
		System.out.println(list.toString());

		String jsonString = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();
	}
}



