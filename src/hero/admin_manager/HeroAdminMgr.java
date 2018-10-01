package hero.admin_manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.omg.CORBA.Request;

public class HeroAdminMgr {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	private int howPage = 10;
	private int ttlPage;
	private int attlPage;
	private int nowPage;
	private int maxNo;
	private int cnt;
	private int count;
	
	public HeroAdminMgr() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("HeroManager err : " + e);
		}
	}
	
	public ArrayList<HeroBean> getHeroesAll(String stype, String sword) { // 영웅 전체 목록
		ArrayList<HeroBean> list = new ArrayList<>();
		try {
			String sql = "select * from heroes";
			conn = ds.getConnection();
			if (sword == null) {
				pstmt = conn.prepareStatement(sql);
			} else {// 검색
				sql += " where " + stype + " like ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + sword + "%");
			}
			rs = pstmt.executeQuery();

			while(rs.next()) {
				HeroBean bean = new HeroBean();
				bean.setName(rs.getString("name"));
				bean.setGender(rs.getString("gender"));
				bean.setEye_color(rs.getString("eye_color"));
				bean.setRace(rs.getString("race"));
				bean.setHair_color(rs.getString("hair_color"));
				bean.setHeight(rs.getInt("height"));
				bean.setWeight(rs.getInt("weight"));
				bean.setPublisher(rs.getString("publisher"));
				bean.setSkin_color(rs.getString("skin_color"));
				bean.setAlignment(rs.getString("alignment"));
				bean.setGroups(rs.getInt("groups"));
				bean.setApproval(rs.getInt("approval"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getHeroesAll err : " + e);
		}  finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
		}
		return list;
	}
	
	public HeroBean getHeroDetail(String name) { // 영웅 개인 정보
		HeroBean bean = null;
		try {
			conn = ds.getConnection();
			String sql = "select gender, eye_color, race, hair_color, height, weight, publisher, skin_color, alignment, groups, level from heroes inner join power_level on heroes.name = power_level.name where heroes.name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new HeroBean();
				bean.setGender(rs.getString("gender"));
				bean.setEye_color(rs.getString("eye_color"));
				bean.setRace(rs.getString("race"));
				bean.setHair_color(rs.getString("hair_color"));
				bean.setHeight(rs.getInt("height"));
				bean.setWeight(rs.getInt("weight"));
				bean.setPublisher(rs.getString("publisher"));
				bean.setSkin_color(rs.getString("skin_color"));
				bean.setAlignment(rs.getString("alignment"));
				bean.setGroups(rs.getInt("groups"));
				bean.setLevel(rs.getString("level"));
			}			
		} catch (Exception e) {
			System.out.println("getHeroDetail err : " + e);
		}  finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return bean;
	}
	
	public boolean updateHero(HttpServletRequest request) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "update heroes set gender=?, eye_color=?, race=? , hair_color=?, height=?, "
					+ "weight=?, publisher=?, skin_color=?, alignment=?, groups=? where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("gender"));
			pstmt.setString(2, request.getParameter("eye_color"));
			pstmt.setString(3, request.getParameter("race"));
			pstmt.setString(4, request.getParameter("hair_color"));
			pstmt.setString(5, request.getParameter("height"));
			pstmt.setString(6, request.getParameter("weight"));
			pstmt.setString(7, request.getParameter("publisher"));
			pstmt.setString(8, request.getParameter("skin_color"));
			pstmt.setString(9, request.getParameter("alignment"));
			pstmt.setString(10, request.getParameter("groups"));
			pstmt.setString(11, request.getParameter("name"));
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("updateHero() err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				
			}
		}
		
		return b;
	}
	
	public ArrayList<HeroBean> getRaceList() { // Race 목록
		ArrayList<HeroBean> race = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select distinct(race) from heroes order by race asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HeroBean bean = new HeroBean();
				bean.setRace(rs.getString("race"));
				race.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getRaceList err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				
			}
		}
		return race;
	}
	
	public ArrayList<HeroBean> getPublishersList() { // Publishers 목록
		ArrayList<HeroBean> publishers = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select distinct(publisher) from heroes order by publisher asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HeroBean bean = new HeroBean();
				bean.setPublisher(rs.getString("publisher"));
				publishers.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getPublishersList err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				
			}
		}
		return publishers;
	}
	
	public ArrayList<HeroBean> getGroupsList() { // Groups 목록
		ArrayList<HeroBean> groups = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select distinct(groups) from heroes order by groups asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HeroBean bean = new HeroBean();
				bean.setGroups(rs.getInt("groups"));
				groups.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getGroupsList err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				
			}
		}
		return groups;
	}
	
	public boolean deleteHero(HttpServletRequest request) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from heroes where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("name"));
			if(pstmt.executeUpdate() > 0 ) b = true;
		} catch (Exception e) {
			System.out.println("deleteHero() err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				
			}
		}
		
		return b;
	}
	
	public ArrayList<HeroBean> getHeroApprovalList() { // 영웅 결재 목록
		ArrayList<HeroBean> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select no, name, gender, eye_color, race, hair_color, height, weight, publisher, skin_color, alignment, groups, approval from heroes order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HeroBean bean = new HeroBean();
				if (rs.getInt("approval") == 0) {
					bean.setNo(rs.getInt("no"));
					bean.setName(rs.getString("name"));
					bean.setGender(rs.getString("gender"));
					bean.setEye_color(rs.getString("eye_color"));
					bean.setRace(rs.getString("race"));
					bean.setHair_color(rs.getString("hair_color"));
					bean.setHeight(rs.getInt("height"));
					bean.setWeight(rs.getInt("weight"));
					bean.setPublisher(rs.getString("publisher"));
					bean.setSkin_color(rs.getString("skin_color"));
					bean.setAlignment(rs.getString("alignment"));
					bean.setGroups(rs.getInt("groups"));
					bean.setApproval(rs.getInt("approval"));
					list.add(bean);					
				}
			}
		} catch (Exception e) {
			System.out.println("getHeroApprovalList err : " + e);
		}  finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
		}
		return list;
	}
	
	public int loginCheck(HttpServletRequest request) { // 관리자 로그인 체크
		int b = 0;
		String sql = "select id, area from administrator where id = ? and passwd = ?";
		try {
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("id"));
			pstmt.setString(2, request.getParameter("passwd"));
			rs = pstmt.executeQuery();
			if(rs.next()) b = rs.getInt("area");
		} catch (Exception e) {
			System.out.println("err" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) rs.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				
			}
		}
		return b;
	}
	
	public ArrayList<IncidentBean> loadCase(String nowPage, String id, String title) { // 인덱스에서 사건을 로드하는 매서드
		ArrayList<IncidentBean> list = new ArrayList<>();
		String sql;
		try {
			if (id == null && title == null) { // 처음 접속 혹은 페이지만 바뀔 때
				sql = "select * from cases order by no desc";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
			} else if (id != null) { // 작성자를 검색했을 때
				sql = "select * from cases where id like ? order by no desc";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+id+"%");
				rs = pstmt.executeQuery();
				//nowPage = "1";
			
			} else if (title != null ) { // 제목을 검색했을 때
				sql = "select * from cases where title like ? order by no desc";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+title+"%");
				rs = pstmt.executeQuery();
				//nowPage = "1";
			}
			
			//nowpage 가 1 보다 큰 경우
			this.nowPage = Integer.parseInt(nowPage);
			if (this.nowPage > 1) {
				for (int i = 0; i < (this.nowPage - 1) * howPage; i++) {
					rs.next();  
				}
			}
			
			count = 0;
			while (rs.next()&& count < 10) {		
				IncidentBean bean = new IncidentBean();
				bean.setNo(rs.getInt("no"));
				bean.setTitle(rs.getString("title"));
				bean.setArea(rs.getString("area"));
				bean.setId(rs.getString("id"));
				bean.setTime(rs.getString("time"));
				bean.setStatus(rs.getString("status"));
				count++;
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("loadCase err:" + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("loadCase err:" + e2);
			}
		}
		return list;
	}
	
	
	
	public ArrayList<IncidentBean> AreaCase(String area) { // 지역별 출력
		ArrayList<IncidentBean> list = new ArrayList<>();
		String sql;
		try {
				sql = "select * from cases where area=? order by no desc";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, area);
				rs = pstmt.executeQuery();
				
		while (rs.next()) {
				IncidentBean bean = new IncidentBean();
				bean.setNo(rs.getInt("no"));
				bean.setTitle(rs.getString("title"));
				bean.setArea(rs.getString("area"));
				bean.setId(rs.getString("id"));
				bean.setTime(rs.getString("time"));
				bean.setStatus(rs.getString("status"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("AreaCase err:" + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("AreaCase err:" + e2);
			}
		}
		return list;
	}
	
	
	public IncidentBean getIncident(String no) {	//신고목록 상세보기
		String sql = "select * from cases where no=?";
		IncidentBean bean = null;
		try {
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new IncidentBean();
				bean.setNo(rs.getInt("no"));
				bean.setId(rs.getString("id"));
				bean.setIp(rs.getString("ip"));
				bean.setTitle(rs.getString("title"));
				bean.setTime(rs.getString("time"));
				bean.setContent(rs.getString("content"));
				bean.setType(rs.getString("type"));
				bean.setArea(rs.getString("area"));
				bean.setDetail(rs.getString("detail"));
				bean.setStatus(rs.getString("status"));
			}
			
		} catch (Exception e) {
			System.out.println("getCaseData err" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getCaseData err:" +e2);
			}
		}
		return bean;
	}
	
	
	
	public int calcPage(String id, String title) {
		String sql;
		try {
			if (id == null && title == null) { // 처음 접속 혹은 페이지만 바뀔 때
				sql = "select no from cases";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			} else if (title == null) { // 작성자 검색
				sql = "select * from cases where id like ?";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+id+"%");
				rs = pstmt.executeQuery();
			} else if (id == null) { // 제목 검색했을 때
				sql = "select * from cases where title like ?";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+title+"%");
				rs = pstmt.executeQuery();
			}
			while (rs.next()) {
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
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("calcPage err:" + e2);
			}
		}
		return ttlPage;
	}

	public int calcAreaPage(String area) {
		String sql;
		try {
			if (area == null) { // 처음 접속 혹은 페이지만 바뀔 때
				sql = "select no from cases";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			} else if (area == "1" ) { // 지역검색
				sql = "select * from cases where area= 1";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			} else if (area == "2" ) { // 지역검색
				sql = "select * from cases where area= 2";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			} else if (area == "3" ) { // 지역검색
				sql = "select * from cases where area= 3";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			} else if (area == "4" ) { // 지역검색
				sql = "select * from cases where area= 4";
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}	
			while (rs.next()) {
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
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("calcPage err:" + e2);
			}
		}
		return attlPage;
	}
	
	
	
	public boolean ConfirmStatus(String no) {	//사건 배치]
		boolean c = false;
		String sql = "update cases set status=1 where no=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			if(pstmt.executeUpdate() > 0) c = true;
			
		} catch (Exception e) {
			System.out.println("updateCase err:" + e);
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("updateCase err:" + e2);
			}
		}
		return c;
	}
	
	
	public boolean CancelStatus(String no) {	//사건 배치
		boolean d = false;
		String sql = "update cases set status=4 where no=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			if(pstmt.executeUpdate() >0) d = true;
			
			
		} catch (Exception e) {
			System.out.println("CancelStatus err:" + e);
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("CancelStatus err:" + e2);
			}
		}
		return d;
	}
	
	public ArrayList<HeroBean> getmemberAll() { // 히어로 랭킹
		ArrayList<HeroBean> list = new ArrayList<>();
		String sql = "select heroes.name, gender, race, groups, level, accum_event_num from heroes inner join power_level on heroes.name=power_level.name inner join hero_event on heroes.name=hero_event.name order by accum_event_num desc LIMIT 10";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				HeroBean bean = new HeroBean();
				bean.setName(rs.getString("heroes.name"));
				bean.setGender(rs.getString("gender"));
				bean.setRace(rs.getString("race"));
				bean.setGroups(rs.getInt("groups"));
				bean.setLevel(rs.getString("level"));
				bean.setAccum_event_num(rs.getInt("accum_event_num"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getmemberAll err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	
	public boolean HeroApprovalUpdate(HttpServletRequest request) { // 영웅 결재 목록
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "update heroes set approval=? where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("approval"));
			pstmt.setString(2, request.getParameter("name"));
			if (pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("HeroApprovalUpdate err : " + e);
		}  finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
		}
		return b;
	}
	
	public boolean HeroApprovalDelete(HttpServletRequest request) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "delete from heroes where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("name"));
			if (pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("HeroApprovalDelete err : " + e);
		}  finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
		}
		return b;
	}
	
	public ArrayList<IncidentBean> getIncidentAll(String area) { // 사건 목록 불러오기
		ArrayList<IncidentBean> list = new ArrayList<>();
		String sql;
		try {
				
				sql = "select * from cases where (status = '0') order by no desc";
				conn = ds.getConnection();
					pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			while (rs.next()) {
				IncidentBean dto = new IncidentBean();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setStatus(rs.getString("status"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getIncidentAll err:" + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println("getIncidentAll err:" + e2);
			}
		}
		return list;
	}
}

