package com.spiritgarage.www.notice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spiritgarage.www.notice.service.NoticeService;
import com.spiritgarage.www.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping(value = "/notice")
	public String notice(Model model , HttpServletRequest request , HttpServletResponse response) throws Exception{
		model.addAttribute("viewDivision","noticePage");
		return "user/notice";
	}
	
	@RequestMapping(value = "/notice/getNoticeList")
	@ResponseBody
	public Map<String, Object> getNoticeList(NoticeVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getNoticeList(vo);
	}
	
	@RequestMapping(value = "/noticeContentView")
	public String noticeContentView(Model model , NoticeVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		model.addAttribute("viewDivision","noticePage");
		model.addAttribute("noticeSeq",vo.getNoticeSeq());
		return "user/notice_content_view";
	}
	
	@RequestMapping(value = "/notice/getNoticeInfo")
	@ResponseBody
	public NoticeVO getNoticeInfo(NoticeVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getNoticeInfo(vo);
	}
	
}
