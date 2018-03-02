package com.crud.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crud.dto.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
    @Inject
    SqlSession sqlSession;
    
    private static final String Namespace = "com.kopoctc.mapper.replyMapper";
    
    // 댓글 목록
    @Override
    public List<ReplyVO> list(int viewno) {
        return sqlSession.selectList(Namespace+".listReply", viewno);
    }
    // 댓글 개수
	@Override
	public int replyCnt(int viewno) {
		return sqlSession.selectOne(Namespace+".replyCnt",viewno);
	}
    // 댓글 작성
	@Override
    public void updateStep(int step) throws Exception {
		sqlSession.update(Namespace+".updateForReply",step);
    }
    @Override
    public void create(ReplyVO vo) throws Exception {
    	sqlSession.insert(Namespace+".insertReply", vo);
    }
    // 댓글 수정
    @Override
    public void update(ReplyVO vo) {
    	sqlSession.update(Namespace+".updatePost",vo);
    }
    // 댓글 삭제
    @Override
    public void delete(int viewno) {
        
    }
 
}