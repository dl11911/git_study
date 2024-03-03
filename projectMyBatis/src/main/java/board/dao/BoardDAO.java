package board.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory;

	private static BoardDAO boardDAO = new BoardDAO();

	public static BoardDAO getInstance() {
		return boardDAO;
	}

	private BoardDAO() {
		InputStream inputStream;
		try {
			String resource = "mybatis-config.xml";
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("SqlSessionFactory 초기화 실패", e); // 추가된 코드
		}
	}

	public void boardWrite(BoardDTO boardDTO) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			sqlSession.insert("boardSQL.boardWrite", boardDTO);
			sqlSession.commit();
		}
	}

	public List<BoardDTO> boardList(int startNum, int endNum) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			Map<String, Integer> paramMap = new HashMap<>();
			paramMap.put("startNum", startNum);
			paramMap.put("endNum", endNum);
			return sqlSession.selectList("boardSQL.boardList", paramMap);
		}
	}

	public int getTotalA() {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne("boardSQL.getTotalA");
		}
	}
}
