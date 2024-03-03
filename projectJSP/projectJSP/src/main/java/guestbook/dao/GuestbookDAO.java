package guestbook.dao;

import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.io.InputStreamReader;
import java.io.Reader;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import board.bean.BoardDTO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import guestbook.bean.GuestbookDTO;

import javax.sql.DataSource;

public class GuestbookDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private String driver;
	private String host;
	private String port;
	private String sid;
	private String username;
	private String password;


/*	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "1234";*/

	private DataSource ds;

	private static GuestbookDAO guestbookDAO = new GuestbookDAO();


	public static GuestbookDAO getInstance() {
		return guestbookDAO;
	}

	public GuestbookDAO() {
		try {
			Reader reader = new InputStreamReader(getClass().getClassLoader().getResourceAsStream("dev.json"), "UTF-8");
			Gson gson = new Gson();
			JsonObject jsonObject = gson.fromJson(reader, JsonObject.class);
			JsonObject database = jsonObject.getAsJsonObject("oracle");

			driver = database.get("driver").getAsString();
			host = database.get("host").getAsString();
			port = database.get("port").getAsString();
			sid = database.get("sid").getAsString();
			username = database.get("username").getAsString();
			password = database.get("password").getAsString();

			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}

	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(host+port+sid, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean guestbookWrite(GuestbookDTO guestbookDTO) {
		boolean result = false;
		String sql = "INSERT INTO guestbook (SEQ, NAME, EMAIL, HOMEPAGE, SUBJECT, CONTENT, LOGTIME) "
				+ "VALUES(seq_guestbook.NEXTVAL,  ?, ?, ?, ?, ?, SYSDATE)";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guestbookDTO.getName());
			pstmt.setString(2, guestbookDTO.getEmail());
			pstmt.setString(3, guestbookDTO.getHomepage());
			pstmt.setString(4, guestbookDTO.getSubject());
			pstmt.setString(5, guestbookDTO.getContent());

			pstmt.executeUpdate();

			result = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public List<GuestbookDTO> guestbookList(int startNum, int endNum) {
		List<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
		String sql = """
					 select * from
					(select rownum rn, tt.* from
					(select * from guestbook order by seq desc )tt
					) where rn>=? and rn <=?
				""";

		getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				GuestbookDTO guestbookDTO = new GuestbookDTO();

				guestbookDTO.setSeq(rs.getInt("seq"));
				guestbookDTO.setName(rs.getString("name"));
				guestbookDTO.setEmail(rs.getString("email"));
				guestbookDTO.setHomepage(rs.getString("homepage"));
				guestbookDTO.setSubject(rs.getString("subject"));
				guestbookDTO.setContent(rs.getString("content"));
				guestbookDTO.setLogtime(rs.getDate("logtime"));

				list.add(guestbookDTO);
			} // while

		} catch (Exception e) {
			e.printStackTrace();
			list = null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();

			}
		}
		return list;
	}

	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from board";


		getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			rs.next();
			totalA = rs.getInt(1);

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totalA;
	}
}
