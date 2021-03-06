package hana.ti.stock.vo;

public class StockVO {

	private String id;
	private String code;
	private String name;
	private String sector;
	private String reg_date;
	private int price;
	private int flag;
	
	
	
	public StockVO() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSector() {
		return sector;
	}
	public void setSector(String sector) {
		this.sector = sector;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "StockVO [id=" + id + ", code=" + code + ", name=" + name + ", sector=" + sector + ", reg_date="
				+ reg_date + ", price=" + price + ", flag=" + flag + "]";
	}
	
	
	
	
}
