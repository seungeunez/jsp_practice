package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Board;

@Mapper
public interface BoardMapper {
	
	
	// insert, delete, update들은 int로 반환해야한다 (무조건)
	// select는 list, obejct int.. 등 다양함
	
	//글쓰기
	@Insert({" INSERT INTO board(title, content, writer) VALUES(#{obj.title}, #{obj.content}, #{obj.writer}) "})
	public int insertBoardOne(@Param("obj") Board obj);
	
	//전체 목록
	@Select({" SELECT * FROM board ORDER BY no DESC "})
	public List<Board> selectBoardList();
	
	//전체 개수 (페이지네이션용)
	@Select({" SELECT COUNT(*) cnt FROM board "})
	public long countBoardList();
	
	
	// 원하는 페이지 출력?
	@Select({" SELECT b.* FROM( ",
		 " SELECT b.*, ROW_NUMBER() OVER (ORDER BY no DESC) rown FROM board b )b ", 
		 " WHERE rown >= #{start} AND rown <= #{end} ORDER BY no DESC "})
	public List<Board> selectBoardListPage(@Param("start") int start, @Param("end") int end);
	
	//조회수 증가 (글 번호가 오면 해당 글 번호 조회수만 +1 증가함)
	@Update({" UPDATE board SET hit=hit+1 WHERE no=#{no}" })
	public int updateBoardHit(@Param("no") long no); 
	
	
	//게시글 하나 출력
	@Select({"SELECT * FROM board WHERE no=#{no}"})
	public Board selectOneBoard(@Param("no") long no);
	
	
	//다음글 넘기기
	@Select({"SELECT NVL(MIN(no),0) FROM board WHERE no > #{no}"})
	public int nextBoardOne(@Param("no") long no);
	
		
	//이전글로 넘어가기
	@Select({"SELECT NVL(MAX(no),0) FROM board WHERE no < #{no}"})
	public int preBoardOne(@Param("no") long no);
	
	//게시글 1개 삭제
	@Delete({"Delete FROM board WHERE no=#{no}"})
	public int deleteBoardone(@Param("no") long no );
	

}
