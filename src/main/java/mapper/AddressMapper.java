package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Address;

@Mapper
public interface AddressMapper {
	
	
	//주소넣기
	@Insert({" INSERT INTO address(postcode, address, memberid) VALUES(#{obj.postcode}, #{obj.address}, #{obj.memberid}) "})
	public int insertAddressOne(@Param("obj") Address obj);

	
	//조회
	@Select({"SELECT * from address where memberid=#{id}"})
	public List<Address> selectAddressList(@Param("id") String id);

	
	//삭제
	@Delete({"DELETE FROM address WHERE no=#{obj.no} AND memberid=#{obj.memberid}"})
	public int deleteAddressOne(@Param("obj") Address obj);


}
