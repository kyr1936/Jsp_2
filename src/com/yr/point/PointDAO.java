package com.yr.point;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import com.yr.util.DBConnector;

public class PointDAO {
	//전체 개수 받아오기 getTotalCount()
	public int getTotalCount() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select count(num) from point";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		int result=0;
		rs.next();
		result=rs.getInt(1);
		
		DBConnector.disConnect(con, st, rs);
		return result;
	}
	
	
	
	//메서드명 selectList, 매개변수 없음, 리턴 arrayList
	public ArrayList<PointDTO> selectList(String search, int startRow, int lastRow) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from\r\n" + 
				"(select rownum r, p.* from\r\n" + 
				"(select * from point where name like ? order by num desc) p)\r\n" + 
				"where r between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1,"%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		
		
		ResultSet rs = st.executeQuery();
		
		
		
		ArrayList<PointDTO> ar = new ArrayList<PointDTO>();
		PointDTO dto = null;
		while(rs.next()) {
			dto = new PointDTO();
			dto.setNum(rs.getInt("num"));
			dto.setName(rs.getString("name"));
			dto.setKor(rs.getInt("kor"));
			dto.setEng(rs.getInt("eng"));
			dto.setMath(rs.getInt("math"));
			dto.setTotal(rs.getInt("total"));
			dto.setAvg(rs.getDouble("avg"));
			ar.add(dto);
		}
		DBConnector.disConnect(con, st, rs);
		return ar;
	}
	
	
	//메서드명 selectOne, 리턴 PointDTO 매개변수 int
	public PointDTO selectOne(int num)throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from point where num=?";
		PreparedStatement st  = con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		PointDTO dto = null;
		if(rs.next()) {
			dto = new PointDTO();
			dto.setNum(rs.getInt("num"));
			dto.setName(rs.getString("name"));
			dto.setKor(rs.getInt("kor"));
			dto.setEng(rs.getInt("eng"));
			dto.setMath(rs.getInt("math"));
			dto.setTotal(rs.getInt("total"));
			dto.setAvg(rs.getDouble("avg"));
		}
		
		DBConnector.disConnect(con, st, rs);
		
		return dto;
	}
	
	
	// 메서드명 delete
	// 리턴 int
	// 매개변수 int 예외 던지기
	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete point where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		DBConnector.disConnect(con, st);
		return result;
	}
	
	// 메서드명 update
	// 리턴 int
	// 매개변수 PointDTO
	public int update(PointDTO dto) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "update point set name=?, kor=?, eng=?, math=?, total=?, avg=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, dto.getName());
		st.setInt(2, dto.getKor());
		st.setInt(3, dto.getEng());
		st.setInt(4, dto.getMath());
		st.setInt(5, dto.getTotal());
		st.setDouble(6, dto.getAvg());
		st.setInt(7, dto.getNum());
		
		int result=st.executeUpdate();

		DBConnector.disConnect(con, st);
		return result;
		
	}
	
	
	
	
	//메서드명은 insert
	//리턴은 int
	//매개변수 PointDTO
	public int insert(PointDTO dto) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into point values(point_seq.nextval, ?,?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, dto.getName());
		st.setInt(2, dto.getKor());
		st.setInt(3, dto.getEng());
		st.setInt(4, dto.getMath());
		st.setInt(5, dto.getTotal());
		st.setDouble(6, dto.getAvg());
		
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(con, st);
		return result;
	
	}
	

}
