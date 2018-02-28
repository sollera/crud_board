package com.crud.dao;

import java.util.List;

import com.crud.dto.ReplyVO;

public interface ReplyDAO {
	// 댓글 목록
    public List<ReplyVO> list(int viewno);
    public int replyCnt(int viewno);
    // 댓글 입력
    public void updateStep(int step) throws Exception;
    public void create(ReplyVO vo) throws Exception;
    // 댓글 수정
    public void update(ReplyVO vo);
    // 댓글 삭제
    public void delete(Integer rno);
}
