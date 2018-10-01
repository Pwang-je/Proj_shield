package hero.member;

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
	private int maxNo;
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

	public ArrayList<CaseDto> loadCase(String nowPage, String name, String title) { // 인덱스에서 사건을 로드하는 매서드
		ArrayList<CaseDto> list = new ArrayList<>();
		String sql;
		try {

			if (name == null && title == null || name.equals("x") && title.equals("x")) { // 처음 접속 혹은 페이지만 바뀔 때
				sql = "select * from cases order by no desc";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				result = pstate.executeQuery();
			} else if (title == null || title.equals("x") ) { // 작성자를 검색했을 때
				sql = "select * from cases where id like ? order by no desc";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+name+"%");
				result = pstate.executeQuery();
			} else if (name == null || name.equals("x")) { // 내용을 검색했을 때
				sql = "select * from cases where title like ? order by no desc";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+title+"%");
				result = pstate.executeQuery();
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

	public int maxNo() { // 사건의 최고 번호를 구하는 매서드
		String sql = "select max(no) from cases";
		try {
			conn = ds.getConnection();
			pstate = conn.prepareStatement(sql);
			result = pstate.executeQuery();
			
			result.next();
			maxNo = result.getInt(1);
			if(maxNo > 0) {
				
			} else {
				maxNo = 0;
				
			}

		} catch (Exception e) {
			System.out.println("maxNo err" + e);
		} finally {
			try {
				if (result != null)
					result.close();
				if (pstate != null)
					pstate.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("maxNo err:" + e2);
			}
		}
		return maxNo;
	}

	public int calcPage(String name, String title) {
		String sql;
		try {
			if (name == null && title == null || name.equals("x") && title.equals("x")) { // 처음 접속 혹은 페이지만 바뀔 때
				sql = "select no from cases";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				result = pstate.executeQuery();
			} else if (title == null || title.equals("x") ) { // 작성자를 검색했을 때
				sql = "select * from cases where id like ?";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+name+"%");
				result = pstate.executeQuery();
			} else if (name == null || name.equals("x")) { // 내용을 검색했을 때
				sql = "select * from cases where title like ?";
				conn = ds.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "%"+title+"%");
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

	public boolean registerCase(CaseDto dto) {
		boolean b = false;
		String sql = "insert into cases values(?,?,?,?,?,?,?,?,'0',?,?,'0')";
		try {
			conn = ds.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, dto.getNo());
			pstate.setString(2, dto.getId());
			pstate.setString(3, dto.getPasswd());
			pstate.setString(4, dto.getArea());
			pstate.setString(5, dto.getTitle());
			pstate.setString(6, dto.getContent());
			pstate.setString(7, dto.getIp());
			pstate.setString(8, dto.getTime());
			pstate.setString(9, dto.getType());
			pstate.setString(10, dto.getDetail());
			if (pstate.executeUpdate() > 0) {
				b = true;
			}
		} catch (Exception e) {
			System.out.println("maxNo err" + e);
		} finally {
			try {
				if (result != null)
					result.close();
				if (pstate != null)
					pstate.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("maxNo err:" + e2);
			}
		}

		return b;
	}
	
	
	public boolean checkPass(String no, String passwd) {
		boolean b = false;
		String sql = "select passwd from cases where no = ?";
		try {
			conn = ds.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, no);
			result = pstate.executeQuery();
			result.next();
			if(passwd.equals(result.getString(1))) {
				b = true;
			}
		} catch (Exception e) {
			System.out.println("maxNo err" + e);
		} finally {
			try {
				if (result != null)
					result.close();
				if (pstate != null)
					pstate.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("maxNo err:" + e2);
			}
		}

		return b;
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
	
	public void caseDelete(String no) {
		String sql = "delete from cases where no=?";
		try {
			conn = ds.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, no);
			pstate.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("caseDelete err:" + e);
		}finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("caseDelete err:" +e2);
			}
		}
	}
	
	public ArrayList<String> loadVillian(String char1, String char2, String voca) {
		ArrayList<String> list = new ArrayList<>();
		try {
			conn =ds.getConnection();
			if(char2.equals("0~180")) {
				char1 = "superpower."+char1;
				String sql = "select villains.name from villains left outer join superpower on villains.name = superpower.name where ("+char1+" = '1') and (villains.height > ?) and (villains.height <= ?) and (villains.name like ?)";
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "0");
				pstate.setString(2, "180");
				pstate.setString(3, "%"+voca+"%");
			}else if(char2.equals("180~190")) {
				char1 = "superpower."+char1;
				String sql = "select villains.name from villains left outer join superpower on villains.name = superpower.name where ("+char1+" = '1') and (villains.height > ?) and (villains.height <= ?) and (villains.name like ?)";
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "180");
				pstate.setString(2, "190");
				pstate.setString(3, "%"+voca+"%");
			}else if(char2.equals("190~200")) {
				char1 = "superpower."+char1;
				String sql = "select villains.name from villains left outer join superpower on villains.name = superpower.name where ("+char1+" = '1') and (villains.height > ?) and (villains.height <= ?) and (villains.name like ?)";
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "190");
				pstate.setString(2, "200");
				pstate.setString(3, "%"+voca+"%");
			}else if(char2.equals("200~")) {
				char1 = "superpower."+char1;
				String sql = "select villains.name from villains left outer join superpower on villains.name = superpower.name where ("+char1+" = '1') and (villains.height > ?) and (villains.name like ?)";
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "200");
				pstate.setString(2, "%"+voca+"%");
			}else if(char2.equals("계속변화하는")) {
				char1 = "superpower."+char1;
				String sql = "select villains.name from villains left outer join superpower on villains.name = superpower.name where ("+char1+" = '1') and (villains.height = ?) and (villains.name like ?)";
				pstate = conn.prepareStatement(sql);
				pstate.setString(1, "NA");
				pstate.setString(2, "%"+voca+"%");
			} 
			result = pstate.executeQuery();
			int count = 0;
			while(result.next() && count< 10) {
				String name = result.getString(1);
				list.add(name);
				count++;
			}
			
		} catch (Exception e) {
			System.out.println("loadVillian err:" + e);
		}finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("loadVillian err:" +e2);
			}
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
