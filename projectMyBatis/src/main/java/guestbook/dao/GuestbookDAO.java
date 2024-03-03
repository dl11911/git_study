package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import guestbook.bean.GuestbookDTO;



public class GuestbookDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

//    private String driver = "oracle.jdbc.driver.OracleDriver";
//    private String url = "jdbc:oracle:thin:@localhost:1521:xe";
//    private String username = "c##java";
//    private String password = "1234";

    private DataSource ds;
    
    private static GuestbookDAO guestbookDAO = new GuestbookDAO();

    public static GuestbookDAO getInstance() {
        return guestbookDAO;
    }

    public GuestbookDAO() {
//        try {
//            Class.forName(driver);
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
    	 Context context;
  	   
  	   try {
  		context = new InitialContext();
  		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle"); //Tomcat의 경우에만 java:comp/env가 붙는다
  		
  	} catch (NamingException e) {
  		e.printStackTrace();
  		
  	}
    }

//    public void getConnection() {
//        try {
//            conn = DriverManager.getConnection(url, username, password);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
    
    public void guestbookWrite(Map<String, String> map) {
        String sql = """
                INSERT INTO guestbook (seq, name, email, homepage, subject, content, logtime)
                VALUES (seq_guestbook.nextval, ?, ?, ?, ?, ?, ?)
                """;


        try {
        	conn = ds.getConnection();
        	
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, map.get("name"));
            pstmt.setString(2, map.get("email"));
            pstmt.setString(3, map.get("homepage"));
            pstmt.setString(4, map.get("subject"));
            pstmt.setString(5, map.get("content"));

            // logtime 설정
            java.util.Date currentDate = new java.util.Date();
            java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDate.getTime());
            pstmt.setTimestamp(6, timestamp);

            pstmt.executeUpdate(); // 실행- 개수 리턴
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public List<GuestbookDTO> guestbookList(int startNum, int endNum) {
        List<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
        String sql = """
                SELECT *
                FROM (
                    SELECT ROWNUM rn, tt.*
                    FROM (
                        SELECT *
                        FROM guestbook
                        ORDER BY seq DESC
                    ) tt
                )
                WHERE rn >= ? AND rn <= ?
                """;


        try {
        	conn = ds.getConnection();
        	
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
            list = null;
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return list;
    }
    public int getTotalA() {
    	int totalA = 0;
    	String sql ="select count(*)from guestbook";
    	
    	
    	try {
    		conn = ds.getConnection();
    		
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totalA=rs.getInt(1);
			
		} catch (SQLException e) {
			
			
			e.printStackTrace();
		}finally {
			 try {
				  if(rs !=null) rs.close();
	              if (pstmt != null) pstmt.close();
	              if (conn != null) conn.close();
	          } catch (SQLException e) {
	              e.printStackTrace();
	          }
		}
    	
    	return totalA;
    }
    
    
}