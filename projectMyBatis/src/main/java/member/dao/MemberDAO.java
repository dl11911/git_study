package member.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
    private SqlSessionFactory sqlSessionFactory;

    private static MemberDAO memberDAO = new MemberDAO();

    public static MemberDAO getInstance() {
        return memberDAO;
    }

    public MemberDAO() {
        InputStream inputStream;
        try {
            String resource = "mybatis-config.xml";
            inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("SqlSessionFactory 초기화 실패", e);  // 추가된 코드
        }
    }

    // 아이디 중복 체크
    public boolean isExistId(String id) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        int count = sqlSession.selectOne("memberSQL.isExistId", id);
        sqlSession.close();

        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }

    // 회원 가입
    public boolean write(MemberDTO memberDTO) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        int count = sqlSession.insert("memberSQL.write", memberDTO);
        sqlSession.commit();
        sqlSession.close();

        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }

    // 로그인
    public MemberDTO login(String id, String pwd) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        Map<String, String> map = new HashMap<>();
        map.put("id", id);
        map.put("pwd", pwd);
        MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login", map);
        sqlSession.close();
        return memberDTO;
    }
    

    // 아이디로 회원 정보 가져오기
    public MemberDTO getMemberById(String id) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMemberById", id);
        sqlSession.close();
        return memberDTO;
    }

    // 회원 정보 수정
    public boolean updateMember(MemberDTO memberDTO) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        int count = sqlSession.update("memberSQL.updateMember", memberDTO);
        sqlSession.commit();
        sqlSession.close();

        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }
}