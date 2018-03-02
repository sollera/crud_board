package com.crud.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.crud.dao.PostDAO;
import com.crud.dao.ReplyDAO;
import com.crud.dto.ReplyVO;

// REST : Representational State Transfer
//하나의 URI가 하나의 고유한 리소스를 대표하도록 설계된 개념

//http://localhost/spring02/list?bno=1 ==> url+파라미터
//http://localhost/spring02/list/1 ==> url
//RestController은 스프링 4.0부터 지원
//@Controller, @RestController 차이점은 메서드가 종료되면 화면전환의 유무
//@Controller
@RestController
public class ReplyController {
	 
	 @Inject
	 ReplyDAO replyDao;
	 @Inject
	 PostDAO pDao;
	 	 
	 // 댓글 목록(@RestController Json방식으로 처리 : 데이터를 리턴)
	 @RequestMapping("/listJson.do/{vno}")
	 @ResponseBody // 리턴데이터를 json으로 변환(생략가능)
	 public List<ReplyVO> listJson(@PathVariable String vno){
		 System.out.println("vno = "+vno);
		 int viewno = Integer.parseInt(vno);
	     List<ReplyVO> list = replyDao.list(viewno);
	     /*
	     System.out.println("===================");
	     for(int i = 0; i < list.size();i++) {
	    	 System.out.println(list.get(i));
	     }
	     System.out.println("===================");
	     */
	     return list;
	 }
	 
	// 댓글 입력
    @RequestMapping("/insert.do")
    public void insert(@ModelAttribute ReplyVO vo) throws Exception{
    	int step = vo.getStep();
    	replyDao.updateStep(step);
    	replyDao.create(vo);
    }
    
    // 댓글 삭제
    @RequestMapping("/delete.do/{vno}")
	public void delete(@PathVariable String vno){
    	int viewno = Integer.parseInt(vno);
    	if(pDao.selectRangeForDel(viewno) == -1) pDao.deletePost(viewno); 	//해당 글 이하에 같은 글수준의 글이 없다면 해당글 이하 전부 삭제
		else pDao.deletePostLimit(viewno, pDao.selectRangeForDel(viewno));	//같은 글수준이 있다면 그 전까지만 삭제
	}
    
    // 댓글 수정
    @RequestMapping("/update.do")
    public void update(@ModelAttribute ReplyVO vo){
    	replyDao.update(vo);
	}
}