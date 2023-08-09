package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.ItemImage;


@Mapper
public interface ItemImageMapper {
	
	
	//이미지 등록
	@Insert({
		" INSERT INTO itemimage(filename, filesize, filetype, filedata, itemno) ",
		" VALUES(#{obj.filename}, #{obj.filesize}, #{obj.filetype}, #{obj.filedata}, #{obj.itemno}) "
	})
	public int insertItemImageOne( @Param("obj") ItemImage obj );

	
	//이미지 1개 조회
	@Select({" SELECT * FROM itemimage WHERE no=#{no} "})
	public ItemImage selectItemImageOne(@Param("no") long no); 
	
	
	//물품번호를 이용해서 관련된 전체 이미지 
	@Select({" SELECT i.no FROM itemimage i WHERE itemno=#{itemno} ORDER BY no DESC"})
	public List<Long> selectItemImageNo(@Param("itemno") long itemno);
	
	
	//이미지 삭제
	@Delete({ " DELETE FROM itemimage WHERE no=#{no} " })
	public int deleteItemImageOne(@Param("no") long no);
	
	//이미지 수정
	@Update({" UPDATE itemimage ",
        " SET filename = #{obj.filename}, filedata = #{obj.filedata}, filetype = #{obj.filetype}, filesize = #{obj.filesize} ",
        " WHERE no = #{obj.no} AND itemno=#{obj.itemno}"})
	public int updateItemImageOne(@Param("obj") ItemImage obj);
	
	//물품번호를 받아서 해당하는 이미지 1개 반환 없으면 0 반환 //가장먼저 등록한 이미지 출력하기
	@Select({"SELECT NVL(MIN(no),0) FROM itemimage WHERE itemno = #{itemno}"})
	public long selectItemImageMinOne(@Param("itemno") long itemno);
}
