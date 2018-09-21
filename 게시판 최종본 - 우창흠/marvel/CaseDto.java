package marvel;

import java.util.Calendar;

public class CaseDto {
	private String id, time, ip, passwd, no, title, content, type, area, status, detail, heroes;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHeroes() {
		return heroes;
	}

	public void setHeroes(String heroes) {
		this.heroes = heroes;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getTime() {
		return time;
	}

	public void setTime() {
		Calendar cal = Calendar.getInstance();
		time = cal.get(Calendar.YEAR) + "년" + (cal.get(Calendar.MONTH)+1) + "월"+ (cal.get(Calendar.DATE)) + "일" ;
		
	}
	public void setTime(String time) {
		this.time = time;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String name) {
		this.no = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	
}
