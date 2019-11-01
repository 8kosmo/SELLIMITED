package com.sellfeed.account;

import java.util.ArrayList;
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
@RequestMapping(value="/account")
public class AccountController {
   
   Logger logger = LoggerFactory.getLogger(AccountController.class);
   
   @Autowired
   public AccountLogic accountLogic = null;
   
   //마이페이지 거래내역 조희
   @GetMapping(value="/accountList.sf")
   public String accountList(@RequestParam Map<String, Object> pMap,Model mod) {
      logger.info("==========>accountList 호출 성공");
      List<Map<String,Object>> rList = null;
      int nowPage = 0;
      int pageSize = 0;
      if(pMap.get("nowPage")!=null) {
            nowPage = Integer.parseInt(pMap.get("nowPage").toString());
            logger.info("나우페이지"+nowPage+"");
       }
       if(pMap.get("pageSize")!=null) {
           pageSize = Integer.parseInt(pMap.get("pageSize").toString());
           logger.info("페이지사이즈"+pageSize+"");
       }
     pMap.put("nowPage",nowPage);
     pMap.put("pageSize",pageSize);
      rList=accountLogic.accountList(pMap);
      mod.addAttribute("rList",rList);
      return "forward:/testview/AccountList.jsp";
   }
   
   //관리자 페이지 충전 요청 리스트
   @GetMapping(value="/accountStatusList.sf")
   public String accountStatusList(Model mod) {
      logger.info("=========> accountStatusList 호출 성공");
      List<Map<String,Object>> accountStatusList = new ArrayList<>();
      accountStatusList = accountLogic.accountStatusList();
      mod.addAttribute("accountStatusList",accountStatusList);
      return "forward:/testview/managerPermissionAcct.jsp";
   }
   
   //충전신청 페이지에서 충전시 (성공,실패)
   @PostMapping(value="/accountCharge.sf")
   public String accoutnCharge(@RequestParam Map<String, Object> pMap,Model mod) {
      logger.info("==========>accountCharge 호출 성공");
      int result = 0;
      result = accountLogic.accountCharge(pMap);
      if(result==1) {
    	 mod.addAttribute("rMap",pMap);
         return "forward:/testview/cashChargeOK.jsp";   //성공시에 1, cashChargeOK.jsp로 이동합니다
      }else {
         return "forward:/testview/cashChargeFail.jsp"; 
      }
   }
   
   //관리자 충전 승인
   @GetMapping(value="/managerPermissionAcct.sf")
   public String managerPermissionAccount(@RequestParam Map<String, Object> pMap, @RequestParam("charge_code") String charge_code) {
      logger.info("managerPermissionAccount 호출 성공");
      pMap.put("trade","입금");
      pMap.put("trade_detail","충전");
      pMap.put("trade_target","sellLimited");
      accountLogic.managerPermissionAccount(charge_code,pMap);
      return"redirect:/account/accountStatusList.sf";
   }
   
   //관리자 승인 거절
   @GetMapping(value="/managerRefuseAcct.sf")
   public String managerRefuseAcct(@RequestParam("charge_code") String charge_code) {
      logger.info("managerRefuseAcct 호출 성공");
      accountLogic.managerRefuseAcct(charge_code);
      return"redirect:/account/accountStatusList.sf";
   }
   
}