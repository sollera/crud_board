package com.crud.dao;

import java.util.List;

import com.crud.dto.PostVO;

public interface PostDAO {
	
	public List<PostVO> selectList(int firstPost) throws Exception;
	public int postCnt() throws Exception;
	
	public List<PostVO> selectView(int viewNo) throws Exception;
	
	public int viewno(String title) throws Exception;
	public void updateViewCnt(int viewno) throws Exception;
	public int veiwPage(int viewno) throws Exception;
	
	public int newRef() throws Exception;
	
	public void insertPost(PostVO vo);
	
	public void updatePost(PostVO vo);
	
	public int subQuery(String columnName,int viewno);
	
	public int selectRangeForDel(int viewno);
	public void deletePost(int viewno);
	public void deletePostLimit(int viewno, int nextStep);
	
}
