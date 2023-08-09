package dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString(exclude= {"filedata"})
@AllArgsConstructor
@NoArgsConstructor

public class ItemImage {

	private long no;
	private String filename;
	private byte[] filedata; //blob
	private String filetype;	
	private long filesize;
	private long itemno;
	private Date regdate;
}
