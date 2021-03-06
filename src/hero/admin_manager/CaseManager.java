package hero.admin_manager; 

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CaseManager {
	private Connection conn;
	private PreparedStatement pstate;
	private ResultSet result;
	private DataSource ds;

	private int howPage = 10;
	private int ttlPage;
	private int nowPage;
	private int cnt;
	private int count;
	

	public CaseManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("CaseManager err:" + e);
		}
	}
	
	public ArrayList<CaseDto> loadCase(String nowPage, String name, String title, String areas) { // 인덱스에서 사건을 로드하는 매서드
		ArrayList<CaseDto> list = new ArrayList<>();
		String sql;
		try {

			if (name == null && title == null || name.equals("x") && title.equals("x")) { // 처음 접속 혹은 페이지만 바뀔 때
				sql = "select * from cases where (status = '1') and (area = ?) order by no desc";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, areas);
				result = pstate.executeQuery();
			} else if (title == null || title.equals("x")) { // 작성자를 검색했을 때
				sql = "select * from cases where (id like ?) and (status = '1') and (area = ?) order by no desc";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+name+"%");
				pstate.setString(2, areas);
				result = pstate.executeQuery();
				nowPage = "1";
			} else if (name == null || name.equals("x")) { // 내용을 검색했을 때
				sql = "select * from cases where (title like ?) and (status = '1') and (area = ?) order by no desc";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+title+"%");
				pstate.setString(2, areas);
				result = pstate.executeQuery();
				nowPage = "1";
			}
			this.nowPage = Integer.parseInt(nowPage);
			if (this.nowPage > 1) {
				for (int i = 0; i < (this.nowPage - 1) * howPage; i++) {
					result.next();
				}
			}
			count = 0;
			while (result.next() && count < 10) {
				CaseDto dto = new CaseDto();
				dto.setNo(result.getString("no"));
				dto.setTitle(result.getString("title"));
				dto.setId(result.getString("id"));
				dto.setTime(result.getString("time"));
				dto.setStatus(result.getString("status"));
				count++;
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("loadCase err:" + e);
		} finally {
			try {
				if (result != null)
					result.close();
				if (pstate != null)
					pstate.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("loadCase err:" + e2);
			}
		}
		return list;
	}
	
	public int calcPage(String name, String title, String areas) {
		String sql;
		try {
			if (name == null && title == null || name.equals("x") && title.equals("x")) { // 처음 접속 혹은 페이지만 바뀔 때
				sql = "select no from cases where (status = '1') and (area = ?)";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, areas);
				result = pstate.executeQuery();
			} else if (title == null || title.equals("x")) { // 작성자를 검색했을 때
				sql = "select * from cases where (id like ?) and (status = '1') and (area = ?)";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+name+"%");
				pstate.setString(2, areas);
				result = pstate.executeQuery();
			} else if (name == null || name.equals("x")) { // 내용을 검색했을 때
				sql = "select * from cases where (title like ?) and (status = '1') and (area = ?)";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+title+"%");
				pstate.setString(2, areas);
				result = pstate.executeQuery();
			}
			while (result.next()) {
				cnt++;
			}
			if (cnt % howPage == 0) {
				ttlPage = cnt / howPage;
			} else {
				ttlPage = cnt / howPage + 1;
			}
		} catch (Exception e) {
			System.out.println("calcPage err" + e);
		} finally {
			try {
				if (result != null)
					result.close();
				if (pstate != null)
					pstate.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("calcPage err:" + e2);
			}
		}
		return ttlPage;
	}
	
	public CaseDto getCaseData(String no) {	//신고목록 상세보기
		String sql = "select * from cases where no=?";
		CaseDto dto = null;
		try {
			conn =ds.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, no);
			result = pstate.executeQuery();
			if(result.next()) {
				dto = new CaseDto();
				dto.setArea(result.getString("area"));
				dto.setType(result.getString("type"));
				dto.setDetail(result.getString("detail"));
				dto.setId(result.getString("id"));
				dto.setNo(result.getString("no"));
				dto.setTitle(result.getString("title"));
				dto.setContent(result.getString("content"));
				dto.setTime(result.getString("time"));
				dto.setStatus(result.getString("status"));
				dto.setHeroes(result.getString("heroes"));
			}
			
		} catch (Exception e) {
			System.out.println("getCaseData err" + e);
		}finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getCaseData err:" +e2);
			}
		}
		return dto;
	}
	
	public ArrayList<String> recommand(String char1, String char2, String areas) {
		ArrayList<String> list = new ArrayList<>();
		if(char1.equals("villian")) {
			String sql = "select * from villain_match where name=?";
			try {
				conn =ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, char2);
				result = pstate.executeQuery();
				if(result.next()) {
					list.add(result.getString("hero1"));
					list.add(result.getString("hero2"));
					list.add(result.getString("hero3"));
					list.add(result.getString("hero4"));
					list.add(result.getString("hero5"));
					list.add(result.getString("hero6"));
					list.add(result.getString("hero7"));
					list.add(result.getString("hero8"));
					list.add(result.getString("hero9"));
					list.add(result.getString("hero10"));
				}
				
			} catch (Exception e) {
				System.out.println("getCaseData err" + e);
			}finally {
				try {
					if(result != null) result.close();
					if(pstate != null) pstate.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					System.out.println("getCaseData err:" +e2);
				}
			}
		} else if (char1.equals("nature")) {
			String sql = "select heroes.name from heroes left outer join superpower on heroes.name = superpower.name where (superpower."+char2+"='1') and (heroes.groups = ?)";
			try {
				conn =ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, areas);
				result = pstate.executeQuery();
				while(result.next()) {
					list.add(result.getString(1));
				}
				
			} catch (Exception e) {
				System.out.println("getCaseData err" + e);
			}finally {
				try {
					if(result != null) result.close();
					if(pstate != null) pstate.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					System.out.println("getCaseData err:" +e2);
				}
			}
		}

		return list;
	}
	
	
	public ArrayList<String> heroAll(String con, String areas) {
		ArrayList<String> list = new ArrayList<>();
		String sql = "select heroes.name from heroes left outer join hero_event on heroes.name = hero_event.name where (heroes.name like ?) and (hero_event.status = '0') and (heroes.groups = ?)";
		try {
			conn =ds.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, "%"+con+"%");
			pstate.setString(2, areas);
			result = pstate.executeQuery();
			int count = 0;
			while(result.next() && count < 10) {
				list.add(result.getString(1));
				count++;
			}
			
		} catch (Exception e) {
			System.out.println("getCaseData err" + e);
		}finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getCaseData err:" +e2);
			}
		}

		return list;
	}
	
	public boolean updateHero(ArrayList<String> list, String number) {
		boolean b = true;
		String sql = "update hero_event set status = '1', curr_event_id = ?, accum_event_num = accum_event_num + 1 where name = ?";
		int no = Integer.parseInt(number);
		try {
			conn =ds.getConnection();
			pstate = conn.prepareStatement(sql);
			for (int i = 0; i < list.size(); i++) {
				pstate.setInt(1, no);
				pstate.setString(2, list.get(i));
				if(pstate.executeUpdate()==0) {
					b= false;
					break;
				}
			}
		} catch (Exception e) {
			System.out.println("getCaseData err" + e);
		}finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getCaseData err:" +e2);
			}
		}
		return b;
	}
	
	public boolean updateCase(ArrayList<String> list, String number) {
		boolean b = true;
		String sql = "update cases set status = '2', heroes = ? where no = ?";
		String heroes = "";
		try {
			conn =ds.getConnection();
			pstate = conn.prepareStatement(sql);
			for (int i = 0; i < list.size(); i++) {
				if(i == 0) {
					heroes += list.get(i);
				} else {
					heroes += ", "+list.get(i);
					
				}
			}				

			pstate.setString(1, heroes);
			pstate.setString(2, number);
			if(pstate.executeUpdate() != 1) {
				b= false;
			}
		} catch (Exception e) {
			System.out.println("getCaseData err" + e);
		}finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getCaseData err:" +e2);
			}
		}
		return b;
	}
	
	public boolean checkHero(String name, String areas) {
		boolean b = false;
		String sql = "select heroes.groups, hero_event.status from heroes left outer join hero_event on heroes.name = hero_event.name where (heroes.name = ?)";
		try {
			conn =ds.getConnection();
			pstate = conn.prepareStatement(sql);		
			pstate.setString(1, name);
			result = pstate.executeQuery();
			result.next();
			if(result.getInt(2) == 1 || !result.getString(1).equals(areas)) {
				b = false;
			} else {
				b = true;
			}
		} catch (Exception e) {
			System.out.println("getCaseData err" + e);
		}finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getCaseData err:" +e2);
			}
		}
		return b;
	}
	
	public boolean complete(String no) {
		boolean b = true;
		String sql = "update cases set status = '3' where no = ?";
		try {
			conn =ds.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, no);
			if(pstate.executeUpdate() != 1) {
				b= false;
			}
		} catch (Exception e) {
			System.out.println("getCaseData err" + e);
		}finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getCaseData err:" +e2);
			}
		}
		return b;
	}
	
	public ArrayList<CaseDto> loadCase2(String nowPage, String name, String title, String areas) { // 인덱스에서 사건을 로드하는 매서드
		ArrayList<CaseDto> list = new ArrayList<>();
		String sql;
		try {
			sql = "select * from cases where (status in ('2','3')) and (area = ?) order by status, no desc";
			conn = ds.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, areas);
			result = pstate.executeQuery();
			if (name == null && title == null || name.equals("x") && title.equals("x")) { // 처음 접속 혹은 페이지만 바뀔 때
				
			} else if (title == null || title.equals("x")) { // 작성자를 검색했을 때
				sql = "select * from cases where (id like ?) and (status in ('2','3')) and (area = ?) order by status, no desc";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+name+"%");
				pstate.setString(2, areas);
				result = pstate.executeQuery();
				nowPage = "1";
			} else if (name == null || name.equals("x")) { // 내용을 검색했을 때
				sql = "select * from cases where (title like ?) and (status in ('2','3')) and (area = ?) order by status, no desc";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+title+"%");
				pstate.setString(2, areas);
				result = pstate.executeQuery();
				nowPage = "1";
			}
			this.nowPage = Integer.parseInt(nowPage);
			if (this.nowPage > 1) {
				for (int i = 0; i < (this.nowPage - 1) * howPage; i++) {
					result.next();
				}
			}
			count = 0;
			while (result.next() && count < 10) {
				CaseDto dto = new CaseDto();
				dto.setNo(result.getString("no"));
				dto.setTitle(result.getString("title"));
				dto.setId(result.getString("id"));
				dto.setTime(result.getString("time"));
				dto.setStatus(result.getString("status"));
				count++;
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("loadCase err:" + e);
		} finally {
			try {
				if (result != null)
					result.close();
				if (pstate != null)
					pstate.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("loadCase err:" + e2);
			}
		}
		return list;
	}
	
	public int calcPage2(String name, String title, String areas) {
		String sql;
		try {
			if (name == null && title == null || name.equals("x") && title.equals("x")) { // 처음 접속 혹은 페이지만 바뀔 때
				sql = "select no from cases where status in ('3','2') and (area = ?)";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, areas);
				result = pstate.executeQuery();
			} else if (title == null || title.equals("x")) { // 작성자를 검색했을 때
				sql = "select * from cases where (id like ?) and (status in ('3','2')) and (area = ?)";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+name+"%");
				pstate.setString(2, areas);
				result = pstate.executeQuery();
			} else if (name == null || name.equals("x")) { // 내용을 검색했을 때
				sql = "select * from cases where (title like ?) and (status in ('3','2')) and (area = ?)";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+title+"%");
				pstate.setString(2, areas);
				result = pstate.executeQuery();
			}
			while (result.next()) {
				cnt++;
			}
			if (cnt % howPage == 0) {
				ttlPage = cnt / howPage;
			} else {
				ttlPage = cnt / howPage + 1;
			}
		} catch (Exception e) {
			System.out.println("calcPage err" + e);
		} finally {
			try {
				if (result != null)
					result.close();
				if (pstate != null)
					pstate.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("calcPage err:" + e2);
			}
		}
		return ttlPage;
	}
	
	
	public boolean updateHero2(String number) {
		boolean b = true;
		String sql = "update hero_event set status = '0', curr_event_id = '0' where curr_event_id=?";
		int no = Integer.parseInt(number);
		try {
			conn =ds.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setInt(1, no);
			if(pstate.executeUpdate() < 1) {
				b = false;
			}
		} catch (Exception e) {
			System.out.println("getCaseData err" + e);
		}finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getCaseData err:" +e2);
			}
		}
		return b;
	}
	
	
	
	public ArrayList<String> filter(String gender, String publisher, String height, String weight, String areas) {
		ArrayList<String> list = new ArrayList<>();
			String sql = "select heroes.name from heroes left outer join hero_event on heroes.name = hero_event.name where (hero_event.status = '0') and (heroes.groups = ?) and ";

			try {
				conn =ds.getConnection();
				
				
				
				if(gender.equals("Male")) {
					sql += "(heroes.gender = 'male') and ";
				}else if(gender.equals("Female")) {
					sql += "(heroes.gender = 'Female') and ";
				}else {
					
				}
				 
				
				
				if(publisher.equals("Marvel")) {
					sql += "(heroes.publisher = 'Marvel Comics') and ";
				} else if (publisher.equals("DC")) {
					sql += "(heroes.publisher = 'DC Comics') and ";
				} else if (publisher.equals("else")){
					sql += "(heroes.publisher not in ('Marvel Comics', 'DC Comics')) and ";
				} else {
					
				}
				
				
				
				
				if(height.equals("1")) {
					sql += "(heroes.height > '0') and (heroes.height <= '180') and ";	
				} else if(height.equals("2")) {
					sql += "(heroes.height > '180') and (heroes.height <= '200') and ";	
				} else if(height.equals("3")) {
					sql += "(heroes.height > '200') and ";	
				} else if(height.equals("4")) {
					sql += "(heroes.height = '0') and ";	
				} else {
					
				}
				
				
				
				
				
				
				if(weight.equals("1")) {
					sql += "(heroes.weight > '0') and (heroes.weight <= '80') and ";	
				} else if(weight.equals("2")) {
					sql += "(heroes.weight > '80') and ";
				} else if(weight.equals("3")) {
					sql += "(heroes.weight = '0') and ";	
				} else {
					
				}
				
				
				sql = sql.substring(0, (sql.length()-5));

				
			

				pstate = conn.prepareStatement(sql);
				pstate.setString(1, areas);
				result = pstate.executeQuery();
				
				
				
				

				while(result.next()) {
					list.add(result.getString(1));
				}
				

				
			} catch (Exception e) {
				System.out.println("getCaseData err" + e);
			}finally {
				try {
					if(result != null) result.close();
					if(pstate != null) pstate.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					System.out.println("getCaseData err:" +e2);
				}
			}

		return list;
	}

}