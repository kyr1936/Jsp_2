package com.yr.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.yr.util.DBConnector;

public class MemberDAO {
	public int memberJoin(MemberDTO dto) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into member values(?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, dto.getId());
		st.setString(2, dto.getPw());
		st.setString(3, dto.getName());
		st.setString(4, dto.getPhone());
		st.setString(5, dto.getEmail());
		st.setInt(6, dto.getAge());
		int result= st.executeUpdate();
		
		DBConnector.disConnect(con, st);
		return result;
	}
	
	public MemberDTO memberLogin(MemberDTO dto) throws Exception{
		MemberDTO m = null;
		Connection con = DBConnector.getConnect();
		
		String sql = "select * from member where id=? and pw=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, dto.getId());
		st.setString(2, dto.getPw());
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			m = new MemberDTO();
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setName(rs.getString("name"));
			m.setPhone(rs.getString("phone"));
			m.setEmail(rs.getString("email"));
			m.setAge(rs.getInt("age"));	
		}
		DBConnector.disConnect(con, st, rs);
		
		return m;
		
		
		
	}
	
	
	
	
	
	
}
