package hero.admin_manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HeroManagerMgr {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public HeroManagerMgr() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("HeroManager err : " + e);
		}
	}
	
	public ArrayList<HeroBean> getHeroesAll(String stype, String sword, String areas) { // 영웅 전체 목록
		ArrayList<HeroBean> list = new ArrayList<>();
		try {
			String sql = "select * from heroes where groups = ?";
			conn = ds.getConnection();
			if (sword == null) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, areas);
			} else {// 검색
				sql += " where " + stype + " like ?" + " and groups = ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + sword + "%");
				pstmt.setString(2, areas);
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
	
	public boolean insertHero(HttpServletRequest request) { // 영웅 등록
		boolean b = false;
		try {
			String uploadDir = "C:/work/OneDrive/KIC/Project/JSPProject/JSPProject/WebContent/datas";
			MultipartRequest multi = new MultipartRequest
					(request, uploadDir, 1024 * 1024 * 5, "utf-8", new DefaultFileRenamePolicy()); // 이미지가 오게되면 이미지를 uploadDir에 끌어 올림. 
			conn = ds.getConnection();
			String sql = "insert into heroes (name, gender, eye_color, race, hair_color, height, weight, publisher, skin_color, alignment, groups, image, approval)"
						+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name")); 
			pstmt.setString(2, multi.getParameter("gender"));
			pstmt.setString(3, multi.getParameter("eye_color"));
			pstmt.setString(4, multi.getParameter("race"));
			pstmt.setString(5, multi.getParameter("hair_color"));
			pstmt.setString(6, multi.getParameter("height"));
			pstmt.setString(7, multi.getParameter("weight"));
			pstmt.setString(8, multi.getParameter("publisher"));
			pstmt.setString(9, multi.getParameter("skin_color"));
			pstmt.setString(10, multi.getParameter("alignment"));
			pstmt.setString(11, "1");
			pstmt.setString(12, multi.getParameter("image"));
			if(multi.getFilesystemName("image") == null) { 
				pstmt.setString(12, "ready.gif");
			} else {
				pstmt.setString(12, multi.getFilesystemName("image"));
			}
			pstmt.setString(13, multi.getParameter("approval"));
			if(pstmt.executeUpdate() > 0) b=true;
		} catch (Exception e) {
			System.out.println("insertHero err : " + e);
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
	
	public ArrayList<IncidentBean> getIncidentAll(String area) { // 사건 목록 불러오기
		ArrayList<IncidentBean> list = new ArrayList<>();
		String sql;
		try {
				sql = "select * from ";
				conn = ds.getConnection();
				if(area.equals("0")) {
					sql+="cases where (status = '1') order by no desc";
					pstmt = conn.prepareStatement(sql);
				} else {
					sql+="cases where (status = '1') and area = ? order by no desc";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, area);
				}
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
}
