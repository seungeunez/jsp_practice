package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Board;
import dto.Item;

@Mapper
public interface ItemMapper {
	
	// #{ } => 값을 표현할때
	// ${ } => 컬럼명, 테이블명 등.
	
	//물품 등록
	@Insert({ " INSERT INTO item(name, content, price, quantity) VALUES(#{obj.name}, #{obj.content}, #{obj.price}, #{obj.quantity}) " })
	public int insertItemOne(@Param("obj") Item obj);
	
	
	//물품 조회 (조건) 
	@Select({" SELECT i.* FROM item i WHERE ${column} LIKE '%' || #{text} || '%' ORDER BY no DESC "})
	public List<Item> selectItemList(@Param("column") String column, @Param("text")String text);
	
	
	//전체 개수 (페이지네이션용)
	@Select({" SELECT COUNT(*) cnt FROM item "})
	public long countItemList();
	
	
	// 원하는 페이지 출력?
	@Select({" SELECT i.* FROM( ",
		 " SELECT i.*, ROW_NUMBER() OVER (ORDER BY no DESC) rown FROM item i )i ", 
		 " WHERE rown >= #{start} AND rown <= #{end} ORDER BY no DESC "})
	public List<Item> selectItemListPage(@Param("start") int start, @Param("end") int end);
	
	
	//물품 전체 조회 //얘도 고객 홈 화면에 이미지 전체 출력 용도임 CustomerHomeController.java 와 customer_home.jsp에서 사용했슴둥
	@Select({" SELECT i.* FROM item i ORDER BY no DESC "})
	public List<Item> selectItemListAll();
	
	
	//물품 1개 조회
	@Select({" SELECT i.* FROM item i WHERE no=#{no}"})
	public Item selectItemOne(@Param("no") long no);
	
	

}
