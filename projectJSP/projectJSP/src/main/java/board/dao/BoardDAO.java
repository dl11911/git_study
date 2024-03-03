package board.dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.io.InputStreamReader;
import java.io.Reader;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import member.bean.MemberDTO;

import javax.sql.DataSource;

public class BoardDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

	private String driver;
	private String host;
	private String port;
	private String sid;
	private String username;
	private String password;


/*    private String driver = "oracle.jdbc.driver.OracleDriver";
    private String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private String username = "c##java";
    private String password = "1234";*/

	private DataSource ds;
    
private static BoardDAO boardDAO = new BoardDAO();
    
    public static BoardDAO getInstance() {
        return boardDAO;
    }

	public BoardDAO() {
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
            conn = DriverManager.getConnection(host+port+sid,username,password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public boolean boardWrite(BoardDTO boardDTO) {
        boolean result = false;
        String sql = "insert into board(seq,id, name, email, subject, content,ref) "
                + "values(SEQ_BOARD.nextval,?,?,?,?,?,1)";
        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, boardDTO.getId());
            pstmt.setString(2, boardDTO.getName());
            pstmt.setString(3, boardDTO.getEmail());
            pstmt.setString(4, boardDTO.getSubject());
            pstmt.setString(5, boardDTO.getContent());
            
            pstmt.executeUpdate();
            
            result=true;
            
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
        return result;
    }
    
    public List<BoardDTO> boardList(int startNum, int endNum){
    	List<BoardDTO> list = new ArrayList<BoardDTO>();
    	String sql = """
						 select * from
						(select rownum rn, tt.* from 
						(select * from board order by ref desc, step asc)tt
						) where rn>=? and rn <=?
					""";

		getConnection();

		try {
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setInt(1, startNum);
    		pstmt.setInt(2, endNum);
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			BoardDTO boardDTO = new BoardDTO();
    			
    			boardDTO.setSeq(rs.getInt("seq"));
    			boardDTO.setId(rs.getString("id"));
    			boardDTO.setName(rs.getString("name"));
    			boardDTO.setEmail(rs.getString("email"));
    			boardDTO.setSubject(rs.getString("subject"));
    			boardDTO.setContent(rs.getString("content"));
    			boardDTO.setRef(rs.getInt("ref"));
    			boardDTO.setLev(rs.getInt("lev"));
    			boardDTO.setStep(rs.getInt("step"));
    			boardDTO.setPseq(rs.getInt("pseq"));
    			boardDTO.setReply(rs.getInt("reply"));
    			boardDTO.setHit(rs.getInt("hit"));
    			boardDTO.setLogtime(rs.getDate("logtime"));
    			
    			list.add(boardDTO);
    		}//while
    		
		} catch (Exception e) {
			e.printStackTrace();
			list = null;
		}finally {
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
    	 String sql = "select count(*) from board";


		 getConnection();

		 try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totalA = rs.getInt(1);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
		}
		}
    	 return totalA;
     }
}
	/*
	 * public void boardWrite(Map<String, String>map) { String sql = """ insert into
	 * board (seq, id, name, email, subject, content, ref)
	 * values(seq_board.nextval,?,?,?,?,?,seq_board.nextval) """;
	 * getConnection();
	 * 
	 * try { pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setString(1, map.get("id")); pstmt.setString(2, map.get("name"));
	 * pstmt.setString(3, map.get("email")); pstmt.setString(4, map.get("subject"));
	 * pstmt.setString(5, map.get("content"));
	 * 
	 * pstmt.executeUpdate(); //실행 - 개수 리턴
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { try { if (pstmt !=
	 * null) pstmt.close(); if (conn != null) conn.close(); } catch (SQLException e)
	 * { e.printStackTrace(); } } // TODO: handle exception } }
	 */
   ///////////////////////////////////////////////////////////////////////////////////////////// 
	/*
	 * public BoardDTO boardWrite(String id, String name, String email, String
	 * subject,String content) { BoardDTO boardDTO=null; String sql =
	 * "insert into board(seq, id, name, email, subject, content, ref) " +
	 * "values(?,?,?,?,?,?,sysdate,SEQ_BOARD.nextval)";
	 * 
	 * getConnection(); try { pstmt = conn.prepareStatement(sql); pstmt.setString(1,
	 * boardDTO.getId()); pstmt.setString(2, boardDTO.getName()); pstmt.setString(3,
	 * boardDTO.getEmail()); pstmt.setString(4, boardDTO.getSubject());
	 * pstmt.setString(5, boardDTO.getContent()); pstmt.setInt(6, 1);
	 * 
	 * rs=pstmt.executeQuery();
	 * 
	 * if(rs.next()) { boardDTO= new BoardDTO(); boardDTO.setSeq(rs.getInt("seq"));
	 * boardDTO.setName(rs.getString("name")); boardDTO.setId(rs.getString("id"));
	 * boardDTO.setEmail(rs.getString("email"));
	 * boardDTO.setSubject(rs.getString("subject"));
	 * boardDTO.setContent(rs.getString("content"));
	 * boardDTO.setRef(rs.getInt("ref")); } return boardDTO;
	 * 
	 * } catch (SQLException e) { e.printStackTrace();
	 * 
	 * } finally { try { if (pstmt != null) pstmt.close(); if (conn != null)
	 * conn.close(); } catch (SQLException e) { e.printStackTrace(); } } return
	 * boardDTO; }
	 */
    
    
//    public boolean boardWrite(BoardDTO boardDTO) {
//        String sql = "INSERT INTO board(name, id, email, subject, content) values(?,?,?,?,?)";
//
//        getConnection();
//        try {
//            pstmt = conn.prepareStatement(sql);
//            pstmt.setString(1, boardDTO.getName());
//            pstmt.setString(2, boardDTO.getId());
//            pstmt.setString(3, boardDTO.getEmail());
//            pstmt.setString(4, boardDTO.getSubject());
//            pstmt.setString(5, boardDTO.getContent());
//            
//            pstmt.executeUpdate(); //실행 - 개수 리턴
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        } finally {
//            try {
//                if (pstmt != null) pstmt.close();
//                if (conn != null) conn.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//        return true;
//    }