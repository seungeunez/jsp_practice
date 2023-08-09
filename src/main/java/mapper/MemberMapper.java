package mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Member;

@Mapper
public interface MemberMapper {
	
	//회원가입
	@Insert({" INSERT INTO member(id, password, name, age, role) ", 
			 " VALUES(#{obj.id}, #{obj.password}, #{obj.name}, #{obj.age}, #{obj.role}) "})
	public int insertMemberOne(@Param("obj") Member obj);
	
	//사용가능한 아이디인지 체크 (회원가입할 때 필요)
	@Select({" SELECT COUNT(*) cnt FROM member WHERE id=#{id} "})
	public int selectMemberIDCheck(@Param("id") String id);
	
	//로그인
	@Select({" SELECT id, name, age, role FROM member WHERE id=#{obj.id} AND password=#{obj.password} "})
	public Member SelectMemberLogin(@Param("obj") Member obj);
	
	//1명 조회
	//보안상의 문제 & 항상 최신의 데이터를 가져오기 위해서 세션에 저장된 정보는 가져오지 않는다. (무조건 DB에 있는 정보를 갖고 온다 DB값이 최신정보임)
	@Select({" SELECT id, name, age, role FROM member WHERE id=#{id} "})
	public Member SelectMemberOne(@Param("id") String id);

	//회원 탈퇴
	//@Delete({" DELETE FROM member WHERE id=#{obj.id} AND password=#{obj.password} "})
	//public int DeleteMemberOne(@Param("obj") Member obj);
	
	//회원탈퇴
	@Update({" UPDATE member SET password=null, name=null, age=0, regdate=null, role=null WHERE id=#{obj.id} AND password=#{obj.password} "})
	public int DeleterMember(@Param("obj") Member obj);
	
	//정보 변경
	//보안상의 문제 & 항상 최신의 데이터를 가져오기 위해서 세션에 저장된 정보는 가져오지 않는다. (무조건 DB에 있는 정보를 갖고 온다 DB값이 최신정보임)
	@Update({" UPDATE member SET name=#{obj.name}, age=#{obj.age} WHERE id=#{obj.id} "})
	public int updateMemberOne(@Param("obj") Member obj);
	
	//비밀번호 변경
	@Update({" UPDATE member SET password=#{obj.newpassword} WHERE id=#{obj.id} AND password=#{obj.password}"})
	public int updatePWMember(@Param("obj") Member obj);
	

	
	
}
