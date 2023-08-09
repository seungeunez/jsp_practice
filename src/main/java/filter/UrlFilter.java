package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

// home(o) -> login(x) -> home(o)
// board(기록o) -> login(기록x) -> board(기록o)

//로그에서 이전페이지 이동을 위한 필터
// 로그인 페이지만 기록이 안 됨
@WebFilter(urlPatterns = { "/customer/*", "/board/*" })
public class UrlFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) arg0;
		

		HttpSession httpSession = request.getSession();
		String uri = request.getRequestURI();

		if (!uri.contains("login.do") && !uri.contains("logout.do")) {
			
			// home.do => null => queryString이 null임
			// product.do?itemno=33 => itemno=33 => queryString이 itemno=33임 ?는 없음.
			String queryString = request.getQueryString();
			
			if (queryString == null) {
				httpSession.setAttribute("url", request.getRequestURI());
				System.out.println("url filter => " + request.getRequestURI());
			} else {
				httpSession.setAttribute("url", request.getRequestURI() + "?" + queryString);
				System.out.println("url filter => " + request.getRequestURI()+"?" + queryString); //queryString 이게 ?뒤의 값임
			}
		}

		arg2.doFilter(arg0, arg1);

	}

}
