package mainController.customer;

import java.io.IOException;

import config.Hash;
import config.MyBatisContext;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.MemberMapper;

@WebServlet(urlPatterns= {"/customer/join.do"})
public class CustomerJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CustomerJoinController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		request.getRequestDispatcher("/WEB-INF/member/customer_join.jsp").forward(request, response);
		//getRequestDispatcher는 객체가 전달될 경로 지정하는거고 forward를 통해 지정된 경로로 request, response 객체 전달
		//클라이언트가 보낸 request 객체를 전달한 경로를 getRequestDispatcher() 메서드로 지정함
		//forward()는 사용자 요청에 의해 컨테이너에서 생성된 request와 response를 다른 리소스(jsp, 서블릿, html)로 넘겨주는 역할임
		// response와 forward의 차이는 forward는 일부러 response하지 않고 응답을 끌면서 다른 리소스로 전달하는 거임
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		//전송되는 4개 값 받기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		//객체 생성 role => CUSTOMER // dto 추가
		
		//static클래스 호출해서 기능 사용 (암호 hash)
		String hashPW = Hash.hashPW(id, pw);
		
		
		Member obj = new Member();
		obj.setId(id);
		obj.setPassword(hashPW);
		obj.setName(name);
		obj.setAge(age);
		obj.setRole("customer"); //default값으로 들어가서 굳이 안해줘도 됨 근데 난 안하니깐 안들어갔음.. 이유는..?
		System.out.println(obj.toString()); // 확인용
		
		
		//mapper를 이용해서 추가
		int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).insertMemberOne(obj);
		
		
		if(ret == 1) {
			response.sendRedirect("home.do"); // sendRedirect()를 쓰면 클라이언트와 서버간 통신이 끝남 // 응답을 끝내는 역할이라고 생각하면 됨
		}else {
			//절대경로
			response.sendRedirect(request.getContextPath() + "/customer/join.do");
			//customer
		}
		

	}
	
	
}
