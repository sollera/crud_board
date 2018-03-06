package com.crud.service;

import java.util.List;

import com.crud.dto.PostVO;

public interface PostService {
	
	public List<PostVO> selectList(int firstPost) throws Exception;
	
	public List<PostVO> selectView(int viewNo) throws Exception;
}
