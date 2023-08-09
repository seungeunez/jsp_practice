package dto;

import java.util.Date;

import lombok.Data;

@Data
public class PurchaseView {
	
	private long no;
	private String name;
	private String customerid;
	private Date regdate;
	private long itemno;
	private String itemname;
	private long itemprice;
	private long cnt;

}
