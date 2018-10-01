package hero.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

public class MemberManager {
	private 	   Connection conn;
	private PreparedStatement pstate;
	private 		ResultSet result;
	private 	   DataSource ds;
	
	public MemberManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("BoardManag2131er err:" + e);
		}
	}
	
	public boolean loginCheck(HttpServletRequest request) {
		boolean b = false;
		String sql = "select id from members where id = ? and passwd = ?";
		try {
			conn =ds.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, request.getParameter("id"));
			pstate.setString(2, request.getParameter("passwd"));
			result = pstate.executeQuery();
			if(result.next()) b = true;
		} catch (Exception e) {
			System.out.println("err" + e);
		} finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return b;
	}
	
	public boolean idCheck(String id) {
		boolean b = false;
		String sql = "select id from members where id = ?";
		try {
			conn =ds.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, id);
			result = pstate.executeQuery();
			if(result.next()) b = true;
		} catch (Exception e) {
			System.out.println("err" + e);
		} finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return b;
	}
	public boolean registerMember(MemberDto dto) {
		boolean b = false;
		//id, name, passwd, email, phone, area, job
		String sql = "insert into members values (?,?,?,?,?,?,?)";
		try {
			conn =ds.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, dto.getId());
			pstate.setString(2, dto.getName());
			pstate.setString(3, dto.getPasswd());
			pstate.setString(4, dto.getEmail());
			pstate.setString(5, dto.getPhone());
			pstate.setString(6, dto.getArea());
			pstate.setString(7, dto.getJob());
			if(pstate.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("err" + e);
		} finally {
			try {
				if(result != null) result.close();
				if(pstate != null) pstate.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return b;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
