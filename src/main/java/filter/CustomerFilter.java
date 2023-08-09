package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//일부의 기능을 공통으로 써야할 때 필터사용하면 된다.

//List<> a = new ArrayList<>();
//List = ServletRequest(상위-부모) /ArrayList  HttpServletRequest(하위-자식) 느낌 
//메소드는 부모가 더 많을 순 없다 자식이 더 많지

//127.0.0.1:8080/web02/customer/home.do
//127.0.0.1:8080/web02/customer/mypage.do 
//127.0.0.1:8080/web02/customer/orderlist.do

//내가 urlPatterns에 적어준 곳에서만 필터 걸림 (특정주소에서만 필터걸림)
//내가 적어준 곳에 들어가게 될 때 로그인이 되어있으면 잘 들어가지고 아니면 로그인 창으로 이동하게 된다

//로그인을 해야되는 페이지 체크용으로만 사용
// 필터 순서: 상세하게 적힌 것부터 먼저 수행함
@WebFilter(urlPatterns = {"/customer/mypage.do", "/customer/orderlist.do", "/customer/purchase.do"})
public class CustomerFilter implements Filter{

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) //Http가 안붙어 있음 
			throws IOException, ServletException {
		
		
		//필터를 통과해서 customerMypageController로 들어가는거임
		//컨트롤러 가기전에 수행해야 하는 작업들..
		//1.로그인이 되었는지 확인
		//2. 로그인이 안되어있다면 로그인 페이지로 이동하기
		//3. 로그인이 되었다면 컨트롤러 정상진입
		
		//형변환 해야함 // ar0. 과 rquest. 의 메소드의 수가 차이나기 때문에 형변환 해야함
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		
		//System.out.println("customer fileter => " + request.getRequestURI()); //필터가 잘 먹히는지 확인용
		
		//로그인이 되었는지 고객권한을 갖고 있는지 확인하고 마이페이지로 이동해야함
		// 로그인이 안됐을 경우 => 로그인창으로 이동
		// 판매자일 경우 => 고객 마이페이지로 이동되면 안됨
		
		//세션 객체 생성
		HttpSession httpSession = request.getSession();
		//세선에서 아이디 및 권한 정보 얻기
		String sessionId = (String)httpSession.getAttribute("id");
		
		
		//세션 정보 존재 유무 확인
		if(sessionId == null) { // 세션 객체 없으면 로그인 페이지로 이동 //근데 지금은 해당이 안됨 UrlFilter에서 처리한다고 지금 여기는 그냥 해둔 상태
			//로그인 가기전에 현재 주소를 세션에 보관해놓고,
//			httpSession.setAttribute("url", request.getRequestURI() );
			//로그인 창으로 이동
			response.sendRedirect("login.do");
			//response.sendRedirect("login.do?request.getRequestURI()");
			return; //메소드를 종료시킴
		}
		
		
		//컨트롤러로 정산진입 (아이디가 있으면 원래 수행하고자 하는 페이지로 이동)
		arg2.doFilter(arg0, arg1); //얘를 만나야 customer/mypage.do로 이동이 가능하다
		
	}
	
	

}
