package com.crud.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crud.dto.PostVO;

@Repository
public class PostDAOImpl implements PostDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.kopoctc.mapper.postMapper";
	
	//조회
	@Override
	public List<PostVO> selectList(int firstPost) throws Exception {
		return sqlSession.selectList(Namespace+".selectList",firstPost);
	}
	
	public int postCnt() throws Exception{
		return sqlSession.selectOne(Namespace+".selectCnt");
	}
	
	@Override
	public List<PostVO> selectView(int viewNo) throws Exception {
		return sqlSession.selectList(Namespace+".selectView",viewNo);
	}	
	@Override
	public void updateViewCnt(int viewno) throws Exception{
		sqlSession.update(Namespace+".updateViewCnt",viewno);
	}
	
	public int veiwPage(int viewno) throws Exception{
		int cnt1 = sqlSession.selectOne(Namespace+".selectPG1",viewno);
		int pg = cnt1/10+1;
		return pg;
	}
	
	//쓰기
	@Override
	public int viewno(String title) throws Exception {
		return sqlSession.selectOne(Namespace+".viewno",title);
	}
	
	@Override
	public int newRef() throws Exception {
		int newRef = 0;
		if(sqlSession.selectOne(Namespace+".newRef") != null) newRef = sqlSession.selectOne(Namespace+".newRef");
		return (newRef+1);
	}
	@Override
	public void insertPost(PostVO vo) {
		sqlSession.insert(Namespace+".insertPost",vo);
	}
	
	//수정
	@Override
	public void updatePost(PostVO vo) {
		sqlSession.update(Namespace+".updatePost",vo);
	}
	
	//삭제
	@Override
	public int selectRangeForDel(int viewno) {
		int step = -1;
		if(sqlSession.selectOne(Namespace+".selectRangeForDel",viewno) != null) step = sqlSession.selectOne(Namespace+".selectRangeForDel",viewno);
		return step;
	}
	
	@Override
	public int subQuery(String columnName,int viewno) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("columnName", columnName);
		map.put("viewno", viewno);
		return sqlSession.selectOne(Namespace+".subquery",map);
	}
	
	
	@Override
	public void deletePost(int viewno) {	//해당 글타레 전부 삭제
		int ref = subQuery("ref",viewno);
		int step = subQuery("step",viewno);
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("ref", ref);
		map.put("step", step);
		sqlSession.delete(Namespace+".deletePost",map);
	}
	
	@Override
	public void deletePostLimit(int viewno, int nextStep) {
		int ref = subQuery("ref",viewno);
		int step1 = subQuery("step",viewno);
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("ref", ref);
		map.put("step1", step1);
		map.put("step2", nextStep-1);
		sqlSession.delete(Namespace+".deletePostLimit",map);
	}

}
