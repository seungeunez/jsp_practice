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
import jakarta.servlet.http.HttpSession;
import mapper.MemberMapper;

@WebServlet(urlPatterns= {"/customer/login.do"})
public class CustomerLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		request.getRequestDispatcher("/WEB-INF/member/customer_login.jsp").forward(request, response);
		
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		//전송되는 4개 값 받기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		
		//static클래스 호출해서 기능 사용 (암호 hash)
		String hashPW = Hash.hashPW(id, pw);
		
		
		Member obj = new Member();
		obj.setId(id);
		obj.setPassword(hashPW);

		System.out.println(obj.toString()); // 확인용
		
		
		//mapper를 이용해서 추가
		Member ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).SelectMemberLogin(obj);
		
		
		if(ret != null ) {
			
			
			if(ret.getRole().equals("customer")) {
				//세션에 기록하기 기본시간 30분
				
				//세션에 기록 또는 읽기 위한 객체 생성 (로그인성공했을 때 세션사용하기) 세션은 서버당 1개씩  짐 
				HttpSession httpSession = request.getSession();
				
				// 세션에 필요한 정보를 기록 ex)아이디, 이름을 기록 (30분간 유지) 비밀번호는 기록 x
				httpSession.setAttribute("id", ret.getId());// ret에 저장되어있으니 ret에서 id를 갖고 오면 된다
				httpSession.setAttribute("role", ret.getRole());
				httpSession.setAttribute("name", ret.getName());
				httpSession.setAttribute("age", ret.getAge());
				
				//필터에서 url설정했음 
				String url = (String) httpSession.getAttribute("url");
				System.out.println("login.do =>" + url);
				
				//마지막 페이지로 이동될 수 있게 변경해야함 //필터에서 url설정했음 
				if(url == null) {
					response.sendRedirect("home.do"); 
				}else { //마지막 페이지로 이동될 수 있게 변경 // 필터했던 url
					response.sendRedirect(url);
				}
				
				return; //메소드 종료
				
			}else {
				request.setAttribute("message", "고객용 로그인 창입니다.");
				request.setAttribute("url", "login.do");
				request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);
			}
			
			
		}
		//절대경로
//		response.sendRedirect(request.getContextPath() + "/customer/login.do");
		
		

	}
	
	
}
