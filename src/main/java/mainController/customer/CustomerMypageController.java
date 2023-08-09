package mainController.customer;

import java.io.IOException;
import java.util.List;

import config.Hash;
import config.MyBatisContext;
import dto.Address;
import dto.Member;
import dto.PurchaseView;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.AddressMapper;
import mapper.MemberMapper;
import mapper.PurchaseMapper;

@WebServlet(urlPatterns = { "/customer/mypage.do" })
public class CustomerMypageController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession httpSession = request.getSession();
	    String role = (String)httpSession.getAttribute("role");
	     
	    if(role == null || role.equals("customer")) {
	    	
	    	// 메뉴 읽어오기
			String menu = request.getParameter("menu");

			if (menu == null) { // menu값이 없을 때 자동으로 menu=1로 선택되게 했음
				response.sendRedirect("mypage.do?menu=1");
				return; // 메소드 종료. 아래쪽 실행 안됨
			}

			String id = (String) request.getSession().getAttribute("id");

			if (Integer.parseInt(menu) == 1) { // 정보변경시

				// 아이디를 전송해서 이름과 나이를 받아옴
				Member obj = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).SelectMemberOne(id);
				request.setAttribute("obj", obj);

			} 
			
			if(Integer.parseInt(menu) == 4) {
				
				List<PurchaseView> list =MyBatisContext.getSqlSession().getMapper(PurchaseMapper.class).selectPurchaseViewMember(id);
				request.setAttribute("list", list);
				
			} else if(Integer.parseInt(menu) == 5) {
				
				List<Address> list =MyBatisContext.getSqlSession().getMapper(AddressMapper.class).selectAddressList(id);
				request.setAttribute("list", list);
				
			}

			request.getRequestDispatcher("/WEB-INF/member/customer_mypage.jsp").forward(request, response);
	 		
	    }else {
	    	 
	    }


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int menu = Integer.parseInt(request.getParameter("menu"));

		String id = (String) request.getSession().getAttribute("id");
		String pw = request.getParameter("pw");
		String hashPW = Hash.hashPW(id, pw);

		if (menu == 1) { // 회원정보 수정

			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));

			// mapper호출 후 변경하기
			Member obj = new Member();
			obj.setId(id);
			obj.setName(name);
			obj.setAge(age);

			int ret= MyBatisContext.getSqlSession().getMapper(MemberMapper.class).updateMemberOne(obj);

			if(ret == 1) {
				request.setAttribute("message", "회원정보 변경 성공");
				request.setAttribute("url", "mypage.do?menu=" + menu);
				request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);
			}else {
				request.setAttribute("message", "회원정보 변경 실패");
				request.setAttribute("url", "mypage.do?menu=" + menu);
				request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);
			}
			
			

		} else if (menu == 2) { // 비밀번호 변경

			String pw1 = request.getParameter("pw1");
			String newhashPW = Hash.hashPW(id, pw1);

			Member obj = new Member();
			obj.setId(id);
			obj.setPassword(hashPW);
			obj.setNewpassword(newhashPW);
			
			System.out.println(obj.toString());

			int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).updatePWMember(obj);

			if (ret == 1) {
				request.setAttribute("message", "비밀번호 변경 성공");
				request.setAttribute("url", "home.do");
				request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);

			} else {
				request.setAttribute("message", "비밀번호 변경 실패");
				request.setAttribute("url", "mypage.do?menu=" + menu);
				request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);
			}

		} else if (menu == 3) { // 회원탈퇴

			Member obj = new Member();
			obj.setId(id);
			obj.setPassword(hashPW);

			int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).DeleterMember(obj);

			if (ret == 1) {

				HttpSession httpSession = request.getSession();
				httpSession.invalidate();

				request.setAttribute("message", "회원탈퇴 성공");
				request.setAttribute("url", "login.do");
				request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);

			} else {

				request.setAttribute("message", "회원탈퇴 실패...ㅜ.!");
				request.setAttribute("url", "mypage.do?menu=" + menu);
				request.getRequestDispatcher("/WEB-INF/alert.jsp").forward(request, response);
			}

		} 

	}

}
