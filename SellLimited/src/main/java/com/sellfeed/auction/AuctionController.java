package com.sellfeed.auction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sellfeed.account.AccountDao;
import com.sellfeed.account.AccountLogic;
import com.sellfeed.aucLog.AucLogLogic;
import com.sellfeed.product.ProductLogic;


@Controller
@RequestMapping(value="/auction")
public class AuctionController {
	Logger logger = LoggerFactory.getLogger(AuctionController.class);
	@Autowired
	public ProductLogic productLogic = null;
	@Autowired
	public AuctionLogic auctionLogic = null;
	@Autowired
	public AccountLogic accountLogic = null;
	@Autowired
	public AucLogLogic aucLogLogic = null;
	@Autowired
	public AccountDao accountDao = null;
	
	//관리자페이지에서 경매결산에서 경매종료 버튼 눌렀을 때
	@GetMapping("/endAuction.sf")
	public String endAuction(@RequestParam Map<String,Object> pMap) {
		logger.info("Controller|endAuction 호출 성공");
		int result = auctionLogic.endAuction(pMap);
		if (result == 1){
			//구매자 계좌에 INSERT
			pMap.put("mem_id", pMap.get("bidder_id"));
			pMap.put("trade", "출금");
			pMap.put("trade_target", "SELLIMITED");
			pMap.put("trade_detail", "경매 낙찰");
			Map<String,Object> rMap = new HashMap<>();
			rMap = accountLogic.accountIns(pMap);
			//중간계좌에 INSERT
			pMap.put("mem_id", "manager");
			pMap.put("trade", "입금");
			pMap.put("trade_target", pMap.get("bidder_id"));
			pMap.put("trade_detail", "경매 낙찰");
			accountLogic.accountIns(pMap);
			}
		return "redirect:/auction/endAuctionList.sf";				
	}
	
	//관리자 페이지에서 경매승인해주는 부분의 리스트 뽑아오는 것.
	@GetMapping(value="/beforeAuctionList.sf")
	public String beforeAuctionList(Model mod){
		logger.info("AuctionController beforeAuctionList호출 성공");
		List<Map<String,Object>> rList = new ArrayList<>();
		rList = auctionLogic.beforeAuctionList();
		mod.addAttribute("rList",rList);	
		return "forward:/testview/managerAuction.jsp";
	}
	
	//경매승인 버튼 눌렀을 때 
	@GetMapping(value="/auctionIns.sf")
	public String auctionIns(@RequestParam Map<String,Object> pMap) {
		logger.info("auctionController auctionIns호출 성공}");
		logger.info(""+pMap);
		auctionLogic.auctionIns(pMap);
		return "redirect:/auction/beforeAuctionList.sf";
	}
	
	//상세페이지에서 입찰하기 눌렀을 때 경매진행창으로 넘어가는 것.
	@GetMapping(value="AuctionningPage.sf")
	public String AuctionningPage(String bid_code, Model mod, HttpSession session) {
		Map<String,Object> pMap = new HashMap<>();
		Map<String,Object> rMap = new HashMap<>();
		List<Map<String,Object>> detailList = new ArrayList<>();
		List<String> photoNameList = new ArrayList<>();
		pMap.put("bid_code",bid_code);
		pMap.put("mem_id",session.getAttribute("mem_id"));
		detailList = productLogic.auctionDetail(pMap);
		int my_bid = aucLogLogic.myBid(pMap);
          for(int i=0; i<detailList.size();i++) {
             rMap = detailList.get(i);
             photoNameList.add(rMap.get("PHOTO_NAME").toString());
          }
          rMap.put("PHOTO_NAME",photoNameList);
          rMap.put("my_bid",my_bid);
		mod.addAttribute("rMap",rMap);
		return "forward:/testview/auctioningPage.jsp";
	}
	
	//관리자 페이지에서 경매 결산 리스트 가져오는 부분
	@GetMapping(value="endAuctionList.sf")
	public String endAuctionList(Model mod) {
		logger.info("Controller| endAuctionList 호출 성공");
		List<Map<String,Object>> rList = new ArrayList<>();
		rList = auctionLogic.endAuctionList();
		mod.addAttribute("rList",rList);
		return "forward:/testview/managerEndAuction.jsp";
	}
	
   //경매종료 , 수취확인
   @GetMapping(value="/auctionConfirm.sf")
   public String auctionConfirm(@RequestParam Map<String, Object> pMap) {
	    String mem_id = null;
	    if(pMap.get("mem_id")!=null) {
	    	mem_id = pMap.get("mem_id").toString();
	    }
	    accountLogic.auctionConfirm(pMap);
	    return "redirect:/product/productDelivery.sf?mem_id="+mem_id;
   }
}
