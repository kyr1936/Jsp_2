package com.yr.notice;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yr.util.DBConnector;

public class NoticeDAO {
	
	public int getTotalCount() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select count(num) from notice";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		rs.next();
		int result = rs.getInt(1);
		
		DBConnector.disConnect(con, st, rs);
		return result;
	}

//	public static void main(String[] args) {
//		
//		NoticeDAO dao = new NoticeDAO();
//		for(int i=0; i<84; i++) {
//			NoticeDTO dto = new NoticeDTO();
//			
//			dto.setTitle("title"+i);
//			dto.setContents("contents");
//			dto.setWriter("writer");
//			
//			
//			try {
//				dao.insert(dto);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		
//		}
//
//	}
	
	public ArrayList<NoticeDTO> selectList(int startRow, int lastRow) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select * from " 
				+"(select rownum r, p.* from "
				+ "(select num, title, writer, reg_date, hit from notice order by num desc) p) "
				+"where r between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, startRow);
		st.setInt(2, lastRow);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<NoticeDTO> ar = new ArrayList<NoticeDTO>();
		NoticeDTO dto = null;
		
		while(rs.next()) {
			dto = new NoticeDTO();
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setWriter(rs.getString("writer"));
			dto.setReg_date(rs.getDate("reg_date"));
			dto.setHit(rs.getLong("hit"));
			ar.add(dto);
		}
		DBConnector.disConnect(con, st, rs);
		return ar;
	}
	
	
	public NoticeDTO selectOne(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select*from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		NoticeDTO dto = null;
		if(rs.next()) {
			dto = new NoticeDTO();
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setContents(rs.getString("contents"));
			dto.setWriter(rs.getString("writer"));
			dto.setReg_date(rs.getDate("reg_date"));
			dto.setHit(rs.getLong("hit"));
		}
		DBConnector.disConnect(con, st, rs);
		return dto;
	}
	public int delete(int num) throws Exception {	
		
		Connection con = DBConnector.getConnect();
		String sql= "delete notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);

		int result = st.executeUpdate();
		DBConnector.disConnect(con, st);
		return result;
		
		
	}
	
	
	public int update(NoticeDTO dto) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update notice set title=?, contents=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
	
		st.setString(1, dto.getTitle());
		st.setString(2, dto.getContents());
		st.setInt(7, dto.getNum());
		
		int result = st.executeUpdate();
		DBConnector.disConnect(con, st);
		return result;
	}
	
	

	public int insert(NoticeDTO dto) throws Exception {
		Connection con =DBConnector.getConnect();
		String sql = "insert into notice values(notice_seq.nextval, ?,?,?,sysdate,0)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, dto.getTitle());
		st.setString(2, dto.getContents());
		st.setString(3, dto.getWriter());
				
		int result = st.executeUpdate();
		DBConnector.disConnect(con, st);
		
		return result;
	
	}

}
