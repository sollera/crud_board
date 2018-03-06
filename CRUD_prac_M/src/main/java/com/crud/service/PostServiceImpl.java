package com.crud.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.crud.dao.PostDAO;
import com.crud.dto.PostVO;

@Service
public class PostServiceImpl implements PostService {

	@Inject
	private PostDAO dao;
	
	@Override
	public List<PostVO> selectList(int firstPost) throws Exception {

		return dao.selectList(firstPost);
	}
	
	@Override
	public List<PostVO> selectView(int viewNo) throws Exception {

		return dao.selectView(viewNo);
	}

}
