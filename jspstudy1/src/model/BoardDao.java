package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	public int maxnum() {
		Connection conn= DbConnection.getConnection();
		java.sql.PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement("select ifnull(max(num),0) from board");
			rs=pstmt.executeQuery();
			if(rs.next())
				return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	public boolean insert(Board board) {
		Connection conn=DbConnection.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into board (num, name, pass, subject, content, file1, regdate, readcnt, grp, grplevel, grpstep) values(?,?,?,?,?,?,now(),0,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getPass());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getFile1());
			pstmt.setInt(7, board.getGrp());
			pstmt.setInt(8, board.getGrplevel());
			pstmt.setInt(9, board.getGrpstep());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, null);
		}
		return false;
	}
	public int boardCount() {
		Connection conn=DbConnection.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement("select count(*) from board");
			rs=pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	public List<Board> list(int pageNum, int limit){
		Connection conn=DbConnection.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Board> list=new ArrayList<Board>();
		String sql="select * from board order by grp desc, grpstep asc limit ?,?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,  (pageNum-1)*limit);
			pstmt.setInt(2, limit);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board b=new Board();
				b.setNum(rs.getInt("num"));
				b.setName(rs.getString("name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setGrp(rs.getInt("grp"));
				b.setGrplevel(rs.getInt("grplevel"));
				b.setGrpstep(rs.getInt("grpstep"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getTimestamp("regdate"));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	public Board selectOne(int num) {
		Connection conn=DbConnection.getConnection();
		String sql="select * from board where num=?";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num); //db에 전달할 파라미터(?)값 설정
			rs=pstmt.executeQuery();
			if(rs.next()){ //id에 해당하는 Member정보가 존재.
				Board b=new Board();
				b.setName(rs.getString("Name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subjet"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("File1"));
				b.setGrp(rs.getInt("grp"));
				b.setGrplevel(rs.getInt("grplevel"));
				b.setGrpstep(rs.getInt("grpstep"));
				return b;//id에 해당하는 db의 정보 저장
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return null;
       }
	public void readcntAdd(int num) {
		Connection conn=DbConnection.getConnection();
		String sql="update board set readcnt=? where num=?";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = conn.prepareStatement(sql);
            int now = selectOne(num).getReadcnt();
            pstmt.setInt(1,now+1);
            pstmt.setInt(2,num);
            rs = pstmt.executeQuery();
            return;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return;
	}
}
