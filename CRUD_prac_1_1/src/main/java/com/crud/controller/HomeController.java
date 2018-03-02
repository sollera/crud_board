package com.crud.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.crud.dao.PostDAO;
import com.crud.dto.PostVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//@Inject
	//private MemberService service;
	@Inject
	private PostDAO dao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//글 목록 조회
	@RequestMapping("/list/{pgNo}")
	public String list(@PathVariable String pgNo,Model model) throws Exception{
		//logger.info("list");
		//페이징
		int curP = Integer.parseInt(pgNo);
		int cnt = (dao.postCnt()+9) / 10;
		
		if(curP > cnt) return "redirect:/list/1";	//에러 처리
		if(curP < 1) return "redirect:/list/1";
		
		int firstP = ((curP-1)/10)*10+1;	//페이징 시작
		model.addAttribute("firstP",firstP);
		model.addAttribute("pageCnt",cnt);	//전체 페이지 개수
		model.addAttribute("curP",curP);
		
		//글 목록
		int firstPost = 0;
		if(pgNo != null ) {
			if(pgNo.equals("")==false) {
				if(Integer.parseInt(pgNo) >= 1) firstPost = (curP-1)*10;
			}
		}
		List<PostVO> postsList = dao.selectList(firstPost);	//select 쿼리 결과를 List에 받음
		model.addAttribute("postList", postsList);	//데이터를 model을 통해 전달

		return "list";	//글 목록 보기 view
	}
	@RequestMapping(value= {"/","/list"})	//편의성
	public String list2(Model model) throws Exception{
		return "redirect:/list/1";
	}
	
	//글 상세 조회
	@RequestMapping("/postView/viewNo={viewNo}")
	public String view(@PathVariable String viewNo,Model model) throws Exception{
		dao.updateViewCnt(Integer.parseInt(viewNo));
		List<PostVO> postView = dao.selectView(Integer.parseInt(viewNo));	//select 쿼리 결과를 List에 받음
		model.addAttribute("postView", postView);	//데이터를 model을 통해 전달
		model.addAttribute("curP",dao.veiwPage(Integer.parseInt(viewNo)));
		
		return "postView";	//글 상세보기 view
	}
	
	//새글&답글 쓰기
	@RequestMapping("/write")
	public String write(Model model) throws Exception {
		model.addAttribute("ref", String.valueOf(dao.newRef()));
		model.addAttribute("textlvl", 0);
		model.addAttribute("step", 0);
		model.addAttribute("parentsno", 0);
		
		return "write";	//글 쓰기 입력폼 페이지
	}
	
	//DB에 글 저장
	@RequestMapping(value = "/writePost", method = RequestMethod.POST)
	public String insert(PostVO vo) throws Exception{
		dao.insertPost(vo);	//index 페이지에서 입력된 데이터들을  MemberVo를 통해 객체화시킨 후 MemberDAO를 통해 DB에 insert 
		return "redirect:/postView/viewNo="+String.valueOf(dao.viewno(vo.getTitle()));	//쓴 글 보여주는 페이지로 이동
	}
	
	//DB에 댓글 저장
		@RequestMapping(value = "/writeReply", method = RequestMethod.POST)
		public void insertReply(PostVO vo) throws Exception{
			dao.insertPost(vo);	//index 페이지에서 입력된 데이터들을  MemberVo를 통해 객체화시킨 후 MemberDAO를 통해 DB에 insert 
		}
	
	//수정 뷰
	@RequestMapping("/update/viewNo={viewNo}")
	public String update(@PathVariable String viewNo,Model model,PostVO vo) throws Exception{
		List<PostVO> updatePrepare = dao.selectView(Integer.parseInt(viewNo));	//select 쿼리 결과를 List에 받음
		model.addAttribute("updateView", updatePrepare);	//데이터를 model을 통해 전달
		
		return "update";
	}
	
	//수정 반영
	@RequestMapping(value = "/update/updatePost", method = RequestMethod.POST)
	public String updatePost(HttpServletRequest httpServletRequest,PostVO vo) throws Exception{
		dao.updatePost(vo);
		System.out.println(vo.getTitle()+"/"+vo.getContent());
		return "redirect:/postView/viewNo="+vo.getViewNo();	//쓴 글 보여주는 페이지로 이동
	}
	
	//글 삭제
	@RequestMapping("/delete/{viewNo}")
	public String delete(@PathVariable int viewNo) throws Exception{
		if(dao.selectRangeForDel(viewNo) == -1) dao.deletePost(viewNo); 	//해당 글 이하에 같은 글수준의 글이 없다면 해당글 이하 전부 삭제
		else dao.deletePostLimit(viewNo, dao.selectRangeForDel(viewNo));	//같은 글수준이 있다면 그 전까지만 삭제
		
		return "redirect:/list/1";	//삭제처리 후 글 목록으로 이동
	}
	
}
