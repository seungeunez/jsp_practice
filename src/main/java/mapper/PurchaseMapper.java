package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Purchase;
import dto.PurchaseView;

@Mapper
public interface PurchaseMapper {
	
	
	//주문하기
	@Insert({" INSERT INTO purchase(cnt, itemno, customerid) VALUES(#{obj.cnt}, #{obj.itemno}, #{obj.customerid}) "})
	public int insertPurchaseOne(@Param("obj") Purchase obj);
	
	
	//현재 로그인한 사용자가 주문한 내역 조회하기 (주문정보만)
	@Select({" SELECT * FROM purchase WHERE customerid=#{id}  "})
	public List<Purchase> selectPurchaseMember(@Param("id") String id);
	
	
	// 주문+고객+물품을 조인한 purchaseview만들기
	//주문번호, 주문수량, 주문일자, 주문아이디, 주문자 이름, 물품명, 물품가격
	@Select({" SELECT * FROM purchaseview WHERE customerid=#{id} ORDER BY no DESC "})
	public List<PurchaseView> selectPurchaseViewMember(@Param("id") String id);
	
	
	@Delete({
		" <script> ", 
		" DELETE FROM purchase WHERE customerid=#{map.id} AND no IN( ",  //map에 담겨있는 id 쓰는 것
			" <foreach collection='map.chk' item='tmp' separator=','> ",
				" #{tmp} ",
			" </foreach> ",
		"  ) ", 
		" </script> "}) 
	
	// DELETE * FROM 테이블명 WHERE customerid='acc' AND no=(1,2,3,4);
	public int deletePurchase(@Param("map") Map<String, Object> map);
	
	
	//회원별 주문 수량 합계
	@Select({" SELECT customerid, SUM(cnt) cnt FROM purchase GROUP BY customerid "})
	public List<Map<String, Object>> selectMemberGroup(); //전체를 할 거라 조건이 없음


}
