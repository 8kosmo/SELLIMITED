package com.sellfeed.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	public MemberLogic memberLogic = null;
	
	@GetMapping(value="memberList.sf")
	public String memberList(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("=================>memberList 호출 성공");
		Map<String,Object> rMap = new HashMap<>();
	    rMap = memberLogic.memberList(pMap);
		mod.addAttribute("rMap",rMap);
		return "forward:/testview/memberUpd.jsp";
	}
	@PostMapping(value="memberIns.sf")
	public String memberIns(@RequestParam Map<String,Object> pMap) {
		logger.info("=================>memberIns 호출 성공");
		memberLogic.memberIns(pMap);
		return "redirect:/testview/memberIns3.jsp";//수정 예정
	}
	
   @PostMapping(value="memberUpd.sf")
   public String memberUpd(@RequestParam Map<String,Object> pMap) {
      logger.info("=================>memberUpd 호출 성공");
      memberLogic.memberUpd(pMap);
      return "forward:/testview/notice.jsp";
   }
	@GetMapping(value="memberDel.sf")
	public String memberDel(@RequestParam Map<String,Object> pMap) {
		logger.info("=================>memberDel 호출 성공");
		memberLogic.memberDel(pMap);
		return "redirect:../index.jsp";
	}
}